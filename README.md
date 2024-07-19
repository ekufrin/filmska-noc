
# Filmska noć

Nemate inspiraciju koji film pogledati? Isprobajte film generator koji pomoću IMDB API-a dohvaća trenutno popularne filmove.




## API ključ

Da bi koristili ovaj projekt, generirajte Vaš API ključ ovdje:

`https://rapidapi.com/DataCrawler/api/imdb188`

Kreirajte .env datoteku i ispunite vlastite podatke:
```bash
API_KEY = VAS RAPIDAPI KLJUC
DB_USER = USERNAME BAZE
DB_PASS = PASSWORD BAZE
DB_HOST = HOST BAZE
DB_PORT = PORT BAZE
DB_NAME = NAZIV BAZE
```


## Instalacija i pokretanje

```bash
  git clone https://github.com/emanuelkufrin/filmska-noc.git
  cd filmska-noc
  npm i -y
  nodemon index.js
```
    
## Features

- Minimalno korištenje API-a (1 request dnevno)
- Klikom na naziv filma vodi na IMDB stranicu filma
- Prikaz IMDB ocjene
- Mogućnost lajkanja/dislajkanja filmova
- Top 5 filmova mjeseca po odabiru korisnika na temelju lajkova (/top)
- Responzivnost (PC i mobile)


## Izgled stranice

![Landing page](https://raw.githubusercontent.com/emanuelkufrin/filmska-noc/37635a0f95f91aa6a467a2d6ff73c648ef2be005/screenshot_1.png)
![Top 5](https://raw.githubusercontent.com/emanuelkufrin/filmska-noc/37635a0f95f91aa6a467a2d6ff73c648ef2be005/screenshot_2.png)

## Video
![Gif](https://raw.githubusercontent.com/emanuelkufrin/filmska-noc/main/showcase.gif)
