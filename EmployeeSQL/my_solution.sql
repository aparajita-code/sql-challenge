


--creating the "Departments" table
CREATE TABLE Departments (
    dept_no VARCHAR(10) PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL
);


--importing the csv file from the resource and view Departments Table
select * from Departments;

-- create a new table Department_Employees
CREATE TABLE Department_Employees (
    emp_no INT NOT NULL,
    dept_no VARCHAR(10),
    PRIMARY KEY (emp_no, dept_no),
    CONSTRAINT fk_dept_no FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);

-- view and import table Department_Employees
select * from Department_Employees;


-- create a new table Department_Manager
CREATE TABLE Department_Manager (
    dept_no VARCHAR(10) ,
    emp_no INT NOT NULL,
    PRIMARY KEY (dept_no, emp_no)
);

ALTER TABLE Department_Manager
ADD CONSTRAINT fk_dept_no
FOREIGN KEY (dept_no) REFERENCES Departments(dept_no);

-- import csv and view table
select * from Department_Manager;


--creating a new table "Employee"
CREATE TABLE Employees (
    emp_no INT,
    emp_title_id VARCHAR(10),
    birth_date DATE,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    sex CHAR(1),
    hire_date DATE,
    PRIMARY KEY (emp_no, emp_title_id)
);
--ipmort csv and view table
select * from Employees;


----creating a new table "Salary"
CREATE TABLE Salary (
    emp_no INT,
    salary DECIMAL(10, 2),
    PRIMARY KEY (emp_no)
);
	
--import csv and view table
select * from Salary;



-- creating the table Title
CREATE TABLE Title (
    title_id VARCHAR(10),
    title VARCHAR(100),
    PRIMARY KEY (title_id)
);

-- import csv and view
select * from Title;


--List the employee number, last name, first name, sex, and salary of each employee.
--these are the two tables we need to find out the answer
select * from Employees;
select * from Salary;

-- selecting the columns and joining the tables
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Employees.sex, salary.salary
FROM Employees
JOIN salary ON Employees.emp_no = salary.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.
select * from Employees;

SELECT first_name, last_name, hire_date
FROM Employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';


--List the manager of each department along with their department number, department name, employee number, last name, and first name.
--using these three tables to find the above 
select * from Departments;
select * from Department_Manager;
select * from Employees;

--code
SELECT 
    Departments.dept_no, 
    Departments.dept_name, 
    Employees.emp_no, 
    Employees.last_name, 
    Employees.first_name
FROM 
    Departments
JOIN 
    Department_Manager ON Departments.dept_no = Department_Manager.dept_no
JOIN 
    Employees ON Department_Manager.emp_no = Employees.emp_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
----using these three tables to find the above
select * from Departments;
select * from Department_Employees ;
select * from Employees;

--code by joining the tables
SELECT 
    Department_Employees.dept_no, 
    Employees.emp_no, 
    Employees.last_name, 
    Employees.first_name, 
    Departments.dept_name
FROM 
    Department_Employees
JOIN 
    Employees ON Department_Employees.emp_no = Employees.emp_no
JOIN 
    Departments ON Department_Employees.dept_no = Departments.dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
select * from Employees;

--code
SELECT first_name, last_name, sex
FROM Employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';


--List each employee in the Sales department, including their employee number, last name, and first name.
--using these three tables to find out the above
select * from Departments;
select * from Department_Employees ;
select * from Employees;


--code by joinning the tables
SELECT e.emp_no, e.last_name, e.first_name
FROM Employees e
JOIN Department_Employees de ON e.emp_no = de.emp_no
JOIN Departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

--using these three tables to find out the above
select * from Departments;
select * from Department_Employees ;
select * from Employees;

--code by joinning the tables
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM Employees e
JOIN Department_Employees de ON e.emp_no = de.emp_no
JOIN Departments d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

--using the following table to find out the above
select * from Employees;
--code
SELECT last_name, COUNT(*) AS frequency
FROM Employees
GROUP BY last_name
ORDER BY frequency DESC;