
# Filmska noć

Nemate inspiraciju koji film pogledati? Isprobajte film generator koji pomoću IMDB API-a dohvaća trenutno popularne filmove.




## API ključ

Da bi koristili ovaj projekt, generirajte Vaš API ključ ovdje:

`https://rapidapi.com/DataCrawler/api/imdb188`

Vaš ključ upišite u index.js, linija 28
```bash
"x-rapidapi-key": "UPISITE VLASTITI API KLJUC",
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
- Responzivnost (PC i mobile)


## Izgled stranice

![screenshot](screenshot.png)

