--Employee Number, Last Name, First Name, Sex, and Salary
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no;

--Employees Hired in 1986
SELECT employees.first_name, employees.last_name, employees.hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

--Manager of Each Department
SELECT dept_manager.dept_no, department.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
JOIN employees ON dept_manager.emp_no = employees.emp_no
JOIN department ON dept_manager.dept_no = departments.dept_no;

--Department Number for Each Employee
SELECT dept_emp.dept_no, dept_emp.emp_no, employees.last_name, employees.first_name, department.dept_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN department ON dept_emp.dept_no = department.dept_no;

--Employees Named "Hercules" with Last Name Starting with "B"
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--Employees in the Sales Department
SELECT employees.emp_no, employees.last_name, employees.first_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN department ON dept_emp.dept_no = department.dept_no
WHERE department.dept_name = 'Sales';

--Employees in the Sales and Development Departments
SELECT employees.emp_no, employees.last_name, employees.first_name, department.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN department ON dept_emp.dept_no = department.dept_no
WHERE department.dept_name IN ('Sales', 'Development');

--Frequency Counts of Employee Last Names
SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;
