-- Deliverable 1 The Number of Retiring Employees by Title
-------------------------------------------------------------------------------------
-- The Number of retiring employees
-- Join employee as e and title as ti tables to create new table "retirement_titles"

SELECT  e.emp_no,
		e.first_name,
		e.last_name,
		ti.title,
		ti.from_date,
		ti.to_date
INTO retirement_titles		
FROM employees as e
INNER JOIN titles as ti
ON(e.emp_no = ti.emp_no)
WHERE(e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- Find The Number of Retiring Employees by Title
SELECT DISTINCT ON (rt.emp_no) 
	rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY rt.emp_no, rt.to_date DESC;

-- Find the number of employees retiring by Title
-- Use Distinct with Order By to remove duplicate rows

SELECT DISTINCT ON (rt.emp_no)
		rt.emp_no,
		rt.first_name,
		rt.last_name,
		rt.title
INTO unique_Rtitles
FROM retirement_titles as rt
WHERE rt.to_date='9999-01-01'
ORDER BY rt.emp_no,rt.to_date DESC;

SELECT * FROM unique_Rtitles

-- Find the number of employees by their most recent job title who are about to retire
SELECT COUNT(ut.title),ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY COUNT DESC;

-- Unique retiring titles(72458)
SELECT ut.emp_no,
		ut.first_name,
		ut.last_name,
		ut.title
INTO unique_retiring_titles
FROM unique_Rtitles as ut
-- GROUP BY ut.emp_no, ut.title
ORDER BY ut.emp_no,ut.title desc ;

--Deliverable #2
-- The Employees Eligible for the Mentorship Program 
SELECT DISTINCT ON(e.emp_no)
			e.emp_no,
			e.first_name,
			e.last_name,
			e.birth_date,
			de.from_date,
			de.to_date,
			ti.title
INTO mentorship_eligibilty
FROM employees as e
INNER JOIN dept_emp as de
ON(e.emp_no=de.emp_no)
INNER JOIN titles as ti
ON(e.emp_no=ti.emp_no)
WHERE(e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND(de.to_date='9999-01-01')
ORDER BY e.emp_no,ti.from_date DESC;

--Deliverable 3: How many roles will need to be filled as the "silver tsunami" begins to make an impact?

--Roles per Staff and Departament (90398 titles)

SELECT DISTINCT ON (rt.emp_no) 
	rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title,
	d.dept_name
INTO unique_titles_department
FROM retirement_titles as rt
INNER JOIN dept_emp as de
ON (rt.emp_no = de.emp_no)
INNER JOIN departments as d
ON (d.dept_no = de.dept_no)
ORDER BY rt.emp_no, rt.to_date DESC;

-- How many roles will need to be fill per title and department?

SELECT ut.dept_name, ut.title, COUNT(ut.title) 
INTO roles_to_fill_T_D
FROM (SELECT title, dept_name from unique_titles_department) as ut
GROUP BY ut.dept_name, ut.title
ORDER BY ut.dept_name DESC;

-- Is there qualified staff to mentor next round?

SELECT ut.dept_name,ut.title,Count(ut.title)
INTO qualified_staff
FROM (SELECT dept_name,title FROM unique_titles_department) as ut
WHERE ut.title IN('Senior Staff','Senior Engineer','Technique Leader','Manager')
GROUP BY ut.dept_name,ut.title
ORDER BY ut.dept_name DESC;
