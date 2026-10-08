# Données

Les fichiers de données ne sont pas publiés dans ce dépôt (taille et mise à jour par la source officielle).

## Télécharger les données brutes

Source : [data.gouv.fr – Bases de données annuelles des accidents corporels de la circulation routière](https://www.data.gouv.fr/datasets/bases-de-donnees-annuelles-des-accidents-corporels-de-la-circulation-routiere-annees-de-2005-a-2024)

Télécharger les 4 fichiers de l'année 2024 et les placer dans ce dossier `data/` :

- `caract-2024.csv` : caractéristiques des accidents (date, heure, lieu, météo, luminosité)
- `lieux-2024.csv` : caractéristiques des routes
- `vehicules-2024.csv` : véhicules impliqués
- `usagers-2024.csv` : personnes impliquées et gravité

Télécharger aussi le dictionnaire des données : *Description des bases de données annuelles* (PDF de l'ONISR, sur la même page).

⚠️ Ne pas ouvrir puis enregistrer ces fichiers avec Excel : Excel tronque les identifiants d'accident (notation scientifique), ce qui rend la fusion des tableaux impossible.

## Fichier nettoyé

Le notebook `notebooks/analyse_accidents.ipynb` génère `data/clean/accidents_2024_clean.csv` (125 187 lignes, 20 colonnes), utilisé par Power BI et par les requêtes SQL.
