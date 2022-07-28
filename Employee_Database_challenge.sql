-- Joing Employees and Titles tables to create retirement_titles table
SELECT Employees.emp_no, Employees.first_name, Employees.last_name,
        Titles.title, Titles.from_date, Titles.to_date
INTO retirement_titles
FROM Employees
INNER JOIN Titles
ON Employees.emp_no = Titles.emp_no
WHERE Employees.birth_date BETWEEN '1952-01-01' AND '1955-12-31';

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title,
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

SELECT COUNT(title), title 
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;

SELECT DISTINCT ON(emp_no) ep.emp_no, ep.first_name, ep.last_name, ep.birth_date,
        de.from_date, de.to_date,
        ti.title
INTO mentorship_eligibility
FROM Employees AS ep
INNER JOIN Dept_Emp AS de
ON (ep.emp_no = de.emp_no)
INNER JOIN Titles as ti
ON (ep.emp_no = ti.emp_no)
WHERE (to_date = '9999-01-01') AND (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no;




