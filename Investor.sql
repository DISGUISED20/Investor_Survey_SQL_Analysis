create database Investor;
CREATE TABLE Investor_Survey (
  ID INT PRIMARY KEY,
  Age INT,
  Gender VARCHAR(10),
  Income_Level VARCHAR(20),
  Risk_Appetite VARCHAR(20),
  Experience_Years INT,
  Preferred_Trading VARCHAR(30),
  Investment_Frequency VARCHAR(20),
  Monthly_Investment INT,
  Platform VARCHAR(30)
);

INSERT INTO Investor_Survey
  (ID, Age, Gender, Income_Level, Risk_Appetite, Experience_Years,
   Preferred_Trading, Investment_Frequency, Monthly_Investment, Platform)
VALUES
  (1, 22, 'Male', 'Low', 'Medium', 1, 'Intraday', 'Daily', 5000, 'Zerodha'),
  (2, 25, 'Female', 'Medium', 'Low', 2, 'SIP', 'Monthly', 6000, 'Groww'),
  (3, 28, 'Male', 'Medium', 'High', 4, 'Intraday', 'Daily', 12000, 'Upstox'),
  (4, 31, 'Female', 'High', 'Medium', 5, 'Positional', 'Weekly', 15000, 'Zerodha'),
  (5, 35, 'Male', 'Medium', 'High', 6, 'Long-term', 'Monthly', 18000, 'Groww'),
  (6, 29, 'Female', 'Low', 'Low', 3, 'SIP', 'Monthly', 4000, 'AngelOne'),
  (7, 40, 'Male', 'High', 'Medium', 8, 'Positional', 'Weekly', 20000, 'Upstox'),
  (8, 33, 'Female', 'Medium', 'Medium', 4, 'Intraday', 'Daily', 7000, 'Groww'),
  (9, 27, 'Male', 'Low', 'Low', 2, 'SIP', 'Monthly', 3500, 'Zerodha'),
  (10, 45, 'Female', 'High', 'High', 9, 'Long-term', 'Monthly', 25000, 'Zerodha');

-- Age group vs preferred trading type
SELECT
  CASE
    WHEN Age < 25 THEN 'Under 25'
    WHEN Age BETWEEN 25 AND 35 THEN '25–35'
    WHEN Age BETWEEN 36 AND 45 THEN '36–45'
    ELSE '46+'
  END AS Age_Group,
  Preferred_Trading,
  COUNT(*) AS Investor_Count
FROM Investor_Survey
GROUP BY Age_Group, Preferred_Trading
ORDER BY Age_Group;

-- Avg investment by risk appetite
SELECT Risk_Appetite, ROUND(AVG(Monthly_Investment), 2) AS Avg_Investment
FROM Investor_Survey
GROUP BY Risk_Appetite;

-- Experience vs investment
SELECT Experience_Years, ROUND(AVG(Monthly_Investment), 2) AS Avg_Investment
FROM Investor_Survey
GROUP BY Experience_Years
ORDER BY Experience_Years;

-- Trading preference distribution
SELECT Preferred_Trading, COUNT(*) AS Investor_Count
FROM Investor_Survey
GROUP BY Preferred_Trading
ORDER BY Investor_Count DESC;

-- Risk appetite by income level
SELECT Income_Level, Risk_Appetite, COUNT(*) AS Count
FROM Investor_Survey
GROUP BY Income_Level, Risk_Appetite
ORDER BY Income_Level, Risk_Appetite;

-- Most popular investment platform
SELECT Platform, COUNT(*) AS Users
FROM Investor_Survey
GROUP BY Platform
ORDER BY Users DESC;
