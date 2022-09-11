
create database employeedetails;
show databases;
use employeedetails;
show tables;


create table employee 
(
EmployeeID int NOT NULL AUTO_INCREMENT,
Employee_Name varchar(255),
Phone_number varchar(255),
Address varchar(255),
Department varchar(255),
Gender char(1),
salary float,
Start_Date Date,
city varchar(255),
country varchar(255),
PRIMARY KEY (EmployeeID)
);
 desc empTable;
 
 set foreign_key_checks=0;
insert into employee (Employee_Name, Phone_number,Address, Department, Gender, salary, Start_Date, city, country) values ('dhanshri', '8089567890','navi Mumbai','Engg', 'F', '30000.0', '2022-03-02', 'Navi Mumbai', 'India');
insert into employee (Employee_Name, Phone_number,Address, Department, Gender, salary, Start_Date, city, country) values ("Harsh", "8678567890", "Mumbai", "Engg", "M", '30000.0','2022-04-05', "pune", "India");

select * from employee;
delete from empTable where EmployeeID = '2';

select * from empTable where Employee_Name = 'Harsh';


select salary as salary from employee; 

alter table employee modify column salary long;
create table salary as select EmployeeID,Employee_Name,salary from employee;
describe salary;
select * from salary;

update employee set salary = '35000' where Employee_Name = 'Dhanshri';

/*Group by,sum,count,avg,min,max*/
select sum(salary) from employee where Gender = 'F' group by Gender;
select sum(salary) from employee where Gender = 'M' group by Gender;

select count(*) from employee where Gender = 'F';
select count(*) from employee where Gender = 'M';

select count(*) from employee group by Gender;

select avg(salary) from employee where Gender = 'M' group by Gender;
select avg(salary) from empTable where Gender = 'F' group by Gender;

select min(salary) from employee where Gender = 'M' group by Gender;
select max(salary) from employee where Gender = 'M' group by Gender;

select min(salary) from employee where Gender = 'F' group by Gender;
select max(salary) from employee where Gender = 'F' group by Gender;

select * from employee order by salary desc;
select * from employee order by salary asc;

select * from employee;
SELECT * FROM employee WHERE Start_Date = '2022-03-02';

create view view1 as select Employee_Name , Department from employee where city = "Pune";
select * from view1;

select * from employee where country = "India" AND city = "Navi Mumbai";
Select * from employee where country = "America" OR city = "Pune";
select * from employee where NOT city = "Nagpur";

select * from employee limit 3;

select * from employee where Employee_Name LIKE 'A%';
select * from employee where Employee_Name LIKE '%a';
select * from employee where Employee_Name LIKE '%ur%';
select * from employee where Employee_Name LIKE '_n%';
select * from employee where Employee_Name LIKE 'k__%';
select * from employee where Employee_Name LIKE 'A%h';
select * from employee where Employee_Name NOT LIKE 'A%';

select * from employee where city in ('Pune',' Navi Mumbai');
select * from employee where salary between 35000 AND 41000;

select EmployeeID as Id, Employee_Name as Name from employee;
select * from employee;

create table Orders(OrderId int Not Null, CustomerId int, OrderDate date);
create table Customers(CustomerId int Not Null, CustomerName varchar(255), country varchar(255),Mobile varchar(10));

/*Insert Select*/
create table emp(id int,name varchar(100),city varchar(100));
insert into emp(id, name, city) select EmployeeID,Employee_Name,city from employee where country = 'India';
select * from emp;


SELECT * FROM employeedetails.Orders;
insert into Orders(OrderId,CustomerId,OrderDate) values('10308','2','2021-03-09');
insert into Orders(OrderId,CustomerId,OrderDate) values('10309','37','2022-05-05');
insert into Orders(OrderId,CustomerId,OrderDate) values('10310','77','2022-02-03');

/*Union - Combines the result-set of two or more select stmt */
SELECT OrderID FROM Orders UNION SELECT CustomerName FROM Customers;


SELECT * FROM employeedetails.Customers;
use employeedetails;
insert into Customers(CustomerId,CustomerName,country,Mobile) values('1','Dhanshri','India','9098789560');
insert into Customers(CustomerId,CustomerName,country,Mobile) values('2','Harsh','America','9098456560');
insert into Customers(CustomerId,CustomerName,country,Mobile) values('3','Vaibhav','India','9098781234');

/*Inner Join ==> Return matching values from both table*/
SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate FROM Orders 
INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;

/*Left Join == Returns all records from left table and mathcing from the right table*/
SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate FROM Orders 
LEFT JOIN Customers ON Orders.CustomerID=Customers.CustomerID;

/*Right Join == Returns all records from right table and mathcing from the left table*/
SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate FROM Orders 
Right JOIN Customers ON Orders.CustomerID=Customers.CustomerID;

/*Cross Join == Returns all records from both tables*/
SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate FROM Orders 
CROSS JOIN Customers ON Orders.CustomerID=Customers.CustomerID;


/* Indexes */
create index byCity on employee(EmployeeID, Employee_Name, city);
select * from byCity;
ALTER TABLE employee DROP INDEX byCity;
show indexes from employee;