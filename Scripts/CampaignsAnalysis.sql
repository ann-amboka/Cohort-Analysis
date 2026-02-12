SELECT
  Cohorts_Month,
  [campaign A],
  [campaign B],
  [campaign C],
  [none]
FROM (
  SELECT
    DATENAME(MONTH, signup_date) AS Cohorts_Month,
    MONTH(signup_date) AS Month_Number,
    campaign,
    user_id
  FROM dbo.cohort_analysis_dataset
) s
PIVOT (
  COUNT(user_id)
  FOR campaign IN (
    [campaign A],
    [campaign B],
    [campaign C],
    [none]
  )
) AS t
ORDER BY Month_Number;

SELECT
[Product Launch],
[Price Drop],
[System Outage],
[none]
FROM(
SELECT
   DATENAME(MONTH, signup_date) AS Cohorts_Month,
   MONTH(signup_date) AS Month_Number,
   event,
   user_id
FROM dbo.cohort_analysis_dataset)t
PIVOT(
COUNT(user_id) FOR event IN ([Product Launch],
[Price Drop],
[System Outage],
[none])
)t
ORDER BY Month_Number
