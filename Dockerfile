# 1. Utiliser une image Python officielle et récente
FROM python:3.11-slim

# 2. Installer git (C'EST LA LIGNE CORRIGÉE)
RUN apt-get update && apt-get install -y git

# 3. Définir le dossier de travail dans le conteneur
WORKDIR /app

# 4. Copier d'abord le fichier des dépendances
COPY requirements.txt .

# 5. Installer les dépendances Python
RUN pip install --no-cache-dir -r requirements.txt

# 6. Copier le reste du code de l'application
COPY . .

# 7. Exposer le port que l'application utilisera
EXPOSE 8080

# 8. La commande pour lancer l'application
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]
