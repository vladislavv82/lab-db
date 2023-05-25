UPDATE employees SET email = 'not available'

UPDATE employees SET email = 'not available', commission_pct = 0.10

UPDATE employees SET email = 'not available', commission_pct = 0.10 WHERE department_id = 110

UPDATE employees SET email = 'not available' WHERE department_id = 80 AND commission_pct < 0.20

UPDATE employees
SET EMAIL = 'not available'
WHERE DEPARTMENT_ID = (SELECT department_id FROM departments WHERE department_name = 'Accounting');

UPDATE employees
SET SALARY = 8000
WHERE EMPLOYEE_ID = 105 AND SALARY < 5000;

UPDATE employees
SET JOB_ID = 'toSH_CLERK'
WHERE EMPLOYEE_ID = 118 AND DEPARTMENT_ID = 30 AND NOT JOB_ID LIKE 'SH%';

UPDATE employees
SET SALARY = CASE
    WHEN DEPARTMENT_ID = 40 THEN SALARY * 1.25
    WHEN DEPARTMENT_ID = 90 THEN SALARY * 1.15
    WHEN DEPARTMENT_ID = 110 THEN SALARY * 1.10
    ELSE SALARY
END
WHERE DEPARTMENT_ID IN (40, 90, 110);

SELECT first_name AS "First Name", last_name AS "Last Name"
FROM employees;


SELECT DISTINCT DEPARTMENT_ID
FROM employees;

SELECT * FROM employees ORDER BY FIRST_NAME DESC;

SELECT first_name, last_name, salary, salary * 0.15 AS PF
FROM employees;

SELECT employee_id, first_name, last_name, salary
FROM employees
ORDER BY salary ASC;

SELECT SUM(salary) AS total_salary
FROM employees;

SELECT MAX(salary) AS max_salary, MIN(salary) AS min_salary
FROM employees;

SELECT AVG(salary) AS average_salary, COUNT(*) AS employee_count
FROM employees;

SELECT COUNT(*) AS employee_count
FROM EMPLOYEE;

SELECT COUNT(DISTINCT JOB_ID) AS unique_assignments
FROM employees;

SELECT UPPER(first_name) AS upper_case_name
FROM employees;

SELECT SUBSTRING(first_name, 1, 3) AS first_three_chars
FROM employees;

SELECT 171*214+625 AS result;

SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM employees;

SELECT TRIM(first_name) AS trimmed_first_name, TRIM(last_name) AS trimmed_last_name FROM employees;

SELECT first_name, last_name, LENGTH(CONCAT(first_name, last_name)) AS name_length FROM employees;

SELECT first_name FROM employees WHERE first_name LIKE '%[0-9]%';

SELECT * FROM employees LIMIT 10;

SELECT first_name, last_name, ROUND(salary/12.0, 2) AS monthly_salary FROM employees;

SELECT COUNT(*) AS total_jobs FROM employees;

SELECT SUM(salary) AS total_salary FROM employees;

SELECT MIN(salary) AS min_salary FROM employees;

SELECT MAX(salary) AS max_salary FROM employees WHERE JOB_ID = 'IT_PROG';

SELECT AVG(salary) AS average_salary, 
COUNT(*) AS employee_count FROM employees WHERE department_id = 90;

SELECT MAX(salary) AS highest_salary, MIN(salary) AS lowest_salary, SUM(salary) AS total_salary, AVG(salary) AS average_salary
FROM employees;

SELECT job_id, COUNT(*) AS employee_count FROM employees GROUP BY job_id;

SELECT MAX(salary) - MIN(salary) AS salary_difference FROM employees;

SELECT manager_id, MIN(salary) AS lowest_salary FROM employees GROUP BY manager_id;

SELECT department_id, SUM(salary) AS total_salary FROM employees GROUP BY department_id;

SELECT job_id, AVG(salary) AS average_salary FROM employees WHERE job_id <> 'IT_PROG' GROUP BY job_id;

SELECT 
    SUM(salary) AS total_salary,
    MAX(salary) AS max_salary,
    MIN(salary) AS min_salary,
    AVG(salary) AS average_salary
FROM 
    employees
WHERE 
    department_id = 90;


SELECT job_id, MAX(salary) AS max_salary
FROM employees
GROUP BY job_id
HAVING MAX(salary) >= 4000;

SELECT department_id, AVG(salary) AS average_salary
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 10;