from fastapi import FastAPI
from french_lefff_lemmatizer.french_lefff_lemmatizer import FrenchLefffLemmatizer

# Initialiser le lemmatiseur (se fait une seule fois au démarrage)
print("Initialisation du lemmatiseur LEFFF...")
lemmatizer = FrenchLefffLemmatizer()
print("Lemmatiseur prêt.")

app = FastAPI()

@app.post("/lemmatize")
def lemmatize_verb(data: dict):
    word = data.get("word")
    if not word:
        return {"error": "Le champ 'word' est manquant."}

    # Utiliser le lemmatiseur pour trouver l'infinitif du verbe
    # Le tag 'v' force la recherche sur les verbes
    lemme = lemmatizer.lemmatize(word, 'v')
    
    return {"lemme": lemme}

@app.get("/")
def root():
    return {"status": "Lemmatiseur LEFFF est en ligne"}
