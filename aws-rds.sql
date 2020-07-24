-- The reason I am creating my db in AWS-RDS it's because Amir gave a demo session about
-- it and AWS is very important to learn. 
-- The steps I took was:
-- Loggin to my aws account.
-- Select RDS -> create database -> mysql -> free tier.
-- Create a user = admin and password = Marcelobarbosa;
-- The rest was a default and my database was created after submit.
-- Go to dashboard -> databases -> select the database you want.
-- Here is my instance: database-2.cneslkijzdx1.us-east-1.rds.amazonaws.com

-- I had problems to connect with my instance, It was a security default problem that did not allow
-- all IP. I changed CIRD/IP to allow all the IPs.


CREATE SCHEMA `marcelo-barbosa` ;

CREATE TABLE `marcelo-barbosa`.`tekcampers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50) NULL,
  `last_name` VARCHAR(50) NULL,
  `gender` VARCHAR(5) NULL,
  `education` VARCHAR(25) NULL,
  `bootcamp` VARCHAR(50) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC));


-- I have exported all the data from previus db and imported to my new one, so no queries in this aspect 
