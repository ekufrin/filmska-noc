import axios from "axios";
import bodyParser from "body-parser";
import express from "express";

const app = express();
const port = 3000;
app.use(express.static("public"));
app.use(bodyParser.urlencoded({ extended: true }));

let rezultat = [];
let zadnjiFetch = null;

app.get("/", async (req, res) => {
  try {
    const today = new Date().toISOString().split("T")[0]; // Dobijanje današnjeg datuma u formatu YYYY-MM-DD

    if (zadnjiFetch === today) {
      // Ako je današnji datum jednak datumu zadnjeg fetch-a, renderuj jedan random film
      const randomFilm = rezultat[Math.floor(Math.random() * rezultat.length)];
      console.log("Vec sam dohvatio podatke (datum:" + zadnjiFetch + ")");
      res.render("index.ejs", { film: randomFilm });
    } else {
      // Ako su datumi različiti, izvrši novi fetch
      const options = {
        method: "POST",
        url: "https://imdb188.p.rapidapi.com/api/v1/getPopularMovies",
        headers: {
          "x-rapidapi-key": "UPISITE VLASTITI API KLJUC", //<-- API KLJUC
          "x-rapidapi-host": "imdb188.p.rapidapi.com",
          "Content-Type": "application/json",
        },
        data: {
          limit: 200,
          releaseDate: {
            releaseDateRange: {
              end: "2029-12-31",
              start: "2020-01-01",
            },
          },
          userRatings: {
            aggregateRatingRange: { max: 10, min: 6 },
            ratingsCountRange: { min: 1000 },
          },
          runtime: {
            runtimeRangeMinutes: { max: 120, min: 0 },
          },
        },
      };

      const response = await axios(options);
      rezultat = response.data.data.list; // Dohvaćam array iz API-a

      zadnjiFetch = today; // Ažuriraj zadnjiFetch datum
      console.log("Dohvacam podatke za danas");
      const randomFilm = rezultat[Math.floor(Math.random() * rezultat.length)];
      res.render("index.ejs", { film: randomFilm });
    }
  } catch (error) {
    console.error("Zahtjev nije izvrsen, error:", error.message);
    res.render("index.ejs", { film: null });
  }
});

app.listen(port, () => {
  console.log("Server radi");
});
