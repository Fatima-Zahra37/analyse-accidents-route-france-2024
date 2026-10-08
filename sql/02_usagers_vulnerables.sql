-- =====================================================================
-- Question métier : quels usagers sont les plus vulnérables ?
-- Indicateurs : personnes impliquées, victimes graves et taux de gravité
-- Source : data/clean/accidents_2024_clean.csv (une ligne par personne)
-- Moteur : DuckDB
-- Note : dans le notebook, la colonne type_usager est construite avec un
-- CASE WHEN sur les codes BAAC (catu, catv). Les piétons sont identifiés
-- en premier (catu = 3), car ils sont rattachés au véhicule qui les a
-- percutés.
-- =====================================================================

SELECT
    type_usager,
    COUNT(*)                                   AS personnes,
    SUM(victime_grave)                         AS victimes_graves,
    ROUND(AVG(victime_grave) * 100, 1)         AS taux_gravite_pct
FROM read_csv('data/clean/accidents_2024_clean.csv',
              delim = ';', decimal_separator = ',', header = true)
GROUP BY type_usager
ORDER BY taux_gravite_pct DESC;

-- Résultat clé : deux-roues motorisés (35,3 %), piétons (32,9 %) et
-- cyclistes (27,3 %) contre 12,5 % pour les automobilistes. Les usagers
-- vulnérables représentent 30 % des personnes impliquées mais 54 % des
-- victimes graves.
