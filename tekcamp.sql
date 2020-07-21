Connected instance with MySQL Workbench.

Create Database USE `tc1-Marcelo-Barbosa-`;

CREATE TABLE IF NOT EXISTS tekcampers LIKE students.tekcamp01;

INSERT tekcampers SELECT * FROM students.tekcamp01;

SELECT * FROM tekcampers;