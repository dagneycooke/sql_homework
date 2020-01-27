DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
	dept_no VARCHAR NOT NULL PRIMARY KEY,
	dept_name VARCHAR NOT NULL,
	CONSTRAINT no_repeat_names UNIQUE(dept_name)
);
	
COPY departments 
FROM '/Users/dagneycooke/UCB-BEL-DATA-PT-11-2019-U-C/02-Homework/09-SQL/Instructions/data/departments.csv'
CSV HEADER;

CREATE TABLE employees(
	emp_no INT NOT NULL PRIMARY KEY,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	gender VARCHAR(1) NOT NULL,
	hire_date VARCHAR NOT NULL
);

COPY employees
FROM '/Users/dagneycooke/UCB-BEL-DATA-PT-11-2019-U-C/02-Homework/09-SQL/Instructions/data/employees.csv'
CSV HEADER;

CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
	from_date VARCHAR NOT NULL,
	to_date VARCHAR NOT NULL, -- come back and fix formatting on this
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

COPY dept_emp 
FROM '/Users/dagneycooke/UCB-BEL-DATA-PT-11-2019-U-C/02-Homework/09-SQL/Instructions/data/dept_emp.csv'
CSV HEADER;

CREATE TABLE dept_manager(
	dept_no VARCHAR NOT NULL,
	emp_no INT NOT NULL,
	from_date VARCHAR NOT NULL,
	to_date VARCHAR NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	CONSTRAINT one_manager PRIMARY KEY (dept_no,from_date)
);

COPY dept_manager
FROM '/Users/dagneycooke/UCB-BEL-DATA-PT-11-2019-U-C/02-Homework/09-SQL/Instructions/data/dept_manager.csv'
CSV HEADER;

CREATE TABLE salaries(
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	from_date VARCHAR NOT NULL,
	to_date VARCHAR NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	CONSTRAINT one_salary PRIMARY KEY (emp_no,from_date)
);

COPY salaries
FROM '/Users/dagneycooke/UCB-BEL-DATA-PT-11-2019-U-C/02-Homework/09-SQL/Instructions/data/salaries.csv'
CSV HEADER;

CREATE TABLE titles(
	emp_no INT NOT NULL,
	title VARCHAR NOT NULL,
	from_date VARCHAR NOT NULL,
	to_date VARCHAR NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	CONSTRAINT one_title PRIMARY KEY(emp_no,from_date)
);

COPY titles
FROM '/Users/dagneycooke/UCB-BEL-DATA-PT-11-2019-U-C/02-Homework/09-SQL/Instructions/data/titles.csv'
CSV HEADER;
