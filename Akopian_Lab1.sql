CREATE TABLE countries (
    country_id INT PRIMARY KEY,
    country_name VARCHAR(255),
    region_id INT
);

CREATE TABLE сountries();
ERROR:  relation "countries" already exists

CREATE TABLE dup_countries AS
SELECT * FROM countries
WHERE 1=0;

CREATE TABLE dup_countries AS
SELECT * FROM countries;

CREATE TABLE IF NOT EXISTS countries (
  country_id INT PRIMARY KEY,
  country_name VARCHAR(255),
  region_id INT
);

CREATE TABLE jobs (
  job_id INT PRIMARY KEY,
  job_title VARCHAR(255),
  min_salary INT,
  max_salary INT CHECK (max_salary <= 25000)
);

CREATE TABLE countries (
    country_id INT PRIMARY KEY,
    country_name VARCHAR(50) CHECK (country_name IN ('Italy', 'India', 'China')),
    region_id INT
);

CREATE TABLE countries (
    country_id INT PRIMARY KEY,
    country_name VARCHAR(50),
    region_id INT,
    CONSTRAINT unique_country_id UNIQUE (country_id)
);


CREATE TABLE jobs (
    job_id INT PRIMARY KEY,
    job_title VARCHAR(50) DEFAULT '',
    min_salary DECIMAL(10,2) DEFAULT 8000,
    max_salary DECIMAL(10,2) DEFAULT NULL
);

CREATE TABLE countries (
    country_id INT PRIMARY KEY,
    country_name VARCHAR(50),
    region_id INT,
    CONSTRAINT unique_country_id UNIQUE (country_id)
);


CREATE TABLE countries (
    country_id INT AUTO_INCREMENT PRIMARY KEY,
    country_name VARCHAR(50),
    region_id INT,
    UNIQUE (country_id)
);

CREATE TABLE countries (
    country_id INT,
    country_name VARCHAR(50),
    region_id INT,
    CONSTRAINT unique_country_region UNIQUE (country_id, region_id)
);

CREATE TABLE job_history (
    employee_id INT,
    start_date DATE,
    end_date DATE,
    job_id VARCHAR(10),
    department_id INT,
    CONSTRAINT unique_employee_id UNIQUE (employee_id),
    CONSTRAINT fk_job_id FOREIGN KEY (job_id) REFERENCES jobs(job_id)
);

CREATE TABLE employees (
    employee_id INT UNIQUE,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(20),
    hire_date DATE,
    job_id VARCHAR(10),
    salary NUMERIC(8,2),
    commission NUMERIC(8,2),
    manager_id INT NOT NULL,
    department_id INT NOT NULL,
    CONSTRAINT pk_employee_department PRIMARY KEY (manager_id, department_id),
    CONSTRAINT fk_employee_department FOREIGN KEY (department_id, manager_id) REFERENCES departments(department_id, manager_id) );


CREATE TABLE employees (
  employee_id   numeric(6,0)  NOT NULL UNIQUE,
  first_name    varchar(20)   NOT NULL,
  last_name     varchar(25)   NOT NULL,
  email         varchar(50)   NOT NULL,
  phone_number  varchar(20),
  hire_date     date          NOT NULL,
  job_id        varchar(10)   NOT NULL REFERENCES jobs(job_id) ON UPDATE CASCADE ON DELETE RESTRICT,
  salary        numeric(8,2)  NOT NULL,
  commission    numeric(2,2),
  manager_id    numeric(6,0),
  department_id numeric(4,0)  NOT NULL REFERENCES departments(department_id),
  PRIMARY KEY (employee_id)  );


CREATE TABLE employees (
  employee_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  job_id INTEGER NOT NULL,
  salary NUMERIC(10, 2) NOT NULL,
  CONSTRAINT fk_job_id
    FOREIGN KEY (job_id)
    REFERENCES jobs (job_id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
);


CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    job_id INTEGER NOT NULL,
    salary NUMERIC(8,2) NOT NULL,
    CONSTRAINT fk_job_id
        FOREIGN KEY (job_id)
        REFERENCES jobs (job_id)
        ON DELETE CASCADE
        ON UPDATE RESTRICT
);
ALTER TABLE employees ADD CONSTRAINT uq_employee_id UNIQUE (employee_id);



 CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    job_id INTEGER,
    salary NUMERIC(10,2),
    FOREIGN KEY (job_id) REFERENCES jobs(job_id)
        ON DELETE SET NULL
        ON UPDATE SET NULL
);

CREATE TABLE employees (
  employee_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  job_id INTEGER NOT NULL REFERENCES jobs(job_id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  salary NUMERIC(10, 2) NOT NULL,
  UNIQUE (employee_id)
);


ALTER TABLE countries RENAME country_new


ALTER TABLE locations ADD COLUMN region_id numeric(4,0);

ALTER TABLE locations
ALTER COLUMN region_id TYPE TEXT;


ALTER TABLE locations
DROP COLUMN city;


ALTER TABLE locations RENAME COLUMN state_province TO state;

ALTER TABLE locations
ADD CONSTRAINT pk_locations_location_id PRIMARY KEY (location_id);


ALTER TABLE locations
ADD CONSTRAINT pk_location_country PRIMARY KEY (location_id, country_id);


ALTER TABLE locations
DROP CONSTRAINT pk_location_country;


ALTER TABLE job_history
ADD CONSTRAINT fk_job_history_jobs
FOREIGN KEY (job_id)
REFERENCES jobs(job_id);


ALTER TABLE job_history
ADD CONSTRAINT fk_job_id
FOREIGN KEY (job_id)
REFERENCES jobs(job_id);


ALTER TABLE job_history
DROP CONSTRAINT fk_job_id;


CREATE INDEX index_job_id
ON job_history(job_id);


ALTER TABLE job_history
DROP INDEX indx_job_id;


UPDATE employees SET email='not available'

UPDATE employees SET email = 'not available', commission_pct = 0.10;

UPDATE employees SET email = 'not available', commission_pct = 0.10 WHERE department_id = 110;

UPDATE employees SET email = 'not available'
WHERE department_id = 80 AND commission_pct < 0.20;


UPDATE employees SET email = 'not available'
WHERE department_id = (SELECT department_id FROM departments WHERE department_name = 'Accounting');

UPDATE employees SET salary = 8000 WHERE employee_id = 105 AND salary < 5000;


UPDATE employees
SET job_id = 'SH_CLERK'
WHERE employee_id = 118
AND department_id = 30
AND NOT job_id LIKE 'SH%';


UPDATE employees
SET salary =
CASE
    WHEN department_id = 40 THEN salary * 1.25
    WHEN department_id = 90 THEN salary * 1.15
    WHEN department_id = 110 THEN salary * 1.10
    ELSE salary
END
WHERE department_id IN (40, 90, 110);
