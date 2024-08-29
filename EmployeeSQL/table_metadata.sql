--creating the "Departments" table
CREATE TABLE Departments (
    dept_no VARCHAR(10) PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL
);

-- create a new table Department_Employees
CREATE TABLE Department_Employees (
    emp_no INT NOT NULL,
    dept_no VARCHAR(10),
    PRIMARY KEY (emp_no, dept_no),
    CONSTRAINT fk_dept_no FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);

-- create a new table Department_Manager
CREATE TABLE Department_Manager (
    dept_no VARCHAR(10) ,
    emp_no INT NOT NULL,
    PRIMARY KEY (dept_no, emp_no)
);

ALTER TABLE Department_Manager
ADD CONSTRAINT fk_dept_no
FOREIGN KEY (dept_no) REFERENCES Departments(dept_no);


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

----creating a new table "Salary"
CREATE TABLE Salary (
    emp_no INT,
    salary DECIMAL(10, 2),
    PRIMARY KEY (emp_no)
);

-- creating the table Title
CREATE TABLE Title (
    title_id VARCHAR(10),
    title VARCHAR(100),
    PRIMARY KEY (title_id)
);