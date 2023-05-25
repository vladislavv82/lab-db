SELECT locations.location_id, street_address, city, state_province, country_name, department_name FROM locations NATURAL JOIN countries, departments;

SELECT first_name, last_name, department_id, department_name FROM employees JOIN departments USING (department_id);

SELECT first_name, last_name, job_id, department_name, employee_id
FROM employees JOIN departments USING (department_id) JOIN locations USING (location_id) WHERE city = 'London';

SELECT e.first_name, e.last_name, e.hire_date FROM employees e
JOIN employees j
ON (j.last_name ='Jones')
WHERE j.hire_date < e.hire_date;

SELECT department_name, COUNT(employee_id) FROM employees JOIN departments USING (department_id) GROUP BY department_name;


SELECT employee_id, job_title, CURRENT_DATE - employees.hire_date FROM employees JOIN jobs USING (job_id) WHERE department_id = 90;

-----------------------------------------------
SELECT first_name, last_name, salary FROM employees
WHERE salary > (SELECT salary FROM employees WHERE last_name = 'Bull');


SELECT first_name, last_name FROM employees
WHERE department_id IN (SELECT department_id FROM departments WHERE department_name='IT');


SELECT first_name, last_name FROM employees
WHERE manager_id IN (SELECT employee_id FROM employees
WHERE department_id IN (SELECT department_id FROM departments
WHERE location_id IN (SELECT location_id FROM locations WHERE country_id='US')));

SELECT first_name, last_name, job_title FROM employees JOIN jobs USING (job_id)
WHERE (employee_id IN (SELECT manager_id FROM employees));


SELECT first_name, last_name, salary FROM employees
WHERE salary = (SELECT min_salary FROM jobs WHERE employees.job_id = jobs.job_id);


SELECT * FROM employees WHERE salary = (SELECT MIN(salary) FROM employees);