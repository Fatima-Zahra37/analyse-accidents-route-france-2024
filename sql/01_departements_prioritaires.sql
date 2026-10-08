-- =====================================================================
-- Question métier : quels départements faut-il prioriser ?
-- Indicateurs : nombre d'accidents, victimes graves et taux de gravité
-- Source : data/clean/accidents_2024_clean.csv (une ligne par personne)
-- Moteur : DuckDB
-- =====================================================================

SELECT
    departement,
    COUNT(DISTINCT id_accident)                AS accidents,
    SUM(victime_grave)                         AS victimes_graves,
    ROUND(AVG(victime_grave) * 100, 1)         AS taux_gravite_pct
FROM read_csv('data/clean/accidents_2024_clean.csv',
              delim = ';', decimal_separator = ',', header = true)
GROUP BY departement
ORDER BY victimes_graves DESC
LIMIT 10;

-- Résultat clé : Paris compte le plus d'accidents (4 191) mais le taux de
-- gravité le plus bas (4,7 %) ; les départements ruraux ou montagneux
-- (Var, Pas-de-Calais, Isère) dépassent 27 %.
