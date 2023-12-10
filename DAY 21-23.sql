--DAY21-23
	--QUESTION 1
	--Write an SQL query to display the number of passengers, their survival rate, and the cabin level they belong to.
	--The assumption here is that the same ticket number defines passengers traveling together.
	--Please consider this assumption while formulating your query.

SELECT
    Ticket,
     COUNT(*) AS TotalPassengers,
	 SUM(survived) as SurvivedCount,
	 SUM(Survived)/COUNT (*) *100.00 AS SurvivalRate
FROM Train
   WHERE
    Cabin IS NOT NULL
GROUP BY
    Ticket;

   -- QUESTION 2
   --Using SQL, categorize passengers into solo travelers, those traveling with a family, and those in a mixed group.
   --The assumption for this task is based on ticket number and surname extracted from the original Name feature.
   --If an individual is the only passenger attached to a ticket, consider them a solo traveler.
   --Please assume that families may have other members on different tickets.

   SELECT Name,SPLIT_PART(Name, ',', 1) from Train;

  -- Add a new column 'Surname' to the table
    ALTER TABLE Train
    ADD COLUMN Surname VARCHAR;

    -- Update the new column with the surnames extracted from Names
    UPDATE Train
    SET Surname = SPLIT_PART(Name, ',', 1);

   SELECT
    Ticket,Surname,
    CASE
    WHEN COUNT(*) OVER (PARTITION BY Ticket) = 1 THEN 'Solo Traveler'
    WHEN COUNT(*) OVER (PARTITION BY Surname) > 1 THEN 'Family Traveler'
    ELSE 'Mixed Group'
    END AS travellers
FROM Train
GROUP BY
        Ticket, Surname;


 --QUESTION 3
 -- Write an SQL query to determine the family size for each passenger.
 --The assumption for family size calculation is to add SibSp, ParCh, and the current passenger (+1).
 --However, this is determined at the maximum family size based on ticket number and surname.
 --Assume that families traveled together on the same ticket.
 --Use a mapping SQL subquery to match the sum of SibSp, ParCh, and the current passenger with the familysize, considering the same ticket number and surname.

-- Determine family size for each passenger
WITH FamilySizeMapping AS
(SELECT Ticket,
    Surname,SibSp,
            Parch,
    MAX(SibSp + Parch + 1)OVER (PARTITION BY Ticket, Surname) AS MaxFamilySize
  FROM
    Train
    GROUP BY Ticket, surname,SibSp,
            Parch)
SELECT Ticket, Surname, (SibSp + Parch + 1) AS MaxFamilySize
FROM FamilySizeMapping;
