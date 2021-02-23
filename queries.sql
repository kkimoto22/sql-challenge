-- List the following details of each employee: employee number, last name, first name, sex, and salary. Join salary with Employees
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

--  List all employees in the Sales department, including their employee number, last name, first name, and department name.	
select Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
from Employees
	inner join 
	Department_Employee
		on Employees.emp_no=Department_Employee.emp_no
		
	inner join
	Departments
		on Department_Employee.dept_no=Departments.dept_no_id
		
		where dept_name = 'Sales';

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
from Employees
	inner join 
	Department_Employee
		on Employees.emp_no=Department_Employee.emp_no
		
	inner join
	Departments
		on Department_Employee.dept_no=Departments.dept_no_id
		
		where dept_name = 'Sales' 
		or dept_name = 'Development';

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name,
 COUNT(emp_no) 
FROM Employees
GROUP BY  last_name
ORDER BY COUNT(emp_no) DESC ;