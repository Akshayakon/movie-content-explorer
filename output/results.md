# Query results

## Q1: Dataset overview (DISTINCT counts)

| total_titles | content_types | distinct_ratings | distinct_release_years | earliest_release | latest_release | first_added | last_added |
|---|---|---|---|---|---|---|---|
| 7787 | 2 | 14 | 73 | 1925 | 2021 | 2008-01-01 | 2021-01-16 |

## Q2: Movies vs. TV shows, overall split

| type | titles | pct |
|---|---|---|
| Movie | 5377 | 69.1 |
| TV Show | 2410 | 30.9 |

## Q3: Movies vs. TV shows by release year (2010 onward)

| release_year | movies | tv_shows | total |
|---|---|---|---|
| 2010 | 136 | 37 | 173 |
| 2011 | 127 | 39 | 166 |
| 2012 | 158 | 61 | 219 |
| 2013 | 202 | 65 | 267 |
| 2014 | 244 | 90 | 334 |
| 2015 | 382 | 159 | 541 |
| 2016 | 642 | 240 | 882 |
| 2017 | 744 | 268 | 1012 |
| 2018 | 734 | 387 | 1121 |
| 2019 | 582 | 414 | 996 |
| 2020 | 411 | 457 | 868 |
| 2021 | 12 | 19 | 31 |

## Q4: Movies vs. TV shows by year added to Netflix (date filtering)

| year_added | movies | tv_shows | total |
|---|---|---|---|
| 2015 | 58 | 30 | 88 |
| 2016 | 258 | 185 | 443 |
| 2017 | 864 | 361 | 1225 |
| 2018 | 1255 | 430 | 1685 |
| 2019 | 1497 | 656 | 2153 |
| 2020 | 1312 | 697 | 2009 |

## Q5: Monthly additions, Oct 2019 to Dec 2020 (date filtering)

| month_added | titles_added |
|---|---|
| 2019-10 | 204 |
| 2019-11 | 272 |
| 2019-12 | 222 |
| 2020-01 | 228 |
| 2020-02 | 117 |
| 2020-03 | 152 |
| 2020-04 | 188 |
| 2020-05 | 173 |
| 2020-06 | 167 |
| 2020-07 | 156 |
| 2020-08 | 144 |
| 2020-09 | 178 |
| 2020-10 | 173 |
| 2020-11 | 158 |
| 2020-12 | 175 |

## Q6: Top 10 countries by number of titles (multi-country titles count once per country)

| country | titles |
|---|---|
| United States | 3297 |
| India | 990 |
| United Kingdom | 723 |
| Canada | 412 |
| France | 349 |
| Japan | 287 |
| Spain | 215 |
| South Korea | 212 |
| Germany | 199 |
| Mexico | 154 |

## Q7: Top 5 countries split by Movies vs TV Shows

| country | movies | tv_shows | total |
|---|---|---|---|
| United States | 2431 | 866 | 3297 |
| India | 915 | 75 | 990 |
| United Kingdom | 467 | 256 | 723 |
| Canada | 286 | 126 | 412 |
| France | 265 | 84 | 349 |

## Q8: Most common genres overall (top 10)

| genre | titles |
|---|---|
| International Movies | 2437 |
| Dramas | 2106 |
| Comedies | 1471 |
| International TV Shows | 1199 |
| Documentaries | 786 |
| Action & Adventure | 721 |
| TV Dramas | 704 |
| Independent Movies | 673 |
| Children & Family Movies | 532 |
| Romantic Movies | 531 |

## Q9: Most common genres, Movies only (top 5)

| genre | titles |
|---|---|
| International Movies | 2437 |
| Dramas | 2106 |
| Comedies | 1471 |
| Documentaries | 786 |
| Action & Adventure | 721 |

## Q10: Most common genres, TV Shows only (top 5)

| genre | titles |
|---|---|
| International TV Shows | 1199 |
| TV Dramas | 704 |
| TV Comedies | 525 |
| Crime TV Shows | 427 |
| Kids' TV | 414 |

## Q11: Top 10 longest movies (minutes)

| title | release_year | country | minutes |
|---|---|---|---|
| Black Mirror: Bandersnatch | 2018 | United States | 312 |
| The School of Mischief | 1973 | Egypt | 253 |
| No Longer kids | 1979 | Egypt | 237 |
| Lock Your Girls In | 1982 |  | 233 |
| Raya and Sakina | 1984 |  | 230 |
| Sangam | 1964 | India | 228 |
| Lagaan | 2001 | India | 224 |
| Jodhaa Akbar | 2008 | India | 214 |
| Kabhi Khushi Kabhie Gham | 2001 | India | 209 |
| The Irishman | 2019 | United States | 209 |

## Q12: Longest movies released since 2015 (top 5, date filtering)

| title | release_year | minutes |
|---|---|---|
| Black Mirror: Bandersnatch | 2018 | 312 |
| The Irishman | 2019 | 209 |
| The Gospel of Luke | 2015 | 205 |
| Unbreakable Kimmy Schmidt: Kimmy vs. the Reverend | 2020 | 190 |
| King of Boys | 2018 | 182 |

## Q13: Average movie length by decade

| decade | movies | avg_minutes |
|---|---|---|
| 1960 | 22 | 142.4 |
| 1970 | 63 | 119.1 |
| 1980 | 99 | 116.4 |
| 1990 | 194 | 113.9 |
| 2000 | 601 | 112.6 |
| 2010 | 3951 | 96.8 |
| 2020 | 423 | 89.5 |

## Q14: LIKE, titles containing "love"

| type | titles_with_love |
|---|---|
| Movie | 108 |
| TV Show | 67 |

## Q15: LIKE, countries producing the most documentaries (single-country titles)

| country | documentaries |
|---|---|
| United States | 381 |
| United Kingdom | 79 |
| France | 22 |
| Canada | 20 |
| India | 18 |

## Q16: LIKE, India-related content by rating (single or co-produced)

| rating | titles |
|---|---|
| TV-14 | 542 |
| TV-MA | 246 |
| TV-PG | 142 |
| TV-Y7 | 14 |
| TV-G | 10 |
| PG-13 | 9 |

## Q17: DISTINCT, all ratings in the catalog

| rating |
|---|
| G |
| NC-17 |
| NR |
| PG |
| PG-13 |
| R |
| TV-14 |
| TV-G |
| TV-MA |
| TV-PG |
| TV-Y |
| TV-Y7 |
| TV-Y7-FV |
| UR |

## Q18: TV shows with the most seasons

| title | release_year | seasons |
|---|---|---|
| Grey's Anatomy | 2019 | 16 |
| NCIS | 2017 | 15 |
| Supernatural | 2019 | 15 |
| COMEDIANS of the world | 2019 | 13 |
| Red vs. Blue | 2015 | 13 |
| Criminal Minds | 2017 | 12 |
| Trailer Park Boys | 2018 | 12 |
| Cheers | 1992 | 11 |

## Q19: Age of titles when added in 2020 (date filtering)

| age_when_added | titles |
|---|---|
| Same year | 851 |
| 3-10 years | 443 |
| 1-2 years | 425 |
| Over 10 years (catalog) | 290 |
