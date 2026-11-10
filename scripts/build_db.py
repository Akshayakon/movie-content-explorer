"""Load netflix_titles.csv into SQLite and run the schema/clean SQL."""
import csv
import sqlite3
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
DB = ROOT / "netflix.db"


def main():
    if DB.exists():
        DB.unlink()
    con = sqlite3.connect(DB)
    con.executescript((ROOT / "sql/01_schema.sql").read_text(encoding="utf-8"))
    with open(ROOT / "data/netflix_titles.csv", encoding="utf-8", errors="replace", newline="") as f:
        rows = [
            (r["show_id"], r["type"], r["title"], r["director"], r["cast"], r["country"],
             r["date_added"], int(r["release_year"]), r["rating"], r["duration"],
             r["listed_in"], r["description"])
            for r in csv.DictReader(f)
        ]
    con.executemany("INSERT INTO netflix_raw VALUES (?,?,?,?,?,?,?,?,?,?,?,?)", rows)
    con.executescript((ROOT / "sql/02_clean.sql").read_text(encoding="utf-8"))
    con.commit()
    n_raw = con.execute("SELECT COUNT(*) FROM netflix_raw").fetchone()[0]
    n = con.execute("SELECT COUNT(*) FROM titles").fetchone()[0]
    print(f"Loaded {n_raw} raw rows -> {n} clean titles into {DB.name}")


if __name__ == "__main__":
    main()
