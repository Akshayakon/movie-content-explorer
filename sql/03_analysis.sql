-- =====================================================================
-- Netflix Content Explorer: analysis queries
-- Skills: LIKE, DISTINCT, GROUP BY, ORDER BY, date filtering
-- Each query starts with a "-- Q<n>:" title line used by scripts/run_analysis.py
-- =====================================================================

-- Q1: Dataset overview (DISTINCT counts)
SELECT COUNT(*) AS total_titles,
       COUNT(DISTINCT type) AS content_types,
       COUNT(DISTINCT rating) AS distinct_ratings,
       COUNT(DISTINCT release_year) AS distinct_release_years,
       MIN(release_year) AS earliest_release, MAX(release_year) AS latest_release,
       MIN(date_added) AS first_added, MAX(date_added) AS last_added
FROM titles;

-- Q2: Movies vs. TV shows, overall split
SELECT type, COUNT(*) AS titles,
       ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM titles), 1) AS pct
FROM titles
GROUP BY type
ORDER BY titles DESC;

-- Q3: Movies vs. TV shows by release year (2010 onward)
SELECT release_year,
       SUM(type = 'Movie')   AS movies,
       SUM(type = 'TV Show') AS tv_shows,
       COUNT(*)              AS total
FROM titles
WHERE release_year >= 2010
GROUP BY release_year
ORDER BY release_year;

-- Q4: Movies vs. TV shows by year added to Netflix (date filtering)
SELECT substr(date_added, 1, 4) AS year_added,
       SUM(type = 'Movie')   AS movies,
       SUM(type = 'TV Show') AS tv_shows,
       COUNT(*)              AS total
FROM titles
WHERE date_added >= '2015-01-01' AND date_added < '2021-01-01'
GROUP BY year_added
ORDER BY year_added;

-- Q5: Monthly additions, Oct 2019 to Dec 2020 (date filtering)
SELECT substr(date_added, 1, 7) AS month_added, COUNT(*) AS titles_added
FROM titles
WHERE date_added BETWEEN '2019-10-01' AND '2020-12-31'
GROUP BY month_added
ORDER BY month_added;

-- Q6: Top 10 countries by number of titles (multi-country titles count once per country)
SELECT country, COUNT(DISTINCT show_id) AS titles
FROM title_countries
GROUP BY country
ORDER BY titles DESC, country
LIMIT 10;

-- Q7: Top 5 countries split by Movies vs TV Shows
SELECT country,
       SUM(type = 'Movie')   AS movies,
       SUM(type = 'TV Show') AS tv_shows,
       COUNT(*)              AS total
FROM title_countries
GROUP BY country
ORDER BY total DESC
LIMIT 5;

-- Q8: Most common genres overall (top 10)
SELECT genre, COUNT(*) AS titles
FROM title_genres
GROUP BY genre
ORDER BY titles DESC, genre
LIMIT 10;

-- Q9: Most common genres, Movies only (top 5)
SELECT genre, COUNT(*) AS titles
FROM title_genres
WHERE type = 'Movie'
GROUP BY genre
ORDER BY titles DESC, genre
LIMIT 5;

-- Q10: Most common genres, TV Shows only (top 5)
SELECT genre, COUNT(*) AS titles
FROM title_genres
WHERE type = 'TV Show'
GROUP BY genre
ORDER BY titles DESC, genre
LIMIT 5;

-- Q11: Top 10 longest movies (minutes)
SELECT title, release_year, country, duration_value AS minutes
FROM titles
WHERE type = 'Movie'
ORDER BY duration_value DESC, title
LIMIT 10;

-- Q12: Longest movies released since 2015 (top 5, date filtering)
SELECT title, release_year, duration_value AS minutes
FROM titles
WHERE type = 'Movie' AND release_year >= 2015
ORDER BY duration_value DESC, title
LIMIT 5;

-- Q13: Average movie length by decade
SELECT (release_year / 10) * 10 AS decade,
       COUNT(*) AS movies,
       ROUND(AVG(duration_value), 1) AS avg_minutes
FROM titles
WHERE type = 'Movie' AND release_year >= 1960
GROUP BY decade
ORDER BY decade;

-- Q14: LIKE, titles containing "love"
SELECT type, COUNT(*) AS titles_with_love
FROM titles
WHERE title LIKE '%love%'
GROUP BY type;

-- Q15: LIKE, countries producing the most documentaries (single-country titles)
SELECT country, COUNT(*) AS documentaries
FROM titles
WHERE listed_in LIKE '%Documentaries%' AND country IS NOT NULL AND country NOT LIKE '%,%'
GROUP BY country
ORDER BY documentaries DESC, country
LIMIT 5;

-- Q16: LIKE, India-related content by rating (single or co-produced)
SELECT rating, COUNT(*) AS titles
FROM titles
WHERE country LIKE '%India%' AND rating IS NOT NULL
GROUP BY rating
ORDER BY titles DESC, rating
LIMIT 6;

-- Q17: DISTINCT, all ratings in the catalog
SELECT DISTINCT rating FROM titles WHERE rating IS NOT NULL ORDER BY rating;

-- Q18: TV shows with the most seasons
SELECT title, release_year, duration_value AS seasons
FROM titles
WHERE type = 'TV Show'
ORDER BY duration_value DESC, title
LIMIT 8;

-- Q19: Age of titles when added in 2020 (date filtering)
SELECT CASE
         WHEN CAST(substr(date_added,1,4) AS INTEGER) - release_year = 0 THEN 'Same year'
         WHEN CAST(substr(date_added,1,4) AS INTEGER) - release_year <= 2 THEN '1-2 years'
         WHEN CAST(substr(date_added,1,4) AS INTEGER) - release_year <= 10 THEN '3-10 years'
         ELSE 'Over 10 years (catalog)'
       END AS age_when_added,
       COUNT(*) AS titles
FROM titles
WHERE date_added >= '2020-01-01' AND date_added < '2021-01-01'
GROUP BY age_when_added
ORDER BY titles DESC;
