# <P align ="center"> TITANIC DATASET ANALYSIS
![](https://github.com/AnietieJohnson/TITANIC-DATASETS-ANALYSIS-USING-DUCKDB-SQL/blob/main/Screenshot%20(633).png)
## Introduction
This project involves analyzing the Titanic dataset using advance SQL queries to derive insights into the survival rates based on various factors such as fare, sex, and age. The dataset provides information about passengers aboard the Titanic, including their demographic details and survival status.
## Dataset
The Titanic dataset consists of the following key columns:

PassengerId: Unique identifier for each passenger.
Survived: Binary indicator (0 or 1) representing survival status (0 = Not Survived, 1 = Survived).
Fare: Fare paid by the passenger.
Sex: Gender of the passenger.
Age: Age of the passenger.

I utilized three dataset [Train](https://github.com/AnietieJohnson/TITANIC-DATASETS-ANALYSIS-USING-DUCKDB-SQL/blob/main/train.csv), [Gender_submissions](https://github.com/AnietieJohnson/TITANIC-DATASETS-ANALYSIS-USING-DUCKDB-SQL/blob/main/gender_submission.csv) and [Test](https://github.com/AnietieJohnson/TITANIC-DATASETS-ANALYSIS-USING-DUCKDB-SQL/blob/main/test.csv)

## Question 1: Analysis of Survival Rates Based on Fare
**Objective**
Perform an analysis of survival rates based on fare, utilizing the ntile window function to evenly distribute passengers into 6 bins. Calculate statistics for each bin, including survival rates, and examine if there is a correlation between fare amounts and survival.

### Explanation
**1. Handling Inconsistencies or Noise in Fare Column:**

Created a temporary table (CleanedFares) to handle inconsistencies or noise in the fare column by setting negative values and missing values to NULL.

**2. Creating Fare Bins:**

Created a view (FareBinnedView) using the ntile window function to evenly distribute passengers into 6 bins based on their cleaned fare values.

**3. Calculating Statistics:**

Calculated statistics for each fare bin, including the total number of passengers, the number of passengers who survived, the average fare, the minimum fare, the maximum fare, and the survival rate.

**4. Examination of Correlation:**

Examined if there is a correlation between fare amounts and survival by analyzing the statistics for each fare bin through the use of aggregation functions
