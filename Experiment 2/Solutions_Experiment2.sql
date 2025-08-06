USE Experiments;

--MEDIUM

CREATE TABLE TBL_EMPLOYEE (
  Emp_ID INT PRIMARY KEY,
  Emp_Name VARCHAR(MAX),
  Department VARCHAR(MAX),
  Manager_ID INT
);

INSERT INTO TBL_EMPLOYEE (Emp_ID, Emp_Name, Department, Manager_ID)
VALUES 
(1, 'Alice', 'Engineering', NULL),     
(2, 'Bob', 'Engineering', 1),
(3, 'Charlie', 'HR', 1),
(4, 'David', 'Engineering', 2),
(5, 'Eva', 'HR', 3),
(6, 'Frank', 'Marketing', 1),
(7, 'Grace', 'Marketing', 6);

-- Self Join
SELECT 
  E.Emp_Name AS Employee_Name,
  E.Department AS Employee_Dept,
  M.Emp_Name AS Manager_Name,
  M.Department AS Manager_Dept
FROM TBL_EMPLOYEE E
LEFT JOIN
TBL_EMPLOYEE M
ON 
E.Manager_ID = M.Emp_ID;


--HARD

CREATE TABLE Year_tbl (
  ID INT,
  YEAR INT,
  NPV INT
);

INSERT INTO Year_tbl (ID, YEAR, NPV)
VALUES
(1, 2018, 100),
(7, 2020, 30),
(13, 2019, 40),
(1, 2019, 113),
(2, 2008, 121),
(3, 2009, 12),
(11, 2020, 99),
(7, 2019, 0);

CREATE TABLE Queries_tbl (
  ID INT,
  YEAR INT
);

INSERT INTO Queries_tbl (ID, YEAR)
VALUES
(1, 2019),
(2, 2008),
(3, 2009),
(7, 2018),
(7, 2019),
(7, 2020),
(13, 2019);

SELECT 
  Q.ID,
  Q.YEAR,
  ISNULL(Y.NPV, 0) AS NPV
FROM Queries_tbl Q
LEFT JOIN
Year_tbl Y
ON
Q.ID = Y.ID AND Q.YEAR = Y.YEAR
ORDER BY Q.ID, Q.YEAR;
