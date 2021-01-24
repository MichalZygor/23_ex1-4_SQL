-- 23_ex3 SQL #3 - Operacje na datach

-- 1. Do tabeli zakupy dodaj kolumnę data_zakupu z datą i czasem zakupu.
-- 2. Uzupełnij dane w tabeli różnymi datami
-- 3. Wyszukaj zakupy zrobione w ciągu pierwszych 15 dni miesiąca
-- 4. Wyszukaj zakupy zrobione w ciągu ostatnich 30 dni od aktualnej daty
-- 5. Wyszukaj zakupy zrobione po godzinie 20:00
-- 6. Wyświetl wszystkie zakupy posortowane w kolejności od zrobionych ostatnio do najstarszych
-- -----------------------------------------------------------------------------------------------

-- 1. Do tabeli zakupy dodaj kolumnę data_zakupu z datą i czasem zakupu.
ALTER TABLE `zakupy_kurs` 
ADD COLUMN `data` DATETIME AFTER `cena`;

-- 2. Uzupełnij dane w tabeli różnymi datami
UPDATE zakupy_kurs SET data = '2021-01-10 10:00' WHERE id = 1;
UPDATE zakupy_kurs SET data = '2020-11-15 13:10' WHERE id = 2;
UPDATE zakupy_kurs SET data = '2020-10-30 11:00' WHERE id = 3;
UPDATE zakupy_kurs SET data = '2021-01-05 20:01' WHERE id = 5;

-- 3. Wyszukaj zakupy zrobione w ciągu pierwszych 15 dni miesiąca
SELECT * FROM zakupy_kurs 
	WHERE EXTRACT(DAY FROM data) <= 15;
    
-- 4. Wyszukaj zakupy zrobione w ciągu ostatnich 30 dni od aktualnej daty
SELECT * FROM zakupy_kurs
	WHERE ABS(DATEDIFF(CURDATE(), data)) <=30;
    
    
-- 5. Wyszukaj zakupy zrobione po godzinie 20:00
SELECT * FROM zakupy_kurs
	WHERE EXTRACT(HOUR FROM data) >= 20 and EXTRACT(MINUTE FROM data) > 0;
    
-- 6. Wyświetl wszystkie zakupy posortowane w kolejności od zrobionych ostatnio do najstarszych
SELECT *
	FROM zakupy_kurs
    ORDER BY data DESC;
    