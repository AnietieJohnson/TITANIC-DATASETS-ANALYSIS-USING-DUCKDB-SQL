DAY 24-26
QUESTION 1
--What was the survival rate of males in the third passenger class
--In this case we want women OR children.
--If you remember from the movie, women and children were first ones allowed for the rescue boats
--so does the above percentage prove that quote?
--Prove that with a screenshot of your query using SQL.

SELECT * FROM TRAIN;
SELECT *,
    CASE
      WHEN Age < 18 AND Sex = 'female' THEN 'Children'
      WHEN Age < 18 AND Sex = 'male' THEN 'Children'
      WHEN Age >= 18 AND Sex = 'male' THEN 'AdultMale'
      ELSE 'AdultFemale'
    END AS Age_Gender_category
 FROM Train;


WITH Malesurvivors AS (
  SELECT *,
    CASE
      WHEN Age < 18 AND Sex = 'female' THEN 'Children'
      WHEN Age < 18 AND Sex = 'male' THEN 'Children'
      WHEN Age >= 18 AND Sex = 'male' THEN 'AdultMale'
      ELSE 'AdultFemale'
    END AS Age_Gender_category
  FROM Train
)
SELECT
 Age_Gender_category,
  COUNT(*) AS TotalPassengers,
  SUM(survived) AS SurvivedCount,
  SUM(Survived)/ COUNT(*) * 100.00 AS SurvivalRate
FROM Malesurvivors
WHERE
  Pclass = 3
  GROUP BY
  Age_Gender_category;

QUESTION 2
--What is the percentage survived between Sex, Embarked, and PClass.

SELECT
  Sex,
  Embarked,
  Pclass,
  COUNT(*) AS TotalPassengers,
  SUM(survived) AS SurvivedCount,
  SUM(Survived)/ COUNT(*) * 100.00 AS SurvivalRate
FROM
  Train
GROUP BY
  Sex, Embarked, Pclass;

QUESTION 3
--If you were to advise your chances of survival on the Titanic, what would you say?
--If you are of the below data (Sex:Male, Age: 36, Pclass:2, Emabrked:C)

SELECT
sex,
 SUM(Survived)/COUNT(*) * 100.00 AS SurvivalRate
FROM
  Train
WHERE
  Sex = 'male'
  AND Age = 36
  AND Pclass = 2
  AND Embarked = 'C'
GROUP BY sex

ANS
--In the provided data (Sex: Male, Age: 36, Pclass: 2, Embarked: C), the passenger is male, relatively young, traveling in the second class, and boarded from Cherbourg. Generally, women and children were prioritized during the evacuation, and passengers in higher classes had better survival rates.

--Given the provided information:
--Being male might lower the chances of survival compared to females.
--Age 36 is relatively young and might slightly improve the chances compared to older passengers.
--Traveling in the second class might offer a better chance of survival compared to the third class.
--Embarking from Cherbourg (C) doesn't provide significant information about survival. 
