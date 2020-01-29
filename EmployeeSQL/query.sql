-- List the following details of each employee: 
-- employee number, last name, first name, gender, and salary.

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM salaries
LEFT JOIN employees
ON employees.emp_no = salaries.emp_no;

-------------------------------------------------

-- List employees who were hired in 1986.

SELECT * FROM employees WHERE employees.hire_date BETWEEN '1986-1-1' AND '1986-12-31';

-------------------------------------------------

-- List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, 
-- first name, and start and end employment dates.
-- SELECT EXTRACT(YEAR FROM hire_date) FROM employees

SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name, employees.hire_date, EXTRACT (YEAR FROM salaries.to_date)
FROM dept_manager
LEFT JOIN employees
ON dept_manager.emp_no = employees.emp_no
LEFT JOIN departments
ON dept_manager.dept_no = departments.dept_no
LEFT JOIN salaries
ON dept_manager.emp_no = salaries.emp_no;

-------------------------------------------------

-- List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM departments
LEFT JOIN dept_emp
ON departments.dept_no = dept_emp.dept_no
LEFT JOIN employees
ON employees.emp_no = dept_emp.emp_no;

-------------------------------------------------

--List all employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name FROM employees 
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-------------------------------------------------

--List all employees in the Sales department, including their 
-- employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
LEFT JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
LEFT JOIN departments
ON departments.dept_no = dept_emp.dept_no
WHERE dept_name = 'Sales';

-------------------------------------------------
	
-- List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
LEFT JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
LEFT JOIN departments
ON departments.dept_no = dept_emp.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

-------------------------------------------------
	
-- In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;

-------------------------------------------------






