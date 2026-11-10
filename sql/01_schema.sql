-- Raw staging table: every column loaded as-is from netflix_titles.csv
DROP TABLE IF EXISTS netflix_raw;
CREATE TABLE netflix_raw (
    show_id TEXT, type TEXT, title TEXT, director TEXT, cast TEXT, country TEXT,
    date_added TEXT, release_year INTEGER, rating TEXT, duration TEXT,
    listed_in TEXT, description TEXT
);
