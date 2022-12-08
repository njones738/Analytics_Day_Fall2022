# Analytics Day - Fall 2022

The goal of this research is to study the pattern of change in the two-year withdrawal rate at post-secondary schools over time while accounting for the average student sentiment to see if a relationship between a school’s average student sentiment and two-year withdrawal rate exists. Data were scraped from Rate My Professors and merged with the CollegeScorecard dataset to determine which post-secondary schools have a positive or negative average student sentiment over time. After which a longitudinal model was used to model the two-year withdrawal rate over time.

Often students polarized by either good or bad teachers navigate to Rate My Professor to voice their opinions and experiences on the courses they took over the previous semester. Utilizing the sentiment left in the comments student reviewers give on these reviews could potentially provide valuable insight into why some schools have high withdrawal rates. The purpose of this project is to use student sentiment to model the pattern of change in the two-year withdrawal rate observed at post-secondary schools over time. 


### [CollegeScorecard](https://collegescorecard.ed.gov/data): 
The CollegeScorecard dataset is released by the Department of Education through the Integrated Post-Secondary Education Data System (IPEDS) which collects nearly 3,000 parameters for 6,654 schools across the U.S per school year. In total, the CollegeScorecard dataset contains 176,688 observations across 25 school years (1996-1997 to 2020-2021). For this research project, four parameters were used:

- INSTNM: The name of the school.
- SCHOOL_YEAR: The school year (EX: 2020-2021). 
- WDRAW_ORIG_YR2_RT: The withdrawal rate of students that withdrew from the original school they began at in two-years. This variable is a continuous value between 0 and 1.

### [Rate My Professor](https://www.ratemyprofessors.com/):
Since 1999 Rate My Professors has collected more than 15 million reviews for over 1.3 million professors each with up to 19 parameters. For this project, six parameters were used:

- REVIEW_IDs: Three variables identify distinct schools (SID), professors (TID), and review instances (RID). 
- DATE: The Month-Day-Year of the review.
- OVERALL: A overall rating (1-5) given by the reviewer. 
- TAGS: Buttonized TextStrings reviewers can leave in addition to the comments.
- COMMENTS: The text reviews left by the student.



## Folder structure

```
- readme.md
- code
---- readme.md (short description of each script)
---- Python
------ professor.py
------ ratemyprof_scraper.ipynb
------ sentiment_analysis.ipynb
---- R
------ poster.r
---- SAS
------ work
------ data_import.sas
------ model_avgstudsent.sas
------ normal_check.sas
- data (less than 100 Mb)
---- readme.md (links to data larger than 100 Mb and data details.)
---- MERGED_PP.csv
---- output_df.csv
---- sentiment_analysis.csv
---- ratemyprof_reviews.csv
- documents
---- readme.md (notes while doing your project)
---- FINAL_JONES.AnalyticsDay.FALL22-poster.pptx
---- Jones_Nathaniel_REPORT.pdf
```