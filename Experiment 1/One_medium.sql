--Learning SubQuery and Access Control
USE Experiments;

CREATE TABLE TBL_DEPARTMENT
(
	DEPT_ID INT PRIMARY KEY,
	DEPT_NAME VARCHAR(MAX)
);

CREATE TABLE TBL_COURSE
(
	COURSE_ID INT PRIMARY KEY,
	COURSE_NAME VARCHAR(MAX),
	DEPTID INT,
	FOREIGN KEY (DEPTID) REFERENCES TBL_DEPARTMENT(DEPT_ID)
);

-- Inserting
INSERT INTO TBL_DEPARTMENT (DEPT_ID, DEPT_NAME)
VALUES 
(1, 'Computer Science'),
(2, 'Electrical'),
(3, 'Mechanical'),
(4, 'Civil'),
(5, 'Mathematics');

INSERT INTO TBL_COURSE (COURSE_ID, COURSE_NAME, DEPTID)
VALUES 
(201, 'Data Structures', 1),
(202, 'Operating Systems', 1),
(203, 'DBMS', 1),
(204, 'Computer Networks', 1),
(205, 'Circuit Theory', 2),
(206, 'Fluid Mechanics', 3),
(207, 'Structural Analysis', 4),
(208, 'Engineering Mathematics I', 5),
(209, 'Engineering Mathematics II', 5),
(210, 'Digital Logic Design', 2);

-- Subquery to find departments with more than 2 courses
SELECT DEPT_NAME
FROM TBL_DEPARTMENT
WHERE DEPT_ID IN (
	SELECT DEPTID
	FROM TBL_COURSE
	GROUP BY DEPTID
	HAVING COUNT(*) > 2
);

-- Creating new user 
CREATE LOGIN readonly_user WITH PASSWORD = '1234';
CREATE USER readonly_user FOR LOGIN readonly_user;

-- Granting SELECT-only access
GRANT SELECT ON TBL_COURSE TO readonly_user;

