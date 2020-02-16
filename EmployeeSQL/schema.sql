-- Drop tables

DROP TABLE departments;
DROP TABLE dept_emp;
DROP TABLE dept_manager;
DROP TABLE employees;
DROP TABLE salaries;
DROP TABLE titles;

-- Create departments table

CREATE TABLE departments (
	id VARCHAR(10) NOT NULL PRIMARY KEY,
	name VARCHAR(40) NOT NULL
);

-- Create employees table

CREATE TABLE employees (
	id INT NOT NULL PRIMARY KEY,
	birth_date DATE NOT NULL,
	first_name VARCHAR(40) NOT NULL,
	last_name VARCHAR(40) NOT NULL,
	gender VARCHAR(1),
	hire_date DATE NOT NULL
);

-- Create dept_emp table

CREATE TABLE dept_emp (
	emp_id INT NOT NULL,
	dept_id VARCHAR(10) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
    FOREIGN KEY (emp_id) REFERENCES employees(id),
	FOREIGN KEY  (dept_id) REFERENCES departments(id)
);

-- Create dept_manager table

CREATE TABLE dept_manager (
	dept_id VARCHAR(10) NOT NULL,
	emp_id INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (dept_id) REFERENCES departments(id),
	FOREIGN KEY (emp_id) REFERENCES employees(id)
);

-- Create salaries table

CREATE TABLE salaries (
	emp_id INT NOT NULL,
	salary INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_id) REFERENCES employees(id)
);

-- Create titles table

CREATE TABLE titles (
	emp_id INT NOT NULL,
	title VARCHAR(40) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_id) REFERENCES employees(id)
);