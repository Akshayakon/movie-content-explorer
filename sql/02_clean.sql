-- Clean table: blanks -> NULL, trimmed text, ISO dates, numeric duration.
DROP TABLE IF EXISTS titles;
CREATE TABLE titles AS
SELECT
    show_id,
    type,
    TRIM(title)                                   AS title,
    NULLIF(TRIM(director), '')                    AS director,
    NULLIF(TRIM(country), '')                     AS country,
    -- 'August 14, 2020' -> '2020-08-14'
    CASE WHEN TRIM(date_added) = '' THEN NULL ELSE
        substr(TRIM(date_added), -4) || '-' ||
        CASE substr(TRIM(date_added), 1, instr(TRIM(date_added), ' ') - 1)
            WHEN 'January' THEN '01' WHEN 'February' THEN '02' WHEN 'March' THEN '03'
            WHEN 'April' THEN '04' WHEN 'May' THEN '05' WHEN 'June' THEN '06'
            WHEN 'July' THEN '07' WHEN 'August' THEN '08' WHEN 'September' THEN '09'
            WHEN 'October' THEN '10' WHEN 'November' THEN '11' WHEN 'December' THEN '12'
        END || '-' ||
        printf('%02d', CAST(substr(TRIM(date_added),
              instr(TRIM(date_added), ' ') + 1,
              instr(TRIM(date_added), ',') - instr(TRIM(date_added), ' ') - 1) AS INTEGER))
    END                                           AS date_added,
    release_year,
    NULLIF(TRIM(rating), '')                      AS rating,
    CAST(substr(duration, 1, instr(duration, ' ') - 1) AS INTEGER) AS duration_value,
    substr(duration, instr(duration, ' ') + 1)    AS duration_unit,   -- 'min' | 'Season(s)'
    NULLIF(TRIM(listed_in), '')                   AS listed_in
FROM netflix_raw
WHERE duration IS NOT NULL AND TRIM(duration) <> '';

CREATE INDEX idx_titles_type ON titles(type);
CREATE INDEX idx_titles_release_year ON titles(release_year);
CREATE INDEX idx_titles_date_added ON titles(date_added);

-- Split comma-separated columns into one row per value (recursive CTE).
DROP VIEW IF EXISTS title_countries;
CREATE VIEW title_countries AS
WITH RECURSIVE split(show_id, type, item, rest) AS (
    SELECT show_id, type, '', country || ',' FROM titles WHERE country IS NOT NULL
    UNION ALL
    SELECT show_id, type,
           TRIM(substr(rest, 1, instr(rest, ',') - 1)),
           substr(rest, instr(rest, ',') + 1)
    FROM split WHERE rest <> ''
)
SELECT show_id, type, item AS country FROM split WHERE item <> '';

DROP VIEW IF EXISTS title_genres;
CREATE VIEW title_genres AS
WITH RECURSIVE split(show_id, type, item, rest) AS (
    SELECT show_id, type, '', listed_in || ',' FROM titles WHERE listed_in IS NOT NULL
    UNION ALL
    SELECT show_id, type,
           TRIM(substr(rest, 1, instr(rest, ',') - 1)),
           substr(rest, instr(rest, ',') + 1)
    FROM split WHERE rest <> ''
)
SELECT show_id, type, item AS genre FROM split WHERE item <> '';
