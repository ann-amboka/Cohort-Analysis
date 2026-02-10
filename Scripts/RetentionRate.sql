
/* now we calculate the retention rate*/
SELECT
  DATENAME(MONTH,signup_date) as Cohorts_Month,
  COUNT(user_id) AS users_signed_up,
  CONCAT(ROUND(SUM(CAST(month_0_active AS FLOAT))/ COUNT(user_id)*100,2),'%') AS month_0_retention,
  CONCAT(ROUND(SUM(CAST(month_1_active AS FLOAT))/ COUNT(user_id)*100,2),'%') AS month_1_retention,
  CONCAT(ROUND(SUM(CAST(month_2_active AS FLOAT))/ COUNT(user_id)*100,2),'%') AS month_2_retention,
  CONCAT(ROUND(SUM(CAST(month_3_active AS FLOAT))/ COUNT(user_id)*100,2),'%') AS month_3_retention,
  CONCAT(ROUND(SUM(CAST(month_4_active AS FLOAT))/ COUNT(user_id)*100,2),'%') AS month_5_retention,
  CONCAT(ROUND(SUM(CAST(month_5_active AS FLOAT))/ COUNT(user_id)*100,2),'%') AS month_6_retention
FROM dbo.cohort_analysis_dataset
GROUP BY	DATENAME(MONTH,signup_date),
			MONTH(signup_date)
ORDER BY	MONTH(signup_date)

/*want to see whether campaigns or events change behavior, you slice the cohorts.*/
SELECT
  DATENAME(MONTH,signup_date) as Cohorts_Month,
  campaign,
  COUNT(user_id) AS users,
  CONCAT(ROUND(SUM(CAST(month_0_active AS FLOAT))/ COUNT(user_id)*100,2),'%') AS month_0_retention,
  CONCAT(ROUND(SUM(CAST(month_1_active AS FLOAT))/ COUNT(user_id)*100,2),'%') AS month_1_retention,
  CONCAT(ROUND(SUM(CAST(month_2_active AS FLOAT))/ COUNT(user_id)*100,2),'%') AS month_2_retention,
  CONCAT(ROUND(SUM(CAST(month_3_active AS FLOAT))/ COUNT(user_id)*100,2),'%') AS month_3_retention,
  CONCAT(ROUND(SUM(CAST(month_4_active AS FLOAT))/ COUNT(user_id)*100,2),'%') AS month_4_retention,
  CONCAT(ROUND(SUM(CAST(month_5_active AS FLOAT))/ COUNT(user_id)*100,2),'%') AS month_5_retention
FROM dbo.cohort_analysis_dataset
GROUP BY	DATENAME(MONTH,signup_date),
			MONTH(signup_date),
			campaign
ORDER BY	MONTH(signup_date);

/*for the events*/
SELECT
  DATENAME(MONTH,signup_date) as Cohorts_Month,
  event,
  COUNT(user_id) AS users,
  CONCAT(ROUND(SUM(CAST(month_0_active AS FLOAT))/ COUNT(user_id)*100,2),'%') AS month_0_retention,
  CONCAT(ROUND(SUM(CAST(month_1_active AS FLOAT))/ COUNT(user_id)*100,2),'%') AS month_1_retention,
  CONCAT(ROUND(SUM(CAST(month_2_active AS FLOAT))/ COUNT(user_id)*100,2),'%') AS month_2_retention,
  CONCAT(ROUND(SUM(CAST(month_3_active AS FLOAT))/ COUNT(user_id)*100,2),'%') AS month_3_retention,
  CONCAT(ROUND(SUM(CAST(month_4_active AS FLOAT))/ COUNT(user_id)*100,2),'%') AS month_4_retention,
  CONCAT(ROUND(SUM(CAST(month_5_active AS FLOAT))/ COUNT(user_id)*100,2),'%') AS month_5_retention
FROM dbo.cohort_analysis_dataset
GROUP BY	DATENAME(MONTH,signup_date),
			MONTH(signup_date),
			event
ORDER BY	MONTH(signup_date)
