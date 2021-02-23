CREATE TABLE Departments (
    dept_no_id VARCHAR(10)   NOT NULL,
    dept_name VARCHAR(25)   NOT NULL,
    CONSTRAINT pk_Departments PRIMARY KEY (
        dept_no_id
     )
);

CREATE TABLE Titles (
    title_id VARCHAR(10)   NOT NULL,
    title VARCHAR(25)   NOT NULL,
    CONSTRAINT pk_Titles PRIMARY KEY (
        title_id
     )
);

CREATE TABLE Employees (
    emp_no INTEGER   NOT NULL,
    emp_title_id VARCHAR(10)   NOT NULL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR(25)   NOT NULL,
    last_name VARCHAR(25)   NOT NULL,
    sex VARCHAR(10)   NOT NULL,
    hire_date DATE   NOT NULL,
    CONSTRAINT pk_Employees PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE Salaries (
    emp_no INTEGER   NOT NULL,
    salary INTEGER   NOT NULL,
    CONSTRAINT pk_Salaries PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE Department_Manager (
    dept_no VARCHAR(10)   NOT NULL,
    emp_no INTEGER   NOT NULL
);

CREATE TABLE Department_Employee (
    emp_no INTEGER   NOT NULL,
    dept_no VARCHAR(10)   NOT NULL
);

ALTER TABLE Employees ADD CONSTRAINT fk_Employees_emp_title_id FOREIGN KEY(emp_title_id)
REFERENCES Titles (title_id);

ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Department_Manager ADD CONSTRAINT fk_Department_Manager_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no_id);

ALTER TABLE Department_Manager ADD CONSTRAINT fk_Department_Manager_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Department_Employee ADD CONSTRAINT fk_Department_Employee_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Department_Employee ADD CONSTRAINT fk_Department_Employee_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no_id);

-- List the following details of each employee: employee number, last name, first name, sex, and salary.


-- Join salary with Employees
Select Employees.emp_no, Employees.last_name, Employees.first_name, Employees.sex, Salaries.salary
from 
	Employees
		inner join
	Salaries
		on Employees.emp_no=Salaries.emp_no
		
-- List first name, last name, and hire date for employees who were hired in 1986
select first_name, last_name, hire_date 
from Employees
where hire_date between '1986-01-01' and '1986-12-31';

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
select Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
from 
	Employees
	inner join
	Department_Employee 
		on Employees.emp_no=Department_Employee.emp_no
		
	inner join
	Departments
		on Department_Employee.dept_no=Departments.dept_no_id;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name, sex 
from 
	Employees
where first_name = 'Hercules'
	and last_name like '%B%';
	
	
-- BONUS 

		
	