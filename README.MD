# 🤖 Robot Framework Proof of Concept

Deze Proof of Concept demonstreert hoe je automatische tests kunt uitvoeren met [Robot Framework](https://robotframework.org/). Het project bevat:

- ✅ Een **webtest** met `SeleniumLibrary`, die inlogt op een demo-pagina
- ✅ Een **API-test** met `RequestsLibrary`, die een GET-request uitvoert en data valideert
- ✅ Integratie met **GitHub Actions** voor automatische testuitvoering bij elke push (CI/CD)

Dit project is bedoeld als basisopzet voor testautomatisering binnen kleine tot middelgrote projecten, en als leerproject voor studenten of QA-engineers die willen starten met Robot Framework.

---

## 📁 Structuur van het project
```bash
Robot-Framework-Proof-of-Concept/
│
├── .github/
│   └── workflows/
│       └── robot-tests.yml        ← CI/CD config
│
├── data/
│   └── (optioneel, als je later CSV’s toevoegt)
│
├── tests/
│   ├── WebTest.robot
│   └── ApiTest.robot
│
├── output/                        ← wordt automatisch gevuld na run
│
├── README.md                      ← uitleg + run instructies
│
├── requirements.txt              ← alle pip dependencies
```

## 🔧 Installatie

1. 📥 Installeer Python 3.10+  
2. 📦 Installeer dependencies:

```bash
pip install -r requirements.txt
```

3. 🌐 Installeer Chrome + ChromeDriver (zet driver in je PATH)

## 🚀 Testen uitvoeren

```bash
robot --outputdir output tests/
```

📂 Resultaten vind je in de output/ folder:

* log.html: volledige log
* report.html: overzicht
* output.xml: CI-compatibele output


## CI/CD met GitHub Actions
Automatische testuitvoering bij elke push naar main.

🛠️ Configuratiebestand: .github/workflows/robot-tests.yml
```yaml
name: Run Robot Tests

on:
  push:
    branches: [ main ]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-python@v4
        with:
          python-version: '3.11'
      - run: pip install -r requirements.txt
      - run: robot --outputdir output tests/
      - uses: actions/upload-artifact@v4
        with:
          name: robot-results
          path: output/

```


## 🧪 Testoverzicht
### ✅ WebTest
Test of inloggen werkt op:
http://the-internet.herokuapp.com/login

* Gebruikt SeleniumLibrary
* Vult gebruikersnaam en wachtwoord in

* Controleert op “Secure Area” pagina na login

### ✅ ApiTest
GET request naar:
https://jsonplaceholder.typicode.com/posts/1

* Gebruikt RequestsLibrary
* Controleert HTTP-status 200
* Verifieert dat userId == 1 aanwezig is in de response


## 👨‍💻 Auteur
Naam: Abdi ali

