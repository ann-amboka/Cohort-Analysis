/* find the first signup date before building the cohorts*/
SELECT
MIN(signup_date) AS firstSignUpDate
FROM dbo.cohort_analysis_dataset

/* Find the sign-up date for each user*/
SELECT
  user_id,
  firstSignUpDate
FROM (
  SELECT
    user_id,
    MIN(signup_date) AS firstSignUpDate
  FROM dbo.cohort_analysis_dataset
  GROUP BY user_id
) t;

/* Create the cohorts based on the months they signed up */
/* Now we aggregate the users per month*/
--first lets change the data types for the columns--
ALTER TABLE dbo.cohort_analysis_dataset
ALTER COLUMN month_0_active INT;

ALTER TABLE dbo.cohort_analysis_dataset
ALTER COLUMN month_1_active INT;

ALTER TABLE dbo.cohort_analysis_dataset
ALTER COLUMN month_2_active INT;

ALTER TABLE dbo.cohort_analysis_dataset
ALTER COLUMN month_3_active INT;

ALTER TABLE dbo.cohort_analysis_dataset
ALTER COLUMN month_4_active INT;

ALTER TABLE dbo.cohort_analysis_dataset
ALTER COLUMN month_5_active INT;


SELECT
  DATENAME(MONTH,signup_date) as Cohorts_Month,
  COUNT(user_id) AS users_signed_up,
  SUM(month_0_active) AS month_0_active,
  SUM(month_1_active) AS month_1_active,
  SUM(month_2_active) AS month_2_active,
  SUM(month_3_active) AS month_3_active,
  SUM(month_4_active) AS month_4_active,
  SUM(month_5_active) AS month_5_active
FROM dbo.cohort_analysis_dataset
GROUP BY	DATENAME(MONTH,signup_date),
			MONTH(signup_date)
ORDER BY	MONTH(signup_date)
