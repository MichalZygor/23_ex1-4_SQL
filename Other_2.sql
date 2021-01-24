CREATE DATABASE course_platform COLLATE utf8mb4_polish_ci;

USE course_platform;

CREATE TABLE user (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(30) UNIQUE NOT NULL,
    email VARCHAR(40) UNIQUE NOT NULL,
    password VARCHAR(40) NOT NULL
);

CREATE TABLE course (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) UNIQUE NOT NULL,
    description VARCHAR(2000)
);

INSERT INTO user 
	(username, email, password)
VALUES
	('jankowal', 'jan@kowalski.com', 'jan1234'),
    ('martita', 'martita@mymail.com', 'marta2001210'),
    ('peter99', 'don.petro@supermail.com', 'puszek');

INSERT INTO course
	(name, description)
VALUES
	('Kurs Java', 'Kurs programowania przeznaczony dla początkujących i nieco bardziej zaawansowanych.'),
    ('Kurs Python', 'Naucz się języka Python i wykorzystaj go do programowania sztucznej inteligencji i zaawansowanych obliczeń.'),
    ('Kurs JavaScript', 'Poznaj język JavaScript i naucz się tworzyć piękne, dynamiczne strony internetowe, które podbiją świat.');
    
CREATE TABLE user_course (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    course_id INT NOT NULL,
    signup_date DATE NOT NULL,
    expiration_date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user (id),
    FOREIGN KEY (course_id) REFERENCES course (id)
);    
    
INSERT INTO user_course
    (user_id, course_id, signup_date, expiration_date)
VALUES
    (2, 2, '2018-10-10', '2019-10-10'),
    (2, 3, '2019-10-10', '2020-10-10'),
    (3, 1, '2019-11-06', '2020-11-06');    
    
DELETE FROM user WHERE id = 2;    
    
CREATE TABLE course_category (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
    description VARCHAR(200)
);    
    
INSERT INTO course_category
    (name, description)
VALUES
    ('Frontend', 'Kursy związane z wizualną częścią aplikacji'),
    ('Backend', 'Kursy związane z serwerową częścią aplikacji');    
    
    
ALTER TABLE course
ADD category_id INT,
ADD FOREIGN KEY (category_id) REFERENCES course_category (id);    


UPDATE course SET category_id = 1 WHERE id = 3;
UPDATE course SET category_id = 2 WHERE id IN (1, 2);

CREATE TABLE user_details (
	id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT UNIQUE NOT NULL,
    telephone VARCHAR(11),
    city VARCHAR(30),
    FOREIGN KEY (user_id) REFERENCES user(id)
);









