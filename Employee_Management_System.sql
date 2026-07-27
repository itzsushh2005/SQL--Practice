CREATE TABLE Department (
    dept_id NUMBER PRIMARY KEY,
    dept_name VARCHAR2(50),
    location VARCHAR2(50)
);
CREATE TABLE Employee (
    emp_id NUMBER PRIMARY KEY,
    emp_name VARCHAR2(50) NOT NULL,
    gender VARCHAR2(10),
    dob DATE,
    salary NUMBER(10,2),
    hire_date DATE,
    dept_id NUMBER,
    email VARCHAR2(100) UNIQUE,
    phone VARCHAR2(15),
    CONSTRAINT fk_department
    FOREIGN KEY(dept_id)
    REFERENCES Department(dept_id)
);
CREATE TABLE Attendance (
    attendance_id NUMBER PRIMARY KEY,
    emp_id NUMBER,
    attendance_date DATE,
    status VARCHAR2(10),
    CONSTRAINT fk_employee
    FOREIGN KEY(emp_id)
    REFERENCES Employee(emp_id)
);
CREATE TABLE Project (
    project_id NUMBER PRIMARY KEY,
    project_name VARCHAR2(100),
    start_date DATE,
    end_date DATE
);
CREATE TABLE Employee_Project (
    emp_id NUMBER,
    project_id NUMBER,
    PRIMARY KEY(emp_id, project_id),
    FOREIGN KEY(emp_id)
    REFERENCES Employee(emp_id),
    FOREIGN KEY(project_id)
    REFERENCES Project(project_id)
);
INSERT INTO Department VALUES(1,'HR','Bhubaneswar');

INSERT INTO Department VALUES(2,'IT','Bangalore');

INSERT INTO Department VALUES(3,'Finance','Hyderabad');

INSERT INTO Department VALUES(4,'Marketing','Delhi');
INSERT INTO Employee VALUES
(101,'Rahul Sharma','Male',
DATE '2001-05-10',
55000,
DATE '2024-01-10',
2,
'rahul@gmail.com',
'9876543210');

INSERT INTO Employee VALUES
(102,'Priya Das','Female',
DATE '2000-08-15',
48000,
DATE '2023-07-20',
1,
'priya@gmail.com',
'9876543211');

INSERT INTO Employee VALUES
(103,'Amit Kumar','Male',
DATE '1999-12-01',
62000,
DATE '2022-05-11',
3,
'amit@gmail.com',
'9876543212');

INSERT INTO Employee VALUES
(104,'Sneha Roy','Female',
DATE '2002-01-25',
45000,
DATE '2024-03-15',
4,
'sneha@gmail.com',
'9876543213');
INSERT INTO Attendance VALUES
(1,101,DATE '2026-07-20','Present');

INSERT INTO Attendance VALUES
(2,102,DATE '2026-07-20','Absent');

INSERT INTO Attendance VALUES
(3,103,DATE '2026-07-20','Present');

INSERT INTO Attendance VALUES
(4,104,DATE '2026-07-20','Present');
INSERT INTO Project VALUES
(201,'Banking System',
DATE '2026-01-01',
DATE '2026-06-30');

INSERT INTO Project VALUES
(202,'Employee Portal',
DATE '2026-02-01',
DATE '2026-08-30');

INSERT INTO Project VALUES
(203,'Payroll System',
DATE '2026-03-10',
DATE '2026-12-31');
INSERT INTO Employee_Project VALUES(101,201);

INSERT INTO Employee_Project VALUES(101,202);

INSERT INTO Employee_Project VALUES(102,203);

INSERT INTO Employee_Project VALUES(103,201);

INSERT INTO Employee_Project VALUES(104,202);
SELECT * FROM Employee;
SELECT * FROM Department;
SELECT *
FROM Employee
WHERE salary>50000;
SELECT *
FROM Employee
ORDER BY salary DESC;
UPDATE Employee
SET salary=60000
WHERE emp_id=104;
DELETE FROM Attendance
WHERE attendance_id=2;
SELECT COUNT(*)
FROM Employee;
SELECT MAX(salary)
FROM Employee;
SELECT AVG(salary)
FROM Employee;
SELECT dept_id,
AVG(salary)
FROM Employee
GROUP BY dept_id;
SELECT
e.emp_name,
d.dept_name,
e.salary
FROM Employee e
JOIN Department d
ON e.dept_id=d.dept_id;
SELECT
e.emp_name,
p.project_name
FROM Employee e
JOIN Employee_Project ep
ON e.emp_id=ep.emp_id
JOIN Project p
ON ep.project_id=p.project_id;
CREATE VIEW Employee_Details AS

SELECT
e.emp_name,
d.dept_name,
e.salary

FROM Employee e
JOIN Department d
ON e.dept_id=d.dept_id;
SELECT * FROM Employee_Details;
CREATE SEQUENCE emp_seq

START WITH 105

INCREMENT BY 1;
CREATE OR REPLACE TRIGGER trg_hiredate

BEFORE INSERT

ON Employee

FOR EACH ROW

BEGIN

IF :NEW.hire_date IS NULL THEN

:NEW.hire_date:=SYSDATE;

END IF;

END;
/
CREATE OR REPLACE PROCEDURE IncreaseSalary
(
id NUMBER,
percent NUMBER
)

AS

BEGIN

UPDATE Employee

SET salary=salary+(salary*percent/100)

WHERE emp_id=id;

COMMIT;

END;
/
BEGIN

IncreaseSalary(101,10);

END;
/
DESC Employee;

DESC Department;

DESC Attendance;

DESC Project;

DESC Employee_Project;
SELECT * FROM user_tables;
SELECT * FROM Department;
SELECT * FROM Employee;