# sql-challenge

This repository contains the SQL database for My_EmployeeSQL. 
The database includes tables for a research project about people whom the 
company employed during the 1980s and 1990s. I was able to use what remained
of the employee database from that period, which amounted to six CSV files.

I designed tables to hold the data from the CSV files, imported the CSV files 
into a SQL database, and then answered questions about the data.

I began by cloning this public repo to my local computer:
https://github.com/LarryJilesJr/sql-challenge.git

I also installed and utilized pgAdmin 4 as well as used 
quickdatabasediagrams.com to help perform data modeling, data engineering, and 
data analysis.

--
The Database Schema includes the following tables:
1. "DEPARTMENTS"
Description: 
This table contains details about different departments in the organization.

Columns:
dept_no (CHAR): Department number (Primary Key)
dept_name (VARCHAR): Name of the department

2. "EMPLOYEES"
Description: 
This table stores information about employees in the organization.

Columns:
emp_no (INT): Employee number (Primary Key)
first_name (VARCHAR): First name of the employee
last_name (VARCHAR): Last name of the employee
gender (CHAR): Gender of the employee (e.g., 'M' or 'F')
hire_date (DATE): Date when the employee was hired

3. "DEPT_EMP"
Description: 
This table represents the employee-department assignments, indicating which 
employee belongs to which department.

Columns:
emp_no (INT): Employee number (Foreign Key referencing employees.emp_no)
dept_no (CHAR): Department number (Foreign Key referencing departments.dept_no)
from_date (DATE): Start date of the employee's assignment to the department
to_date (DATE): End date of the employee's assignment to the department

4. "DEPT_MANAGER"
Description: 
This table indicates the managers for each department.

Columns:
emp_no (INT): Employee number of the manager (Foreign Key referencing employees.emp_no)
dept_no (CHAR): Department number (Foreign Key referencing departments.dept_no)
from_date (DATE): Start date of the manager's assignment to the department
to_date (DATE): End date of the manager's assignment to the department

5. "SALARIES"
Description: 
This table contains information about employee salaries over time.

Columns:
emp_no (INT): Employee number (Foreign Key referencing employees.emp_no)
salary (INT): Employee's salary
from_date (DATE): Start date of the salary record
to_date (DATE): End date of the salary record

6. "TITLES"
Description: 
This table stores historical information about employee job titles.

Columns:
emp_no (INT): Employee number (Foreign Key referencing employees.emp_no)
title (VARCHAR): Employee's job title
from_date (DATE): Start date of the job title
to_date (DATE): End date of the job title

--
Here are some example queries you can run on the database:
sql
SELECT * FROM table_name WHERE condition;

sql
SELECT column1, column2 FROM table_name WHERE condition;

--
**If you'd like to contribute to this project, please follow these steps:

Fork the repository
Create a new branch (git checkout -b feature/your-feature)
Make changes and commit (git commit -m 'Add new feature')
Push to the branch (git push origin feature/your-feature)
Create a pull request

--
**Source Data: 

Chat GPT Provider: OpenAI Model Version: GPT-3.5 Training Data: Diverse internet text Training Duration: Training duration was about 2-3 hours @article{openai2023, author = {OpenAI}, title = {ChatGPT: A Language Model by OpenAI}, year = {2023}, url = {https://www.openai.com}, }

Class Videos

Classmates during study session

Stackoverflow

YouTube:
How to Make and Use an ERD/EER Diagram in MYSQL Workbench https://youtu.be/tEhGIYN4vic

How To Design ER Diagrams Online For Rails and Relational SQL Database Tables https://youtu.be/chrwT-qe_M8

