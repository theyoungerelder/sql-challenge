-- craete tables 

create table employees (
	emp_no int,
	emp_title_id varchar(10),
	birth_date date, 
	first_name text, 
	last_name text, 
	sex varchar(1), 
	hire_date date
	
);
create table dept_manager (
emp_no varchar(10),
dept_no varchar(10)
	);
	
create table dept_emp (
emp_no int,
dept_no varchar(10)
);

create table salaries (
emp_no int, 
salary int
);

create table departments (
dept_no varchar(4),
dept_name varchar(20)
);

create table titles (
title_id char(5), 
title text
);

-- now import the data 
--using point and click

-- analysis 

--List the employee number, last name, first name, sex, and salary of each employee.
SELECT employees.emp_no, first_name, last_name, first_name, sex, salary
FROM employees
INNER JOIN salaries
ON employees.emp_no = salaries.emp_no;


--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
from employees 
where hire_date between '1/01/1986' and '12/31/1986';

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
select  dept_no, departments.dept_name,  emp_no, employees.first_name, employees.last_name
from dept_manager
INNER JOIN employees 
ON  dept_manager.emp_no = employees.emp_no
inner join departments
on departments.dept.no = dept-manager.dept_no
;
--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

--List each employee in the Sales department, including their employee number, last name, and first name.

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
select * from employees;