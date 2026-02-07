USE intern_training_db;

#Create table using CHECK, DEFAULT, UNIQUE constraints,DEFAULT values for timestamps

create table users(
user_id int primary key AUTO_INCREMENT,
user_name varchar(50)unique,
age int CHECK (age >= 18 AND age <= 60),
email varchar(100) unique,
salary decimal(10,2)check(salary>0),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

#Test constraint violations intentionally

insert into users(user_name,age,email,salary)values('john',17,'j@gmail.com',-5000);

#Combine multiple constraints on a single column.

ALTER TABLE users
MODIFY age INT NOT NULL CHECK (age >= 18 AND age <= 60);

#constraint enforcement order.

/*1.NOT NULL
2. CHECK
3.UNIQUE
4.PRIMARY KEY
5.FOREIGN KEY*/

#Database-level vs Application-level validation

/*Database Validation | Application Validation 
------------------------------------------------ 
| Always enforced     | Can be bypassed        |
| More secure         | Less secure            |
| Central control     | Code-dependent         |
*/

desc users;