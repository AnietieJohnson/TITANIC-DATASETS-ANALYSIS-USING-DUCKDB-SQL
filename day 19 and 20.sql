-- DAY 19 and 20
 SELECT * from TEST;
SELECT * from GENDER_SUBMISSION;
SELECT * from TRAIN;
-- QUESTION 1:
--Understanding Titles and Survival Rates
--a. Identify unique titles in the dataset.
--b. Consolidate infrequent titles into broader categories (e.g., Mr, Mrs, Miss, Master).
--c. Calculate and analyze survival rates for each title grouping.

SELECT *,
  CASE
    WHEN POSITION('Mr.' IN Name) > 0 THEN 'Mr'
    WHEN POSITION('Mrs.' IN Name) > 0 THEN 'Mrs'
    WHEN POSITION('Miss.' IN Name) > 0 THEN 'Miss'
    WHEN POSITION('Master.' IN Name) > 0 THEN 'Master'
    WHEN POSITION('Ms.' IN Name) > 0 THEN 'Ms'
    ELSE 'Others'
  END AS Extracted_Title
FROM Train;

Updating new column
ALTER TABLE Train
ADD Extracted_Title NVARCHAR;

--Update the new column
UPDATE Train
SET Extracted_Title =CASE
    WHEN POSITION('Mr.' IN Name) > 0 THEN 'Mr'
    WHEN POSITION('Mrs.' IN Name) > 0 THEN 'Mrs'
    WHEN POSITION('Miss.' IN Name) > 0 THEN 'Miss'
    WHEN POSITION('Master.' IN Name) > 0 THEN 'Master'
    WHEN POSITION('Ms.' IN Name) > 0 THEN 'Ms'
    ELSE 'Others'
END ;

-- Calculate and analyze survival rates for each title grouping
SELECT
  Extracted_Title,
  COUNT(*) AS TotalPassengers,
  SUM(Survived) AS SurvivedCount,
  SUM(Survived) / COUNT(*) * 100 AS SurvivalRate
FROM
 Train
GROUP BY
  Extracted_Title
ORDER BY
 SurvivalRate DESC;

-- QUESTION 2:
--calculate the survival based on being a woman or a child

SELECT
	CASE
	 WHEN Age <18 AND Sex = 'female' Then 'Children'
	 WHEN Age >= 18 AND Sex = 'female' THEN 'Women'
	 WHEN Age < 18 AND Sex = 'MALE' THEN 'Children'
	 ELSE 'Adultmen'
	 END AS Age_Gender_category,

	 COUNT(*) AS TotalPassengers,
	 SUM(survived) as SurvivedCount,
	 SUM(Survived)/COUNT (*) *100.00 AS SurvivalRate
	 FROM Train
	 GROUP BY Age_Gender_category
	 ORDER BY SurvivalRate DESC;
