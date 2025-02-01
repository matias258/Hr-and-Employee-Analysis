-- Employee Dataset -- 
-- Combining FIRST AND LAST name AS FULL employee name --
SELECT
  FirstName,
  LastName,
  CONCAT(FirstName, " ", LastName) AS Employee_Name
FROM
  `world-bank-group-analysis.datasets.employee-dataset`; 


-- Age bins (18-51) --
SELECT
  Age,
  CASE
    WHEN Age BETWEEN 18 AND 24 THEN "18-24"
    WHEN Age BETWEEN 25
  AND 31 THEN "25-31"
    WHEN Age BETWEEN 32 AND 38 THEN "32-38"
    WHEN Age BETWEEN 39
  AND 45 THEN "39-45"
    WHEN Age BETWEEN 46 AND 51 THEN "46-51"
    ELSE "Other"
END
  AS Age_Group
FROM
  `world-bank-group-analysis.datasets.employee-dataset`;


-- State FULL name --
SELECT
  EmployeeID,
  State,
  CASE
    WHEN State = "CA" THEN "California"
    WHEN State = "IL" THEN "Illinois"
    WHEN State = "NY" THEN "New York"
    ELSE "Unknown"
END
  AS Full_State_Name
FROM
  `world-bank-group-analysis.datasets.employee-dataset`; 


-- Salary Bins max AND min (20387-547204) --
SELECT
  MIN(Salary),
  MAX(Salary)
FROM
  `world-bank-group-analysis.datasets.employee-dataset`; 
  

-- Salary Bins --
SELECT
  EmployeeID,
  Salary,
  CASE
    WHEN Salary BETWEEN 20387 AND 50000 THEN "Under 50k"
    WHEN Salary BETWEEN 500001
  AND 150000 THEN "50k-150k"
    WHEN Salary BETWEEN 150001 AND 300000 THEN "150k-300k"
    WHEN Salary BETWEEN 300001
  AND 500000 THEN "300k-500k"
    WHEN Salary > 500000 THEN "Above 500k"
    ELSE "Unknown"
END
  AS Salary_Bin
FROM
  `world-bank-group-analysis.datasets.employee-dataset`; 


-- We combine ALL these queries IN a single one --

-- SelectingColumn from Employer Table --
SELECT
  EmployeeID,
  CONCAT(FirstName, " ", LastName) AS Employee_Name,
  Gender, 
  BusinessTravel, 
  Department, 
  `DistanceFromHome KM`, 
  State, 
  Ethnicity, 
  Education, 
  EducationField, 
  JobRole, 
  MaritalStatus,
  StockOptionLevel, 
  OverTime, 
  HireDate, 
  Attrition, 
  YearsAtCompany, 
  YearsInMostRecentRole, 
  YearsSinceLastPromotion, 
  YearsWithCurrManager
  Age,
  CASE
    WHEN Age BETWEEN 18 AND 24 THEN "18-24"
    WHEN Age BETWEEN 25
  AND 31 THEN "25-31"
    WHEN Age BETWEEN 32 AND 38 THEN "32-38"
    WHEN Age BETWEEN 39
  AND 45 THEN "39-45"
    WHEN Age BETWEEN 46 AND 51 THEN "46-51"
    ELSE "Other"
END
  AS Age_Group,
  CASE
    WHEN State = "CA" THEN "California"
    WHEN State = "IL" THEN "Illinois"
    WHEN State = "NY" THEN "New York"
    ELSE "Unknown"
END AS Full_State_Name, 
Salary,
  CASE
    WHEN Salary BETWEEN 20387 AND 50000 THEN "Under 50k"
    WHEN Salary BETWEEN 500001
  AND 150000 THEN "50k-150k"
    WHEN Salary BETWEEN 150001 AND 300000 THEN "150k-300k"
    WHEN Salary BETWEEN 300001
  AND 500000 THEN "300k-500k"
    WHEN Salary > 500000 THEN "Above 500k"
    ELSE "Unknown"
END
  AS Salary_Bin
FROM
  `world-bank-group-analysis.datasets.employee-dataset`;


  -- Create Table 1 Joining Employee Table and EducationLevel Table based on  primarily key as EducationLevelID --
  CREATE TABLE `world-bank-group-analysis.datasets.table_1` AS 
  SELECT
  EmployeeID,
  CONCAT(FirstName, " ", LastName) AS Employee_Name,
  Gender, 
  BusinessTravel, 
  Department, 
  `DistanceFromHome KM`, 
  State, 
  Ethnicity, 
  Education, 
  EducationField, 
  JobRole, 
  MaritalStatus,
  StockOptionLevel, 
  OverTime, 
  HireDate, 
  Attrition, 
  YearsAtCompany, 
  YearsInMostRecentRole, 
  YearsSinceLastPromotion, 
  YearsWithCurrManager
  Age,
  CASE
    WHEN Age BETWEEN 18 AND 24 THEN "18-24"
    WHEN Age BETWEEN 25
  AND 31 THEN "25-31"
    WHEN Age BETWEEN 32 AND 38 THEN "32-38"
    WHEN Age BETWEEN 39
  AND 45 THEN "39-45"
    WHEN Age BETWEEN 46 AND 51 THEN "46-51"
    ELSE "Other"
END
  AS Age_Group,
  CASE
    WHEN State = "CA" THEN "California"
    WHEN State = "IL" THEN "Illinois"
    WHEN State = "NY" THEN "New York"
    ELSE "Unknown"
END AS Full_State_Name, 
Salary,
  CASE
    WHEN Salary BETWEEN 20387 AND 50000 THEN "Under 50k"
    WHEN Salary BETWEEN 500001
  AND 150000 THEN "50k-150k"
    WHEN Salary BETWEEN 150001 AND 300000 THEN "150k-300k"
    WHEN Salary BETWEEN 300001
  AND 500000 THEN "300k-500k"
    WHEN Salary > 500000 THEN "Above 500k"
    ELSE "Unknown"
END
  AS Salary_Bin,
  E1.EducationLevel
FROM
  `world-bank-group-analysis.datasets.employee-dataset` E
JOIN `world-bank-group-analysis.datasets.EducationLevel` E1
ON E.Education = E1.EducationLevelID;

