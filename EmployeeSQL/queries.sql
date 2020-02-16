--List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT e.id, e.first_name, e.last_name, e.gender, s.salary
FROM employees e
JOIN salaries s ON
e.id = s.emp_id;


-- List employees who were hired in 1986.

SELECT *
FROM employees
WHERE EXTRACT (YEAR FROM hire_date) = 1986;


-- List the manager of each department with the following information: department number, department name, 
-- the manager's employee number, last name, first name, and start and end employment dates.

SELECT dm.dept_id, d.name, dm.emp_id, e.first_name, e.last_name, dm.from_date, dm.to_date
FROM dept_manager dm
JOIN departments d ON
d.id = dm.dept_id
JOIN employees e ON
e.id = dm.emp_id;


-- List the department of each employee with the following information: employee number, last name, 
-- first name, and department name.

SELECT d.name, e.id, e.last_name, e.first_name
FROM dept_emp de
JOIN departments d ON
d.id = de.dept_id
JOIN employees e ON 
e.id = de.emp_id
ORDER BY e.id;

        
-- List all employees with first name Hercules and last name starting w/ B

SELECT first_name, last_name, "id"
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
ORDER BY id;


-- List all employees in the Sales department, including their employee number, last name, first name, 
-- and department name.

SELECT e.id, e.last_name, e.first_name, d.name
FROM departments d
JOIN dept_emp de ON 
de.dept_id = d.id
JOIN employees e ON 
e.id = de.emp_id
WHERE d.name = 'Sales'
ORDER BY e.id;


-- List all employees in the Sales and Development departments, including their employee number, 
-- last name, first name, and department name.

SELECT e.id, e.last_name, e.first_name, d.name
FROM employees e
JOIN dept_emp de ON
e.id = de.emp_id
JOIN departments d ON
de.dept_id = d.id
WHERE d.name = 'Sales' OR d.name = 'Development';


-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT COUNT(last_name) as last_name_count, last_name
FROM employees
GROUP BY last_name
ORDER BY last_name_count DESC;