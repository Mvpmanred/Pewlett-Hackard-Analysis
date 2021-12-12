SELECT e.emp_no,
	   e.first_name,
	   e.last_name,
	   t.title,
	   t.from_date,
	   t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no=t.emp_no)
where(e.birth_date between '1952-01-01' and '1955-12-31')
ORDER BY e.emp_no

SELECT * FROM retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, title DESC;

SELECT * FROM unique_titles;

SELECT COUNT(nt.title),nt.title
INTO retiring_titles
FROM unique_titles as nt
GROUP BY title
ORDER BY COUNT(title) DESC;


SELECT * FROM retiring_titles;

--Deliverable 2: The Employees Eligible for the Mentorship Program
SELECT DISTINCT ON (e.emp_no) 
e.emp_no, 
e.first_name, 
e.last_name,
e.birth_date,
de.from_date, 
de.to_date,
	t.title
INTO mentorship_eligibility
FROM employees as e
RIGHT JOIN dept_emp as de
ON (e.emp_no= de.emp_no)
INNER JOIN titles as t
ON (e.emp_no= t.emp_no)
where(e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;

SELECT * FROM mentorship_eligibility;