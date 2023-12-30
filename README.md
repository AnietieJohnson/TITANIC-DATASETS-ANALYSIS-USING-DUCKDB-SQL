# <P align ="center"> TITANIC DATASET ANALYSIS
![](https://github.com/AnietieJohnson/TITANIC-DATASETS-ANALYSIS-USING-DUCKDB-SQL/blob/main/Screenshot%20(633).png)
## Introduction
This project involves analyzing the Titanic dataset using advance SQL queries to derive insights into the survival rates based on various factors such as fare, sex, and age. The dataset provides information about passengers aboard the Titanic, including their demographic details and survival status.
## Dataset
The Titanic dataset consists of the following key columns:

- PassengerId: Unique identifier for each passenger.
- Survived: Binary indicator (0 or 1) representing survival status (0 = Not Survived, 1 = Survived).
- Fare: Fare paid by the passenger.
- Sex: Gender of the passenger.
- Age: Age of the passenger.

I utilized three dataset [Train](https://github.com/AnietieJohnson/TITANIC-DATASETS-ANALYSIS-USING-DUCKDB-SQL/blob/main/train.csv), [Gender_submissions](https://github.com/AnietieJohnson/TITANIC-DATASETS-ANALYSIS-USING-DUCKDB-SQL/blob/main/gender_submission.csv) and [Test](https://github.com/AnietieJohnson/TITANIC-DATASETS-ANALYSIS-USING-DUCKDB-SQL/blob/main/test.csv)

## DAY 17-18
## Question 1: Analysis of Survival Rates Based on Fare
**Objective**

Perform an analysis of survival rates based on fare, utilizing the ntile window function to evenly distribute passengers into 6 bins. Calculate statistics for each bin, including survival rates, and examine if there is a correlation between fare amounts and survival.

### Explanation
**1. Handling Inconsistencies or Noise in Fare Column:**

Created a View (Fare) to handle inconsistencies or noise in the fare column by setting negative values and missing values to NULL.

**2. Creating Fare Bins:**

Created a view (FareBinned) using the ntile window function to evenly distribute passengers into 6 bins based on their cleaned fare values.

**3. Calculating Statistics:**

Calculated statistics for each fare bin, including the total number of passengers, the number of passengers who survived, the average fare, the minimum fare, the maximum fare, and the survival rate, using AGGREGATION functions.

**4. Examination of Correlation:**

Examined if there is a correlation between fare amounts and survival by analyzing the statistics for each fare bin.

## Question 2: Analysis of Survival Rates Based on Sex
Objective
Conduct an analysis of survival rates based on sex. Calculate the percentage of passengers who survived versus those who did not survive, focusing on the distinction between males and females. Utilize subqueries for higher marks.

## Explanation

**1. Calculating Survival Rates by Sex:**

Used a simple query to calculate survival rates based on sex, including the total number of passengers, the number of passengers who survived, then I wrote a subquery to get the survival rate.

**2. Highlighting Differences:**

Highlighted any significant differences in survival ratios between genders by presenting the survival rates for males and females.

## Question 3: Relationship Between Survival and Age

**Objective**

Explore the relationship between survival and age. Calculate the survival rate for different age groups and provide insights into how age correlates with the likelihood of survival. Identify notable patterns or trends in survival based on age.

### Explanation
**1. Categorizing Passengers into Age Groups:**

Created a view (AgeGroupSurvival) to categorize passengers into different age groups using a CASE statement.

**2. Calculating Survival Rates by Age Group:**

Calculated the survival rate for each age group, including the total number of passengers, the number of passengers who survived, and the survival rate.

**3. Insights and Trends:**

Provided insights into how age correlates with the likelihood of survival by examining survival rates for different age groups. Looked for notable patterns or trends in survival based on age. I realized children less than 18 had the highest rate of survival with approximately 54 percent survival rate, followed by adult between age 30 to 80 with survival rate of approximately 41 percent.

The goal was to conduct a comprehensive analysis of the Titanic dataset and extract meaningful insights related to survival rates based on various factors. **_The Sql queries to the questions above can be found_** [Here](https://github.com/AnietieJohnson/TITANIC-DATASETS-ANALYSIS-USING-DUCKDB-SQL/blob/main/titanic%20datasets%20query.sql)

## DAY 19 AND 20
## Question 1: Understanding Titles and Survival Rates
**Objective**

Explore the relationship between passenger titles and their survival rates.

**A)**  Identify Unique Titles in the Dataset

**Explanation:**

- The SQL query extracts titles from the 'Name' column using Case statement.It Returns only the titles specified 

**B)** Consolidate Infrequent Titles into Broader Categories

**Explanation:**

- A new column (Extracted_Titles) was created to store the consolidated title
- The CASE statement is used to group infrequent titles into broader categories ('Mr.', 'Mrs.', 'Miss.', 'Master.') and label others as 'Other'.

**C)** Calculate and Analyze Survival Rates for Each Title Grouping

