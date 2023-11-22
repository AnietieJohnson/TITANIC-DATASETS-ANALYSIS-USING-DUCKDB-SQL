--- DAY16-18
---The next phase of our 30-day challenge will immerse us in advanced SQL techniques using the Titanic dataset
SELECT * FROM read_csv_auto('C:\Users\hp\Downloads\test.csv');
CREATE TABLE TEST AS SELECT * FROM read_csv_auto('C:\Users\hp\Downloads\test.csv');
SELECT * FROM read_csv_auto('C:\Users\hp\Downloads\gender_submission.csv');
CREATE TABLE GENDER_SUBMISSION AS SELECT * FROM read_csv_auto('C:\Users\hp\Downloads\gender_submission.csv');
SELECT * FROM read_csv_auto('C:\Users\hp\Downloads\train.csv');
CREATE TABLE TRAIN AS SELECT * FROM read_csv_auto('C:\Users\hp\Downloads\train.csv');


SELECT * from TEST;
SELECT * from GENDER_SUBMISSION;
SELECT * from TRAIN;

Question 1:
--Perform an analysis of survival rates based on fare in the Titanic dataset.
--Utilize the ntile window function to evenly bucket passengers into 6 bins.
--Calculate statistics for each bin, including survival rates.
--Examine if there is a correlation between fare amounts and survival.
--Note any inconsistencies or noise in the fare column and present your findings.

-- Step 1: Create fare bins
CREATE VIEW Fare AS
SELECT
	PassengerId,
	Name,
	Fare,
	Survived,
CASE
    WHEN Fare < 0 THEN NULL -- Handle negative fares by setting them to NULL
    WHEN Fare IS NULL THEN NULL -- Handle missing values
    ELSE Fare
  END AS CleanedFare
FROM
  Train;

CREATE VIEW FareBinned AS
SELECT
  PassengerId,
   Name,
  CleanedFare,
  Survived,
  NTILE(6) OVER (ORDER BY CleanedFare) AS FareBin
FROM
  Fare;

-- Calculate statistics for each fare bin, including survival rates
SELECT
  FareBin,
  COUNT(*) AS TotalPassengers,
  SUM(Survived) AS SurvivedCount,
  AVG(CleanedFare) AS AverageFare,
  MIN(CleanedFare) AS MinFare,
  MAX(CleanedFare) AS MaxFare,
  SUM(Survived) / COUNT(*) * 100 AS SurvivalRate
FROM
  FareBinned
GROUP BY
  FareBin
ORDER BY
  FareBin;


--Question 2:
--Conduct an analysis of survival rates based on sex in the Titanic dataset.
--Calculate the percentage of passengers who survived versus those who did not survive, focusing on the distinction between males and females.
--Express the survival rates and highlight any significant differences in survival ratios between genders. (use subqueries for higher marks)

SELECT Sex, total_passenger, total_survived,
(total_survived*100.0/total_passenger) as percentage_survival
FROM
(SELECT
Sex,
Count(*) as total_passenger,
Sum(Survived) as total_survived
FROM Train
Group by sex)
As Gender_survived;
