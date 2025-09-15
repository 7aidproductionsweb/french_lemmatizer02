# 1. Utiliser une image Python officielle et récente
FROM python:3.11-slim

# 2. Définir le dossier de travail dans le conteneur
WORKDIR /app

# 3. Copier d'abord le fichier des dépendances
COPY requirements.txt .

# 4. Installer les dépendances (cette étape sera mise en cache si requirements.txt ne change pas)
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copier le reste du code de l'application
COPY . .

# 6. Exposer le port que l'application utilisera
EXPOSE 8080

# 7. La commande pour lancer l'application (Back4App fournira la variable $PORT)
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]
