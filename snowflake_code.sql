CREATE TABLE EMPLOYEE_MASTER (
  EMP_ID INT,
  NAME STRING,
  DEPT STRING,
  JOINING_DATE DATE,
  SALARY NUMBER
);
INSERT INTO EMPLOYEE_MASTER (EMP_ID, NAME, DEPT, JOINING_DATE, SALARY) VALUES
(101, 'Vaishnavi', 'IT', '2021-04-10', 55000),
(102, 'Rohan', 'Finance', '2020-06-15', 60000),
(103, 'Sneha', 'HR', '2022-01-20', 48000),
(104, 'Amit', 'IT', '2023-03-05', 70000),
(105, 'Pooja', 'Marketing', '2021-10-12', 52000),
(106, 'Arjun', 'Sales', '2020-08-25', 45000),
(107, 'Neha', 'IT', '2019-11-14', 75000),
(108, 'Kunal', 'Finance', '2024-02-01', 62000),
(109, 'Rita', 'Admin', '2023-07-18', 50000),
(110, 'Sameer', 'HR', '2020-04-30', 47000),
(111, 'Divya', 'Sales', '2022-09-11', 49000),
(112, 'Kabir', 'Marketing', '2024-01-03', 53000),
(113, 'Sanjay', 'Finance', '2021-06-17', 65000),
(114, 'Manisha', 'Admin', '2022-12-22', 51000),
(115, 'Harsh', 'IT', '2023-05-09', 78000);
SELECT * FROM EMPLOYEE_MASTER;

CREATE TABLE EMPLOYEE_TASKS (
  TASK_ID INT,
  EMP_ID INT,
  TASK_NAME STRING,
  STATUS STRING,
  ASSIGNED_DATE DATE,
  COMPLETED_DATE DATE
);
INSERT INTO EMPLOYEE_TASKS (TASK_ID, EMP_ID, TASK_NAME, STATUS, ASSIGNED_DATE, COMPLETED_DATE) VALUES
(1, 101, 'Prepare Report', 'Completed', '2024-01-02', '2024-01-05'),
(2, 102, 'Client Follow-up', 'Completed', '2024-01-10', '2024-01-12'),
(3, 103, 'Recruitment Drive', 'Pending', '2024-01-15', NULL),
(4, 104, 'Code Review', 'Completed', '2024-02-01', '2024-02-03'),
(5, 105, 'Market Analysis', 'Completed', '2024-02-10', '2024-02-15'),
(6, 106, 'Sales Pitch', 'Pending', '2024-02-18', NULL),
(7, 107, 'Server Maintenance', 'Completed', '2024-03-01', '2024-03-04'),
(8, 108, 'Financial Audit', 'Completed', '2024-03-05', '2024-03-10'),
(9, 109, 'Inventory Check', 'Completed', '2024-03-12', '2024-03-14'),
(10, 110, 'Employee Training', 'Pending', '2024-03-17', NULL),
(11, 111, 'Lead Generation', 'Completed', '2024-03-20', '2024-03-22'),
(12, 112, 'Product Presentation', 'Completed', '2024-03-25', '2024-03-28'),
(13, 113, 'Balance Sheet Review', 'Completed', '2024-04-02', '2024-04-05'),
(14, 114, 'Office Setup', 'Completed', '2024-04-07', '2024-04-10'),
(15, 115, 'API Development', 'Pending', '2024-04-10', NULL),
(16, 101, 'Data Cleaning', 'Completed', '2024-04-12', '2024-04-14'),
(17, 102, 'Policy Update', 'Completed', '2024-04-14', '2024-04-16'),
(18, 103, 'Interview Scheduling', 'Completed', '2024-04-18', '2024-04-20'),
(19, 104, 'Unit Testing', 'Completed', '2024-04-22', '2024-04-25'),
(20, 105, 'Digital Campaign', 'Pending', '2024-04-24', NULL);

SELECT * FROM EMPLOYEE_TASKS;
CREATE STAGE emp_stagee;


CREATE OR REPLACE TABLE FINAL_EMPLOYEE_PERFORMANCE (
  EMP_ID INT,
  TOTAL_TASKS INT,
  TASKS_COMPLETED INT,
  AVG_COMPLETION_DAYS NUMBER,
  RATING STRING
);

COPY INTO FINAL_EMPLOYEE_PERFORMANCE
FROM @PROJECTTT.PUBLIC.EMP_STAGEE
FILE_FORMAT = (
  TYPE = CSV
  FIELD_OPTIONALLY_ENCLOSED_BY='"'
  SKIP_HEADER=1
)
ON_ERROR = 'CONTINUE';


LIST @PROJECTTT.PUBLIC.EMP_STAGEE;

COPY INTO FINAL_EMPLOYEE_PERFORMANCE
FROM @PROJECTTT.PUBLIC.EMP_STAGEE
FILE_FORMAT = (
  TYPE = CSV
  SKIP_HEADER = 1
  FIELD_OPTIONALLY_ENCLOSED_BY = '"'
)
ON_ERROR = 'CONTINUE';

SELECT * FROM FINAL_EMPLOYEE_PERFORMANCE;


