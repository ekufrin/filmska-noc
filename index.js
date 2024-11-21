import "dotenv/config.js";
import axios from "axios";
import express from "express";
import pgPromise from "pg-promise";
import cron from "node-cron";

const pgp = pgPromise();
const db = pgp(
  `postgres://${process.env.DB_USER}:${process.env.DB_PASS}@${process.env.DB_HOST}:${process.env.DB_PORT}/${process.env.DB_NAME}`
);

const app = express();
const port = 3000;
app.use(express.static("public"));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

let rezultat = [];
let zadnjiFetch = null;

app.get("/", async (req, res) => {
  try {
    const today = new Date().toISOString().split("T")[0]; // Dobijanje današnjeg datuma u formatu YYYY-MM-DD

    if (zadnjiFetch === today) {
      // Ako je današnji datum jednak datumu zadnjeg fetch-a, renderuj jedan random film
      const randomFilm = rezultat[Math.floor(Math.random() * rezultat.length)];
      console.log("Vec sam dohvatio podatke za današnji datum. (datum:" + zadnjiFetch + ")");
      res.render("index.ejs", { film: randomFilm });
    } else {
      // Ako su datumi različiti, izvrši novi fetch
      const options = {
        method: "GET",
        url: "https://imdb188.p.rapidapi.com/api/v1/getFanFavorites",
        params: { country: "HR" },
        headers: {
          "x-rapidapi-key": process.env.IMDB_API_KEY,
          "x-rapidapi-host": "imdb188.p.rapidapi.com",
        },
      };

      const response = await axios(options);
      rezultat = response.data.data.list; // Dohvaćam array iz API-a
      for (let i = 0; i < rezultat.length; i++) {
        const film = rezultat[i];
        const options = {
          method: "POST",
          url: "https://deep-translate1.p.rapidapi.com/language/translate/v2",
          headers: {
            "x-rapidapi-key": process.env.TRANSLATE_API_KEY,
            "x-rapidapi-host": "deep-translate1.p.rapidapi.com",
            "Content-Type": "application/json",
          },
          data: {
            q: film.plot.plotText.plainText,
            source: "en",
            target: "hr",
          },
        };
        try {
          const response = await axios.request(options);
          rezultat[i].plot.plotText.plainText = response.data.data.translations.translatedText;
        } catch (error) {
          console.error(error);
        }
      }

      zadnjiFetch = today; // Ažuriraj zadnjiFetch datum
      console.log("Dohvacam podatke za današnji datum");
      const randomFilm = rezultat[Math.floor(Math.random() * rezultat.length)];
      res.render("index.ejs", { film: randomFilm });
    }
  } catch (error) {
    console.error("GREŠKA:", error.message);
    res.render("index.ejs", { film: null });
  }
});

app.get("/top", async (req, res) => {
  try {
    // Dohvati 5 filma sa najviše lajkova iz baze
    const filmovi = await db.any(`
      SELECT naziv_filma, godina_filma, likes
      FROM filmovi
      WHERE likes > 0
      ORDER BY likes DESC
      LIMIT 5
    `);
    res.render("top5.ejs", { top5Filma: filmovi });
  } catch (error) {
    console.error("GREŠKA prilikom dohvaćanja top 5 filmova, :", error);
    res.status(500).send("Dogodila se greška");
  }
});

app.post("/vote", async (req, res) => {
  const { imeFilma, godina, vrsta } = req.body;
  try {
    // Provjeri postoji li film već u bazi
    const film = await db.oneOrNone("SELECT * FROM filmovi WHERE naziv_filma = $1 AND godina_filma = $2", [
      imeFilma,
      godina,
    ]);
    if (film) {
      // Ako film postoji u bazi, ažuriraj samo likes/dislikes
      vrsta === "like"
        ? await db.one(
            "UPDATE filmovi SET likes = likes + 1 WHERE naziv_filma = $1 AND godina_filma = $2 RETURNING *",
            [imeFilma, godina]
          )
        : await db.one(
            "UPDATE filmovi SET dislikes = dislikes + 1 WHERE naziv_filma = $1 AND godina_filma = $2 RETURNING *",
            [imeFilma, godina]
          );
      res.status(200).send("Vaš glas je zabilježen.");
    } else {
      // Ako film NE postoji u bazi, dodaj ga zajedno sa likes/dislikes
      vrsta === "like"
        ? await db.one(
            "INSERT INTO filmovi (naziv_filma, godina_filma, likes, dislikes) VALUES ($1, $2, 1, 0) RETURNING *",
            [imeFilma, godina]
          )
        : await db.one(
            "INSERT INTO filmovi (naziv_filma, godina_filma, likes, dislikes) VALUES ($1, $2, 0, 1) RETURNING *",
            [imeFilma, godina]
          );
      res.status(200).send("Vaš glas je zabilježen.");
    }
  } catch (error) {
    console.error("GREŠKA prilikom spremanja glasa: ", error);
    res.status(500).send("Ups! Dogodila se greška, molimo pokušajte ponovo.");
  }
});

app.listen(port, () => {
  console.log(`Server pokrenut na portu: ${port}`);
});

// Obrisi filmove iz baze
async function obrisiFilmove() {
  try {
    await db.none("DELETE FROM filmovi");
    console.log("Podaci iz tablice filmovi su obrisani.");
  } catch (error) {
    console.error("GREŠKA prilikom brisanja podataka iz tablice filmovi:", error);
  }
}

cron.schedule(
  "0 0 1 * *",
  () => {
    console.log("Započinje brisanje podataka iz tablice filmovi...");
    obrisiFilmove();
  },
  {
    scheduled: true,
    timezone: "Europe/Zagreb",
  }
);
