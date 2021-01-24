CREATE DATABASE social_network CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci;

USE social_network;
CREATE TABLE user  (
	id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    email VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(30) NOT NULL,
    age INT,
    city VARCHAR(30)
);

DROP TABLE IF EXISTS user

CREATE TABLE `social_network`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(30) NULL,
  `last_name` VARCHAR(30) NULL,
  `email` VARCHAR(50) NOT NULL,
  `password` VARCHAR(30) NOT NULL,
  `age` INT NULL,
  `city` VARCHAR(30) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE);

ALTER TABLE user
ADD COLUMN username VARCHAR(30) NOT NULL UNIQUE;