"""Run every query in sql/03_analysis.sql; write output/results.md and output/q*.csv."""
import csv
import re
import sqlite3
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
OUT = ROOT / "output"


def main():
    OUT.mkdir(exist_ok=True)
    text = (ROOT / "sql/03_analysis.sql").read_text(encoding="utf-8")
    blocks = re.split(r"^-- (Q\d+): (.*)$", text, flags=re.M)[1:]
    con = sqlite3.connect(ROOT / "netflix.db")
    md = ["# Query results\n"]
    for i in range(0, len(blocks), 3):
        qid, title, body = blocks[i], blocks[i + 1], blocks[i + 2]
        sql = "\n".join(l for l in body.splitlines() if not l.startswith("--")).strip()
        cur = con.execute(sql)
        cols = [d[0] for d in cur.description]
        rows = cur.fetchall()
        with open(OUT / f"{qid.lower()}.csv", "w", newline="", encoding="utf-8") as f:
            w = csv.writer(f)
            w.writerow(cols)
            w.writerows(rows)
        md.append(f"## {qid}: {title}\n")
        md.append("| " + " | ".join(cols) + " |")
        md.append("|" + "---|" * len(cols))
        for r in rows:
            md.append("| " + " | ".join("" if v is None else str(v) for v in r) + " |")
        md.append("")
    (OUT / "results.md").write_text("\n".join(md), encoding="utf-8")
    print(f"Wrote {len(blocks) // 3} query results to output/")


if __name__ == "__main__":
    main()
