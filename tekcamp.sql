Connected instance with MySQL Workbench.

Create Database USE `tc1-Marcelo-Barbosa-`;

CREATE TABLE IF NOT EXISTS tekcampers LIKE students.tekcamp01;

INSERT tekcampers SELECT * FROM students.tekcamp01;

SELECT * FROM tekcampers;

INSERT INTO `tc1-Marcelo-Barbosa-`.tekcampers(first_name,last_name,gender,education) 
VALUES ('John', 'Bozarov', 'M','Bachelors degree'),
('Gotham', 'Katta', 'M','Bachelors degree'),
('Monica', 'Howard', 'F',null),
('Kevin','Keesee','M','High School Diploma'),
('Tyler','Clements','M','Bachelors Degree');

SELECT * FROM tekcampers;
DELETE FROM tekcampers WHERE id = 20;
DELETE FROM tekcampers WHERE id = 26;
SELECT * FROM tekcampers;
UPDATE tekcampers SET gender = education WHERE id <= 27;
SELECT * FROM tekcampers;
UPDATE tekcampers SET gender = 'M' WHERE id IN (2,15,22,24);
SELECT * FROM tekcampers;
UPDATE tekcampers SET gender = 'F' WHERE id = 4;
UPDATE tekcampers SET education = 'Bachelors Degree' WHERE id IN (1,4,6,5,11,18,16,29,32);
SELECT * FROM tekcampers;
UPDATE tekcampers SET education = 'Some College' WHERE id IN (7,12,8,9,15,24,19);
UPDATE tekcampers SET education = 'Masters Degree' WHERE id IN (3,21);

UPDATE tekcampers SET education = 'High School Diploma' WHERE id IN (14,25,31);

INSERT INTO `tc1-Marcelo-Barbosa-`.tekcampers(first_name,last_name,gender,education) 
VALUES ('Vimala','Murthy','F','Bachelors Degree'),
('Arron','White','M',null),
('Cody', 'Clark', 'M','Some College'),
('Justin', 'Cheng', 'M','Some College'),
('John','Kol','M',null);

SELECT last_name AS length from tekcampers 
WHERE CHAR_LENGTH(last_name)<=7;


SELECT first_name from tekcampers
order by first_name;

SELECT last_name from tekcampers
order by last_name;

SELECT * from tekcampers
WHERE gender = 'M';

SELECT * from tekcampers
WHERE gender = 'F';

SELECT * from tekcampers
WHERE education = 'Masters Degree';

SELECT * from tekcampers
WHERE education = 'Bachelors Degree';

SELECT * from tekcampers
WHERE education = 'Associate Degree';

SELECT * from tekcampers
WHERE education NOT IN ('Masters Degree','Bachelors Degree','Associate Degree');

CREATE TABLE IF NOT EXISTS `ta-Emilios` SELECT * FROM tekcampers WHERE id IN(1,2,6,7,12,16,17,22,24,30);


REATE TABLE `tc1-Marcelo-Barbosa-`.`hobbies` (
  `idhobbies` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`idhobbies`),
  UNIQUE INDEX `idhobbies_UNIQUE` (`idhobbies` ASC));

INSERT INTO hobbies (name) 
VALUES ('Jiu Jitsu'),
('Running'),
('Reading'),
('Working out');
-- I was trying to do the requirements using many-to-many relationship
CREATE TABLE tekcampers_hobbies(id INT AUTO_INCREMENT PRIMARY KEY, tekcamper_id INT, hobby_id INT, FOREIGN KEY(tekcamper_id) REFERENCES tekcampers(id), FOREIGN KEY(hobby_id) REFERENCES hobbies(idhobbies));

SELECT * FROM tekcampers_hobbies; 

INSERT INTO tekcampers_hobbies(tekcamper_id,hobby_id)
VALUES(1,1)
,(2, 1)
,(2, 4)
,(3, 2);

INSERT INTO tekcampers_hobbies(tekcamper_id,hobby_id)
VALUES(7,1)
,(2, 2)
,(1, 3)
,(6, 2)
,(12,3)
,(16,1)
,(17,2)
,(22,3)
,(24,4),
(30,2);

ALTER TABLE hobbies ADD (tekcampers_id INT);
INSERT INTO hobbies(name,tekcampers_id)
VALUES('Reading',1),
('Running',2),
('Working out',6),
('Jiu Jitsu',7),
('Running',2),
('Reading',16),
('Working out',17),
('Reading',22),
('Riding bike',24),
('Working out',30);

SELECT first_name,name FROM tekcampers INNER JOIN hobbies ON hobbies.tekcampers_id = tekcampers.id;

ALTER TABLE tekcampers ADD (bootcamp VARCHAR(25));

ALTER TABLE `ta-Emilios` ADD (bootcamp VARCHAR(25));

-- Many to Many relationship query working fine.

SELECT a.first_name,c.name FROM tekcampers as a 
INNER JOIN tekcampers_hobbies as b ON a.id = b.tekcamper_id
INNER JOIN hobbies AS c ON b.hobby_id = c.idhobbies;

ALTER TABLE hobbies CHANGE idhobbies hobby_name varchar(25);


SELECT a.first_name,c.hobby_name FROM tekcampers as a 
INNER JOIN tekcampers_hobbies as b ON a.id = b.tekcamper_id
INNER JOIN hobbies AS c ON b.hobby_id = c.idhobbies;
