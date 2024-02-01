-- CREATING my_emp SCHEMATA TABLES 

CREATE TABLE "DEPARTMENTS" (
    dept_no VARCHAR(50) PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);

CREATE TABLE "EMPLOYEES" (
    emp_no INT PRIMARY KEY,
    emp_title_id VARCHAR(50) NOT NULL,
    birth_date VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    sex VARCHAR(50) NOT NULL,
    hire_date VARCHAR(50) NOT NULL
);

CREATE TABLE "DEPT_EMP" (
    emp_no INT NOT NULL,
    dept_no VARCHAR(50) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES "DEPARTMENTS"(dept_no)
);

CREATE TABLE "DEPT_MANAGER" (
    dept_no VARCHAR(50) NOT NULL,
    emp_no INT NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES "DEPARTMENTS"(dept_no),
	FOREIGN KEY (emp_no) REFERENCES "EMPLOYEES"(emp_no)
);

CREATE TABLE "SALARIES" (
    emp_no INT NOT NULL,
    salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES "EMPLOYEES"(emp_no)
);

CREATE TABLE "TITLES" (
    title_id VARCHAR(50) NOT NULL,
    title VARCHAR(50) NOT NULL
);

--View table columns and data types
SELECT * FROM "DEPARTMENTS"
SELECT * FROM "EMPLOYEES"
SELECT * FROM "DEPT_EMP"
SELECT * FROM "DEPT_MANAGER"
SELECT * FROM "SALARIES"
SELECT * FROM "TITLES"

--**CREATING my_emp QUERIES

-- Listing the employee numbers, last names, first names, sex, and salaries 
-- of each employee

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM "EMPLOYEES" e
JOIN "SALARIES" s ON e.emp_no = s.emp_no;

-- Listing the first names, last names, and hire dates for the employees 
-- who were hired in 1986

SELECT first_name, last_name, hire_date
FROM "EMPLOYEES"
WHERE EXTRACT(YEAR FROM hire_date::date) = 1986;

-- Listing the manager of each department along with their department number, 
-- department name, employee number, last name, and first name

SELECT
    d.dept_no,
    d.dept_name,
    m.emp_no AS manager_emp_no,
    e.last_name AS manager_last_name,
    e.first_name AS manager_first_name
FROM
    "DEPARTMENTS" d
JOIN
    "DEPT_MANAGER" m ON d.dept_no = m.dept_no
JOIN
    "EMPLOYEES" e ON m.emp_no = e.emp_no;
	
-- Listing the department number for each employee along with that 
-- employee’s employee number, last name, first name, and department name

SELECT
	de.dept_no,
    e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
FROM
    "EMPLOYEES" e
JOIN
    "DEPT_EMP" de ON e.emp_no = de.emp_no
JOIN
    "DEPARTMENTS" d ON de.dept_no = d.dept_no;
	
-- Listing first name, last name, and sex of each employee whose first name is 
-- Hercules and whose last name begins with the letter B.

SELECT
    first_name,
    last_name,
    sex
FROM
    "EMPLOYEES"
WHERE
    first_name = 'Hercules'
    AND last_name LIKE 'B%';
	
-- Listing each employee in the Sales department, including their employee 
-- number, last name, and first name

SELECT
    e.emp_no,
    e.last_name,
    e.first_name
FROM
    "EMPLOYEES" e
JOIN
    "DEPT_EMP" de ON e.emp_no = de.emp_no
JOIN
    "DEPARTMENTS" d ON de.dept_no = d.dept_no
WHERE
    d.dept_name = 'Sales';

-- Listing each employee in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name

SELECT
    e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
FROM
    "EMPLOYEES" e
JOIN
    "DEPT_EMP" de ON e.emp_no = de.emp_no
JOIN
    "DEPARTMENTS" d ON de.dept_no = d.dept_no
WHERE
    d.dept_name IN ('Sales', 'Development');
	
-- Listing the frequency counts, in descending order, of all the employee 
-- last names (that is, how many employees each share their last name)

SELECT
    last_name,
    COUNT(*) AS frequency
FROM
    "EMPLOYEES"
GROUP BY
    last_name
ORDER BY
    frequency DESC, last_name;