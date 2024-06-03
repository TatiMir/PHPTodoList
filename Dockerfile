# Dockerfile

# Basisimage für Python-Anwendungen herunterladen
FROM python:3.12.1-alpine


ADD Todo-Listen-Verwaltung.py .
# Benenne Port, der von der Web-App genutzt wird
# EXPOSE 5000

# Arbeitsverzeichnis im Container wechseln
# WORKDIR /app

# Notwendige Bibliotheken installieren
RUN pip install flask

# Kopiere lokale Datei in das Container-Image
# COPY Todo-Listen-Verwaltung.py /app

# Konfiguriere den Befehl, der im Container ausgeführt werden soll 
# (Anwendung Python + Skriptname als Parameter)
# ENTRYPOINT [ "python" ]
CMD ["python", "./Todo-Listen-Verwaltung.py" ]