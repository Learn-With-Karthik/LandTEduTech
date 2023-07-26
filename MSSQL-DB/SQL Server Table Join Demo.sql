--- SQL Server Table Join Demo ----

CREATE DATABASE training
GO

USE training
GO
CREATE TABLE trainee (      
  id int PRIMARY KEY IDENTITY,     
  admission_no varchar(45) NOT NULL,  
  first_name varchar(45) NOT NULL,      
  last_name varchar(45) NOT NULL,  
  age int,  
  city varchar(25) NOT NULL      
);    
GO
CREATE TABLE fee ( 
  admission_no varchar(45) NOT NULL,  
  sem_no int NOT NULL,
  course varchar(45) NOT NULL,      
  amount int,    
); 
GO
CREATE TABLE semester ( 
  sem_no int NOT NULL,
  sem_name varchar(10), 
); 
Go
INSERT INTO trainee (admission_no, first_name, last_name, age,city)       
VALUES (3354,'Spider', 'Man', 13, 'Texas'),       
(2135, 'James', 'Bond', 15, 'Alaska'),       
(4321, 'Jack', 'Sparrow', 14, 'California'),    
(4213,'John', 'McClane', 17, 'New York'),       
(5112, 'Optimus', 'Prime', 16, 'Florida'),  
(6113, 'Captain', 'Kirk', 15, 'Arizona'),    
(7555,'Harry', 'Potter', 14, 'New York'),       
(8345, 'Rose', 'Dawson', 13, 'California'); 
GO
INSERT INTO semester (sem_no, sem_name)       
VALUES 
(1,'First Sem'),       
(2, 'Second Sem'),       
(3, 'Third Sem'),       
(4, 'Fourth Sem');
GO
INSERT INTO fee (admission_no, sem_no, course, amount)       
VALUES (3354, 1, 'Java', 20000),       
(7555, 1, 'Android', 22000),       
(4321, 2, 'Python', 18000),    
(8345, 2, 'SQL', 15000), 
(9345, 2, 'Blockchain', 16000),
(9321, 3, 'Ethical Hacking', 17000),          
(5112, 1, 'Machine Learning', 30000);
GO
--INNER JOIN
SELECT trainee.admission_no, trainee.first_name, trainee.last_name, fee.course, fee.amount  
FROM trainee  
INNER JOIN fee ON trainee.admission_no = fee.admission_no; 
GO
--INNER JOIN with 3 Tables
SELECT trainee.admission_no, trainee.first_name, trainee.last_name, fee.course, fee.amount, semester.sem_name 
FROM trainee  
INNER JOIN fee ON trainee.admission_no = fee.admission_no
INNER JOIN semester ON semester.sem_no = fee.sem_no  
GO
--LEFT OUTER JOIN
SELECT trainee.admission_no, trainee.first_name, trainee.last_name, fee.course, fee.amount  
FROM trainee  
LEFT OUTER JOIN fee ON trainee.admission_no = fee.admission_no; 
GO
-- RIGHT OUTER JOIN
SELECT trainee.admission_no, trainee.first_name, trainee.last_name, fee.course, fee.amount  
FROM trainee  
RIGHT OUTER JOIN fee ON trainee.admission_no = fee.admission_no;
GO
--FULL OUTER JOIN
SELECT trainee.admission_no, trainee.first_name, trainee.last_name, fee.course, fee.amount  
FROM trainee  
FULL OUTER JOIN fee ON trainee.admission_no = fee.admission_no;
GO
--Self Join
SELECT t1.first_name, t1.last_name, t2.city
FROM trainee t1 , trainee t2  
WHERE t1.admission_no = t2.admission_no
AND t1.city = t2.city  
ORDER BY t2.city;
Go
--Self Join 2
SELECT t1.first_name, t1.last_name, t2.city
FROM trainee t1 , trainee t2  
WHERE t1.admission_no != t2.admission_no
AND t1.city = t2.city  
ORDER BY t2.city;
GO
--CROSS JOIN
SELECT * from trainee 
CROSS join fee
GO
--CROSS JOIN (function like inner join)
SELECT trainee.admission_no, trainee.first_name, trainee.last_name, fee.course, fee.amount  
FROM trainee  
CROSS JOIN fee  
WHERE trainee.admission_no = fee.admission_no; 

