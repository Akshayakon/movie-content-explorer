# Netflix Content Explorer (SQL project)

Explores the Kaggle **Netflix Titles** dataset (7,787 titles, added 2008 to Jan 2021) with SQL on SQLite.

**SQL skills:** `LIKE`, `DISTINCT`, `GROUP BY`, `ORDER BY`, date filtering (plus a recursive CTE to split multi-value columns).

## Run it

```
python scripts/build_db.py      # CSV -> netflix.db (raw table, clean table, views)
python scripts/run_analysis.py  # runs sql/03_analysis.sql -> output/results.md + output/q*.csv
```

Python 3 standard library only. You can also open `netflix.db` in any SQLite client and run `sql/03_analysis.sql` directly.

## Layout

| Path | Purpose |
|---|---|
| `data/netflix_titles.csv` | Source data (same file as the Kaggle dataset, fetched from the TidyTuesday mirror) |
| `sql/01_schema.sql` | Raw staging table |
| `sql/02_clean.sql` | `titles` table (blanks to NULL, ISO dates, numeric duration) and `title_countries` / `title_genres` views that split comma lists |
| `sql/03_analysis.sql` | 19 analysis queries |
| `output/results.md`, `output/q*.csv` | Query results |

## Key findings

**Movies vs. TV shows**
- 69.1% Movies (5,377) vs 30.9% TV Shows (2,410).
- By release year, movies peaked in 2017 (744), while TV shows kept growing and passed movies in 2020 (457 vs 411).
- By year added, 2019 was the peak (2,153 titles); movies outnumber TV shows every year, with TV holding a steady ~30-40% share (34% in 2015, 35% in 2020).
- Monthly additions dipped in Feb 2020 (117), the lowest month of Oct 2019 to Dec 2020.

**Top countries** (a co-produced title counts for each country)
1. United States 3,297 · 2. India 990 · 3. United Kingdom 723 · 4. Canada 412 · 5. France 349
- India is 92% movies (915 of 990), while the UK is the most TV-heavy of the top five (35% TV).

**Most common genres**
- Overall: International Movies (2,437), Dramas (2,106), Comedies (1,471).
- TV: International TV Shows (1,199), TV Dramas (704), TV Comedies (525).

**Longest movies**
1. *Black Mirror: Bandersnatch* 312 min · 2. *The School of Mischief* 253 · 3. *No Longer kids* 237 · 4. *Lock Your Girls In* 233 · 5. *Raya and Sakina* 230
- Average movie length fell from 142 min (1960s) to 90 min (2020s).

## Notes and caveats

- Genres are stored as comma lists, so one title counts toward every genre it lists. Genre counts therefore add up to more than the title count.
- The `listed_in` genres include type-specific labels ("International Movies" vs "International TV Shows"), so overall rankings mix the two.
- 2021 release year is partial (the data ends Jan 2021), and 10 titles have no `date_added`.
- *Bandersnatch* is an interactive film, so its 312 min is likely not a typical single viewing.
- Some accented characters in the source CSV arrive already corrupted (shown as the replacement character) in `director`/`cast`/`title` text; this doesn't affect any query here.
