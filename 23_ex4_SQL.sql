-- 23_ex4 SQL #4 - Zapytania do przykładowej bazy danych


-- 1. Pobierz zatrudnionych w roku 1990 i później
-- 2. Ile kobiet pracowało do tej pory w firmie?
-- 3. Pobierz imię, nazwisko oraz nazwę działu pracownika
-- 4. Wyświetl imię, nazwisko i datę urodzenia najmłodszej kobiety
-- 5. Wyświetl pracownika o numerze 10009 z wszystkimi dotychczasowymi stanowiskami pracy
-- 6. Wyświetl pracowników z aktualnymi stanowiskami pracy
-- 7. Wyświetl najlepiej zarabiającego pracownika
-- 8. Wyświetl najlepiej i najgorzej zarabiających pracowników
-- 9. Wyświetl imię i nazwisko pracownika oraz imię i nazwisko managera jego działu
-- 10. Wyświetl wszystkie stanowiska w firmie. Usuń powtórzenia.

-- ########################################################################################

SELECT * FROM employees LIMIT 10;

-- 1. Pobierz zatrudnionych w roku 1990 i później
SELECT *
	FROM employees
    WHERE extract(YEAR FROM hire_date) >= 1990;
    
-- 2. Ile kobiet pracowało do tej pory w firmie?
SELECT count(*)
	FROM employees
    WHERE gender = 'F';
    
-- 3. Pobierz imię, nazwisko oraz nazwę działu pracownika
-- SELECT first_name, last_name 
	SELECT * 
	FROM employees
    JOIN dept_emp ON employees.emp_no = dept_emp.emp_no;

-- z aliasami
	SELECT * 
	FROM employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no;
    
SELECT first_name, last_name, dept_name
	FROM employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    JOIN departments d ON d.dept_no = de.dept_no
    ;   
    
-- 4. Wyświetl imię, nazwisko i datę urodzenia najmłodszej kobiety
SELECT MAX(birth_date)
	FROM employees
    WHERE gender = 'F'
    ; 

SELECT first_name, last_name, birth_date
	FROM employees
    WHERE birth_date = (
		SELECT MAX(birth_date)
		FROM employees
		WHERE gender = 'F'
    ) AND gender = 'F'
    ;

-- 5. Wyświetl pracownika o numerze 10009 z wszystkimi dotychczasowymi stanowiskami pracy
SELECT first_name, last_name, title, from_date, to_date
	FROM titles t
    JOIN employees e ON e.emp_no = t.emp_no
    WHERE t.emp_no = (
		SELECT MAX(from_date)
			FROM titles
    )
    ;

-- 6. Wyświetl pracowników z aktualnymi stanowiskami pracy
SELECT first_name, last_name, title, from_date, to_date
	FROM titles t
    JOIN employees e ON e.emp_no = t.emp_no
    WHERE 1=1
    AND t.to_date = '9999-01-01'
    ;
    
-- 7. Wyświetl najlepiej zarabiającego pracownika; 43624	158220	2002-03-22	9999-01-01
SELECT * 
	FROM salaries
    ORDER BY salary DESC
    LIMIT 1;

SELECT first_name, last_name, salary
	FROM salaries s
    JOIN employees e ON e.emp_no = s.emp_no
	WHERE 1=1
    AND salary = (
		SELECT MAX(salary) 
		FROM salaries
    );



-- 8. Wyświetl najlepiej i najgorzej zarabiających pracowników
SELECT MAX(salary), MIN(salary)
	FROM salaries
    WHERE to_date = '9999-01-01'; 						-- 158220	38623



SELECT first_name, last_name, salary
	FROM salaries s
    JOIN employees e ON e.emp_no = s.emp_no
	WHERE 1=1
    AND salary IN (158220, 38623);
-- Tokuyasu	Pesch	158220
-- Olivera	Baek	38623

SELECT first_name, last_name, salary
	FROM salaries s
    JOIN employees e ON e.emp_no = s.emp_no
	WHERE 1=1
    AND salary = (
		SELECT MAX(salary)
        FROM salaries
        )
	OR salary = (
		SELECT MIN(salary)
        FROM salaries
        );

-- 9. Wyświetl imię i nazwisko pracownika oraz imię i nazwisko managera jego działu
SELECT e.emp_no , e.first_name AS 'emp_first_name' , e.last_name AS 'emp_last_name', 
de.dept_no, dm.emp_no AS 'manager_no',
employee_as_manager.first_name AS 'manager_first_name', employee_as_manager.last_name AS 'manager_last_name'
FROM employees e
JOIN dept_emp de ON de.emp_no = e.emp_no
JOIN dept_manager dm ON dm.dept_no = de.dept_no 
JOIN employees employee_as_manager ON employee_as_manager.emp_no = dm.emp_no
;

-- 10. Wyświetl wszystkie stanowiska w firmie. Usuń powtórzenia.
SELECT DISTINCT title 
	FROM titles;
