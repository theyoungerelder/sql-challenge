-- craete tables 

create table employees (
	emp_no int NOT NULL,
	emp_title_id varchar(10),
	birth_date date, 
	first_name text, 
	last_name text, 
	sex varchar(1), 
	hire_date date,
	PRIMARY KEY (emp_no)
	
);

create table dept_manager (
dept_no varchar(10),
emp_no int NOT NULL,
	PRIMARY KEY (emp_no)
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)

	);
	
create table dept_emp (
emp_no int NOT NULL,
dept_no varchar(10),
	PRIMARY KEY (emp_no)
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)

);

create table salaries (
emp_no int NOT NULL, 
salary int,
PRIMARY KEY (emp_no)
FOREIGN KEY (emp_no) REFERENCES employees(emp_no)

);

create table departments (
dept_no varchar(4) NOT NULL,
dept_name varchar(20),
PRIMARY KEY (dept_no)
);

create table titles (
title_id char(5) NOT NULL, 
title text,
	PRIMARY KEY (title_id)
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
select  dept_manager.dept_no, departments.dept_name,  dept_manager.emp_no, employees.first_name, employees.last_name
from dept_manager
INNER JOIN employees 
ON  dept_manager.emp_no = employees.emp_no
inner join departments
on departments.dept_no = dept_manager.dept_no;
--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT dept_emp.dept_no, dept_emp.emp_no, last_name, first_name, departments.dept_name
FROM employees
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.

SELECT employees.emp_no, last_name, first_name
FROM employees
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
 SELECT employees.emp_no, last_name, first_name, departments.dept_name
FROM employees
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales'or departments.dept_name = 'Development';
--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;
