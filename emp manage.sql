CREATE DATABASE Employee_Management01;
USE  Employee_Management01;
CREATE TABLE department (id INT AUTO_INCREMENT PRIMARY KEY, dep_name VARCHAR(50) NOT NULL);
select * from department;
INSERT INTO department (dep_name)VALUES('HR'),('IT'),('Accountant'),('DVELOPER'),('MANAGEMENT');
select * from department;

CREATE TABLE employees (emp_id INT AUTO_INCREMENT PRIMARY KEY, emp_name VARCHAR(200) NOT NULL,age INT(100) NOT NULL,
gender VARCHAR(200) NOT NULL,salary INT NOT NULL,CHECK (salary>30000),dep_id INT(50) ,FOREIGN KEY (dep_id) REFERENCES department (id));
select * from employees;
INSERT INTO employees(emp_name,age,gender,salary,dep_id) VALUES('swetha',25,'female',55000,3),('bhuvana',20,'Female',68000,5),('Arun',35,'Male',59000,2),('naveen',40,'Male',74000,4),('Pavi',23,'Female',76000,3);
select * from employees;

CREATE TABLE projects(id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(50) NOT NULL,Budget INT NOT NULL,CHECK (Budget>10000));
select * from projects;
INSERT INTO projects(name,budget) VALUES
('App Develop',55000),
('Web Develop',44000),
('Data Analysis',45600),
('Network',30000),
('Game Develop',90000);
select * from projects;

CREATE TABLE Emp_Project (emp_id INT, project_id INT, FOREIGN KEY (emp_id) REFERENCES employees(emp_id),
FOREIGN KEY (project_id) REFERENCES projects(id) ,PRIMARY KEY ( emp_id, project_id ));
select * from Emp_project;
INSERT INTO  Emp_Project(emp_id,project_id)VALUES(1,4),(3,1),(2,3),(4,5),(5,4);
select * from Emp_project;


 CREATE TABLE Attendance (id INT AUTO_INCREMENT PRIMARY KEY,emp_id INT ,FOREIGN KEY (emp_id) REFERENCES employees(emp_id),
 Date DATE NOT NULL,Status ENUM ('Present', 'Absent', 'On Leave'))auto_increment=1;

insert into Attendance (emp_id,date,status)values
(1,'2024-11-04','present'),
(2,'2024-11-05','absent'),
(3,'2024-11-06','present'),
(4,'2024-11-07','on leave'),
(5,'2024-11-08','on leave'),
(5,'2024-11-09','absent');

select * from Attendance;
select * from employees;

SELECT Employees.emp_name,department.dep_name FROM Employees JOIN department ON Employees.dep_id = department.id WHERE dep_name = 'IT';


SELECT name AS Pro_Name,budget FROM Projects WHERE(budget > 50000);

SELECT Employees.emp_name,projects.name FROM Employees JOIN projects ON Employees.emp_id = projects.id; 



SELECT COUNT( Employees.emp_id),department.dep_name FROM Employees JOIN department ON department.id = Employees.emp_id GROUP BY department.id
                                                                   

SELECT Employees.emp_name,Employees.salary FROM Employees WHERE salary>50000;


select Attendance.date,Attendance.status   from Attendance where Attendance.emp_id=3;


UPDATE Employees JOIN department ON Employees.dep_id=department.id SET Employees.salary= Employees.salary *1.10 WHERE department.dep_name='hr';


SELECT Employees.emp_name,Employees.salary FROM Employees JOIN department ON Employees.dep_id = department.id WHERE department.dep_name='HR';	
select Employees.emp_name where department.dep_name='hr';


UPDATE Employees SET dep_id = (SELECT id FROM department WHERE dep_name = 'TESTING' LIMIT 1) WHERE dep_id = 2 ;

SELECT Employees.emp_name, department.dep_name FROM Employees JOIN department ON Employees.dep_id = department.id WHERE department.dep_name = 'TESTING';

delete from projects where budget='90000';


ALTER TABLE Employees ADD COLUMN email varchar(50) UNIQUE; 

SELECT * FROM  Employees ;


ALTER TABLE Employees ADD CHECK (Age>18);

SELECT * FROM  Employees ;


ALTER TABLE Employees MODIFY gender VARCHAR(20) DEFAULT 'Unknown' ;
select * from Employees;


