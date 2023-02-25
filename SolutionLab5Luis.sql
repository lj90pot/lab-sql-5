/*Luis*/
use sakila;
#Q1 Drop column picture from staff.
alter table staff drop column picture;

#Q2 A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. 
##Update the database accordingly.

#First I check the info
select * from customer where first_name='TAMMY';
select * from staff;
#Now I update the table 
insert into staff values (3,'TAMMY','SANDERS',79,'TAMMY.SANDERS@sakilacustomer.org',2,1,'TAM','ppppprrrr786',now());

###############
#Q3
#Check info
select * from rental;
select * from film where title like '%academy%';
#Academy dinosaur film_id=1
select * from inventory where film_id=1;
#We have 8 movies. 4 for the store 1

select customer_id from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER'; # customer_id=130
#check if all films have a return_date all. Todas tienen return date con lo cual estan disponibles
select * from rental where isnull(return_date) and inventory_id in (1,2,3,4);
#Staff
Select * from staff where store_id=1;#Staff_id=1

select max(rental_id) from rental; # next rental_id
insert into rental values (16050,now(),'1','130',null,'1',now());
select * from rental where rental_id=16050;

#################
#Q4
#Check inactive users
select * from customer where active <>1; 
#Create table
create table deleted_user (
deleted_id INT PRIMARY KEY,
customer_id varchar(16),
email VARCHAR(255),
date_deleted datetime
);
#Insert non active users
Insert into deleted_user values
(1,'16','SANDRA.MARTIN@sakilacustomer.org',now()),
(2,'64','JUDITH.COX@sakilacustomer.org',now()),
(3,'124','SHEILA.WELLS@sakilacustomer.org',now()),
(4,'169','ERICA.MATTHEWS@sakilacustomer.org',now()),
(5,'241','HEIDI.LARSON@sakilacustomer.org',now()),
(6,'271','PENNY.NEAL@sakilacustomer.org',now()),
(7,'315','KENNETH.GOODEN@sakilacustomer.org',now()),
(8,'368','HARRY.ARCE@sakilacustomer.org',now()),
(9,'406','NATHAN.RUNYON@sakilacustomer.org',now()),
(10,'446','THEODORE.CULP@sakilacustomer.org',now()),
(11,'482','MAURICE.CRAWLEY@sakilacustomer.org',now()),
(12,'510','BEN.EASTER@sakilacustomer.org',now()),
(13,'534','CHRISTIAN.JUNG@sakilacustomer.org',now()),
(14,'558','JIMMIE.EGGLESTON@sakilacustomer.org',now()),
(15,'592','TERRANCE.ROUSH@sakilacustomer.org',now())
;
select * from deleted_user;

#Delete the customers from customer table
#Is not possible to delete the rows due to the uniques keys. if we delete them the normalization of this database could be compromised
delete from customer 
where customer_id 
in ('16','64','124','169','241','271','315','368','406','446','482','510','534','558','592'); 
