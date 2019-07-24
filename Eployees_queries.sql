-- List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT e.emp_no AS "employee number", e.last_name AS "last name",
        e.first_name AS "first name", e.gender, s.salary
FROM employees e
INNER JOIN salaries s ON e.emp_no = s.emp_no;

-- List employees who were hired in 1986.
SELECT *
FROM employees e
WHERE e.hire_date BETWEEN '01/01/1986'  AND '01/31/1986';
-- WHERE e.hire_date >= '01/01/1986'  AND e.hire_date <= '01/31/1986';

-- List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name, 
-- and start and end employment dates.
SELECT dm.dept_no AS "department number", d.dept_name AS "department name",
        dm.emp_no AS "manager employee number", e.last_name AS "manager last name",
        e.first_name AS "manager first name", 
		dm.from_date AS "start employment date", dm.to_date AS "end employment date"
FROM dept_manager dm
LEFT JOIN departments d ON dm.dept_no = d.dept_no
LEFT JOIN employees e ON dm.emp_no = e.emp_no;

SELECT d.dept_no AS "department number", d.dept_name AS "department name",
        dm.emp_no AS "manager employee number", e.last_name AS "manager last name",
        e.first_name AS "manager first name", 
		dm.from_date AS "start employment date", dm.to_date AS "end employment date"
FROM departments d
LEFT JOIN dept_manager dm ON d.dept_no = dm.dept_no
LEFT JOIN employees e ON dm.emp_no = e.emp_no;

-- List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
SELECT e.emp_no AS "employee number", e.last_name AS "last name",
        e.first_name AS "first name", d.dept_name AS "department name"
FROM employees e
LEFT JOIN dept_emp de ON e.emp_no = de.emp_no
LEFT JOIN departments d ON de.dept_no = d.dept_no;

-- List all employees whose first name is "Hercules" and last names begin with "B".
SELECT *
FROM employees e
WHERE e.first_name = 'Hercules'  
  AND e.last_name LIKE 'B%';
  
-- List all employees in the Sales department, including their employee number, last name, first name, 
-- and department name.  
SELECT e.emp_no AS "employee number", e.last_name AS "last name",
        e.first_name AS "first name", d.dept_name AS "department name"
FROM employees e
LEFT JOIN dept_emp de ON e.emp_no = de.emp_no
LEFT JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';  

-- List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name. 
SELECT e.emp_no AS "employee number", e.last_name AS "last name",
        e.first_name AS "first name", d.dept_name AS "department name"
FROM employees e
LEFT JOIN dept_emp de ON e.emp_no = de.emp_no
LEFT JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

-- In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.
SELECT e.last_name AS "last name", count(e.last_name) AS "frequency count"
FROM employees e
GROUP BY e.last_name
ORDER BY "frequency count" DESC;