**Explanation:**

- Calculated the total number of passengers by using _COUNT_, the number of passengers who survived using _SUM_, and the survival rate for each title grouping by the new column (Extracted_title).
- The results are grouped by the consolidated title, and the output is ordered in descending order of survival rates.

## Question 2: Calculate the Survival Based on Being a Woman, a Child or an Adult Male
**Objective**

Evaluate the insights gained from a binary feature flagging passengers as women/children or adult men.

**A)** Create a Feature Flag for Women/Children and Adult Men

**Explanation**

The CASE statement is used to create a binary feature flag based on the conditions:

- female and age less than 18 is categorized as 'Children'
- female and age greater thanor equal to 18 is categorized as 'Women',
- male and age less than 18 is categorized as 'Children' and others as 'Adult Men'. This column was named Age_Gender_category
  
**B)** Calculate and Analyze Survival Rates for Each Category

**Explanation**

- Calculated the total number of passengers using _COUNT_, the number of passengers who survived using _SUM_, and the survival rate for each category (Women/Children or Adult Men).
- The results are grouped by Age_Gender_category, and the output is ordered in descending order of survival rates.

**_SQL query to DAY 19 AND 20 can be found_** [here](https://github.com/AnietieJohnson/TITANIC-DATASETS-ANALYSIS-USING-DUCKDB-SQL/blob/main/day%2019%20and%2020.sql)

These SQL queries help to systematically analyze the relationship between passenger titles and survival rates, as well as the survival rates based on being a woman or a child. The steps involve data extraction, consolidation, and statistical analysis to provide meaningful insights.

## Insights and Trends
- The calculated survival rates reveal variations in the likelihood of survival based on different titles;
  For example, The titles like 'Mrs.' , 'Ms.' and 'Miss.' have a higher survival rates due to potential priority during evacuation.
- The category 'Women' and 'Children' includes individuals who may have been prioritized during evacuation based on vulnerability
- The analysis sheds light on the effectiveness of evacuation protocols during emergencies, especially concerning the prioritization of certain groups for survival.
These insights contribute to a deeper understanding of how demographic factors such as titles, age, and gender correlate with survival rates in the context of the Titanic dataset. They can be valuable for drawing conclusions about the decision-making processes and priorities during the disaster.


# Day 21-23
## Task 1: Survival Based on Cabin Level

**Objective**

Write an SQL query to display the number of passengers, their survival rate, and the cabin level they belong to. Consider the assumption that the same ticket number defines passengers traveling together.
- The query calculates survival rates based on the assumption that passengers with the same ticket number traveled together.
- It counts the total passengers, the number of passengers who survived, and calculates the survival rate for each unique ticket.
  
# Task 2: Solo Travelers, Family Travelers, and Mix Group

**Objective**

Using SQL, categorize passengers into solo travelers, those traveling with a family, and those in a mixed group. The assumption for this task is based on the ticket number and surname extracted from the original Name feature.
- The query categorizes passengers into solo travelers, family travelers, and mixed groups based on the assumption that families may have other members on different tickets.
- It uses the CASE statement and window functions to make these categorizations.

# Task 3: Family Size Calculation  

**Objective**

Write an SQL query to determine the family size for each passenger. The assumption for family size calculation is to add SibSp, Parch, and the current passenger (+1). However, this is determined at the maximum family size based on ticket number and surname.
- The query calculates family sizes for each passenger based on the assumption that families traveled together on the same ticket.
- It uses a Common Table Expression (CTE) named FamilySizeMapping to determine the maximum family size for each unique ticket and surname combination.
- The final result provides the ticket, surname, and family size for each passenger.
**_SQL query to DAY 21-23 can be found_** [here](https://github.com/AnietieJohnson/TITANIC-DATASETS-ANALYSIS-USING-DUCKDB-SQL/blob/main/DAY%2021-23.sql)
## Insights
- Cabin Level and Survival: Passengers with cabins may have had different access or proximity to lifeboats, influencing their chances of survival.
- Understanding Family Dynamics: The results offer insights into the family dynamics aboard the Titanic, indicating the potential sizes of families traveling together.
# DAY 24-26
## Question 1: Survival Rate of Males in the Third Passenger Class

**Objective:**

To determine the survival rate of males in the third passenger class, specifically considering women and children as potential survivors. The analysis aims to explore if the provided percentage aligns with the historical notion that women and children were prioritized during the evacuation.

**Explanation:**

- Data Classification:
The dataset is first classified based on age and gender categories, distinguishing between children and adults, as well as between males and females.
- Common Table Expression (CTE):
A Common Table Expression named Malesurvivors is created to store the categorized data for further analysis.
- Survival Rate Calculation:
The final query calculates the survival rate for males in the third passenger class, considering only women and children for survival.

## Question 2: Percentage Survived Between Sex, Embarked, and PClass

**Objective:**

To analyze the percentage of survivors based on the combination of Sex, Embarked, and PClass, providing insights into how these factors correlate with survival rates.

**Explanation:**
- Data Aggregation:
The dataset is grouped based on Sex, Embarked, and PClass to aggregate information for analysis.

## Question 3: Chances of Survival Advice

**Objective:**

To provide survival rate advice based on specific passenger attributes (male, age 36, second class, embarked from Cherbourg).

**Explanation:**

- Survival Rate Calculation:
The query calculates the survival rate for passengers with specific attributes: male, age 36, second class, and embarked from Cherbourg.

In the provided data (Sex: Male, Age: 36, Pclass: 2, Embarked: C), the passenger is male, relatively young, traveling in the second class, and boarded from Cherbourg. Generally, women and children were prioritized during the evacuation, and passengers in higher classes had better survival rates.

**Given the provided information:**

- Being male might lower the chances of survival compared to females.
- Age 36 is relatively young and might slightly improve the chances compared to older passengers.
- Traveling in the second class might offer a better chance of survival compared to the third class.
- Embarking from Cherbourg (C) doesn't provide significant information about survival.
  
# DAY 27-30
**Objective**

The objective of this task was to create a comprehensive dashboard using either Power BI or FusionCharts based on the analysis questions and findings related to the Titanic dataset. The challenge covered various aspects of survival analysis, including fare, sex, age, titles, family size, cabin level, and additional specific queries.

**Explanation**

I used Powerbi to Visualize all SQl query and solution. The Comprehesive dashboard can be viewed [here](https://github.com/AnietieJohnson/TITANIC-DATASETS-ANALYSIS-USING-DUCKDB-SQL/blob/main/Final%20challenge%20with%20duckdb%2C%20POWERBI%20PDF%20FILE.pdf)

**Survival Based on Fare Analysis:**

- Using new column I applied the percentile function to create fare bins for survival rate analysis.
- I also calculated the survival rate
- Using scatter plot I analyzed and visualized the correlation between fare amounts and survival rate.
- I used a Table to visualize survival based on Fare

**Survival Based on Sex Analysis:**

- Built a column chart visual to highlight survival rates for males and females.
- Clearly presented the survival rate of passengers, emphasizing gender distinctions.

**Survival Based on Age Analysis:**

- Used column chart visual to give a break down of survival rates for different age groups.
- Provided insights into how age correlates with the likelihood of survival.
- Identified and visualized notable patterns or trends in survival based on age.

**Understanding Titles and Survival Rates:**

- I used a Bar chart to display survival rates for different passenger titles.
- Highlighted trends or patterns related to titles and survival.


**Survival Based on Embarked, Sex and Pclass:**

- I used a column chart to display the survival rate partterns with respect to where Passengers Embarked, Gender and Pclass

**Family Size Calculation:**

- Using New column I demonstrated family size calculations based on SibSp, ParCh, and the current passenger.

**Additional Challenges:**
- Provided an insight on the chances of survival for a specific passenger profile (Sex: Male, Age: 36, Pclass: 2, Embarked: C).
- Created slicers on Family size,Age and Embarked.

## CONCLUSION
The #30Daysduckdbchallenge has come to an end, marking a journey of exploration, learning, and creative problem-solving in the realm of data analytics and visualization. I embarked on a 30-day adventure, each day presenting a new set of challenges that tested my skills in data manipulation, analysis, and visualization using DuckDB. As the #30DaysDuckdbChallenge concludes, I leave with a sense of accomplishment, newfound skills, and a strengthened passion for data analytics. The journey doesn't end here; it serves as a steppingstone for continuous learning and growth in the ever-evolving landscape of data science and analytics. It indeed took dedication, creativity, and resilience to complete the challenge.
