CREATE DATABASE sql_exercise CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci;

USE sql_exercise;

CREATE TABLE zakupy (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nazwa VARCHAR(50),
    producent VARCHAR(50),
    opis VARCHAR(200),
    cena DECIMAL(10,2)
);

INSERT INTO zakupy
    (nazwa, producent, opis, cena)
VALUES
    ('Czajnik', 'Philips', 'Czajnik o mocy znamionowej 2200W.', 55.55),
    ('Deska do krojenia', 'Eldom', 'Wykonanan z plastiku, szarzona', 10.10),
    ('Jabłka', 'Polska', 'Świeże owoce i warzywa do 24h po zbiorach', 3.48),
    ('Deska do krojenia', 'EZ', 'Wykonanan z plastiku, czerwona', 18.50),
    ('Czajnik', 'Philips', 'Czajnik o mocy znamionowej 2200W.', 55.55);

SELECT * FROM zakupy;

SELECT *
FROM 
	zakupy
WHERE
	cena >= 30;
    
UPDATE 
	zakupy
SET
	producent = 'Eldom'
WHERE
	id = 4;

SELECT
	*
FROM
	zakupy
WHERE
	producent = 'Eldom' AND (cena > 10 AND cena < 20);


UPDATE
	zakupy
SET
	opis = CONCAT(opis, ' dodatkowy opis'),
    cena = cena + 2
WHERE
	id = 3;

DELETE
FROM
	zakupy
WHERE
	id = 5;
    
SELECT * FROM zakupy;

-- przykłądy

CREATE TABLE user  (
	id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    email VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(30) NOT NULL,
    age INT,
    city VARCHAR(30)
);