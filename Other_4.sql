SELECT * FROM employees WHERE gender = 'M';

SELECT * FROM 
	employees 
WHERE 
	gender = 'M' AND hire_date >= '1990-01-01'
ORDER BY
	hire_date
LIMIT
	10
;


SELECT * FROM titles WHERE title = 'Engineer';

SELECT * FROM employees 
	WHERE emp_no IN (
		SELECT emp_no FROM titles WHERE title = 'Engineer'
	)
;

SELECT
	* 
FROM
	employees, titles 
WHERE
	employees.emp_no = titles.emp_no 
    AND 
    title = 'Engineer'
;