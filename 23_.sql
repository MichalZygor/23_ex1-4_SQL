CREATE TABLE zakupy_kurs (
	id bigint primary key auto_increment,
    nazwa varchar(50) NOT NULL,
    producent varchar(50),
    opis varchar(200),
    cena decimal(10, 2)
);

INSERT INTO zakupy_kurs(nazwa, producent, opis, cena) 
VALUES ('Masło', 'Mlekovia', 'Masełko do smarowania', 5.99), 
('Margaryna', 'PPHU Januszex', 'Przetworzone tłuszcze roślinne', 3.99),
('Chleb', 'Piekarzex', 'Chlebek poranny', 2.00),
('Masło', 'Mlekovia', 'Masełko do smarowania', 5.99),
('Radler', 'Warka', 'Piwko z rana jak śmietana', 3.50);

-- porzadek :)
DELETE FROM zakupy_kurs WHERE id = 4;


SELECT * FROM zakupy_kurs;

-- ZADANIA:
-- Policz średnią cenę zakupu
SELECT AVG(cena) FROM zakupy_kurs;

-- Policz sumę cen wszystkich zakupów
SELECT SUM(cena) FROM zakupy_kurs;

-- Przygotuj zapytanie które zaokrągli cenę produktów do części całkowitej
SELECT *,  ROUND(cena,1) FROM zakupy_kurs;
SELECT id, nazwa, producent, opis, ROUND(cena) FROM zakupy;

-- Wyświetl tylko najdroższy i najtańszy zakup
SELECT * FROM zakupy_kurs 
WHERE cena = (SELECT MAX(CENA) from zakupy_kurs) OR cena = (SELECT MIN(cena) from zakupy_kurs);

SELECT * FROM zakupy 
WHERE cena = (SELECT MAX(cena) from zakupy)
OR cena = (SELECT MIN(cena) from zakupy) 
;

-- Wyszukaj zakupy kosztujące więcej niż średnia
SELECT * FROM zakupy_kurs
WHERE cena > (SELECT AVG(cena) FROM zakupy_kurs);

-- Przygotuj zapytanie które zwróci tabelę z dodatkową kolumną informującą 
-- czy dany produkt jest droższy od średniej ceny wszystkich produktów

SELECT *, cena > (SELECT AVG(cena) FROM zakupy_kurs) AS 'Czy droższy od średniej'
FROM zakupy_kurs;