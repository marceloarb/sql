Use a SQL Interface, and connect to the following AWS RDS instance :

database-2.cneslkijzdx1.us-east-1.rds.amazonaws.com

The credentials are:

username : admin
password : Marcelobarbosa

Copy and past these queries and run to retrieve all the data:

SELECT * FROM `marcelo-barbosa`.hobbies;
SELECT * FROM `marcelo-barbosa`.`ta-emelios`;
SELECT * FROM `marcelo-barbosa`.tekcampers;
SELECT * FROM `marcelo-barbosa`.tekcampers_hobbies;

This query we are using the agregate table (many-to-many) to retrieve the student and their hobbies.

SELECT a.first_name,c.hobby_name FROM tekcampers as a 
INNER JOIN tekcampers_hobbies as b ON a.id = b.tekcamper_id
INNER JOIN hobbies AS c ON b.hobby_id = c.idhobbies;