DROP TABLE if exists retirement_titles;

SELECT e.emp_no,
	    e.first_name,
        e.last_name,
        ti.title,
        ti.from_date,
        ti.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti
ON e.emp_no = ti.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

SELECT * FROM retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title

INTO unique_titles
FROM retirement_titles as rt
ORDER BY emp_no,to_date DESC;

SELECT * FROM unique_titles;

-- group the count of retiring employees by title
SELECT COUNT(title) count, title
INTO retiring_titles
FROM unique_titles
GROUP BY (title) 
ORDER BY count DESC
;

SELECT * FROM retiring_titles;

SELECT DISTINCT ON (EMP_NO)
       e.emp_no,
       e.first_name,
	   e.last_name,
	   e.birth_date,
	   de.from_date,
	   de.to_date,
	   ti.title
INTO mentorship_eligilbilty
FROM employees as e
INNER JOIN dept_emp as de
ON de.emp_no = e.emp_no
INNER JOIN titles as ti
ON e.emp_no = ti.emp_no
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31') AND de.to_date = '9999-01-01'
ORDER BY emp_no, ti.from_date DESC;

SELECT * FROM mentorship_eligilbilty; 

-- ADDITIONAL QUERIES

-- get the number of eligible mentors grouped by title
SELECT COUNT(title) count, title
INTO mentor_count_title
FROM mentorship_eligilbilty
GROUP BY (title) 
ORDER BY count DESC

SELECT * FROM mentor_count_title;



	   