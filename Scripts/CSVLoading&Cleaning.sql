USE MASTER
GO
CREATE DATABASE Cohort
USE Cohort

/* Data cleaning, finding nulls, blanks, and any errors*/
SELECT
TRIM(campaign),
TRIM(event)
FROM dbo.cohort_analysis_dataset
where campaign<>TRIM(campaign)

SELECT
  user_id,
  COUNT(user_id) AS cnt
FROM cohort_analysis_dataset
GROUP BY user_id
HAVING COUNT(user_id) > 1;

/* Data is Clean and ready for analysis*/

/*What is the timespan of our data)*/
SELECT
MIN(signup_date) AS firstDate,
DATEDIFF(YEAR,MIN(signup_date),GETDATE()) AS BusinessTimeline
FROM dbo.cohort_analysis_dataset
