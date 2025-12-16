drop database orders;
drop database sales;

create database sales;
use sales;
create table orders (ord_no int , purch_amt int , ord_date date , customer_id int , salesman_id int);
insert into orders 
values (7001 , 150.5 , '2012-10-05', 3005 , 5002);

select * from orders;
insert into orders
values (70009, 270.65 , '2012-09-10' , 3001 , 5005),
(70002 , 65.26 , '2012-10-05' , 3002 , 5001),
(70004, 110.5 , '2012-08-17' , 3009 , 5003),
(70007 , 948.5,'2012-09-10', 3005 , 5002),
(70005 , 2400.6 , '2012-07-27' , 3007, 5001);

use sales;
SELECT * FROM ORDERS;
update orders
set ord_no = 70001
where ord_no = 7001;

select * from orders;

insert into orders
values  (70008 , 5760 , '2012-09-10' , 3002 , 5001),
(70010 , 1983.43 , '2012-10-10' , 3004 , 5006),
(70003 , 2480.40 , '2012-10-10' , 3009 , 5003),
(70012 , 250.45 , '2012-06-27' , 3008 , 5002),
(70011 , 75.29 , '2012-08-17' , 3003 , 5007),
(70013 , 3045.60 , '2012-04-25' , 3002 , 5001);

select * from orders;


create table customers ( customer_id int , cust_name varchar (50) , city varchar(50) , grade int , salesman_id int);
insert into customers 
values (3002 , 'Nick Rimando' , 'New York' , 100 , 5001),
(3007 , 'Brad Davis' , 'New York' , 200 , 5001),
(3005 , 'Graham Zusi' , 'California' , 200 , 5002),
(3008 , 'Julian Green' , 'London' , 300 , 5002),
(3004 , 'Fabian Johnson' , ' Paris' , 300 , 5006),
(3009 , 'Geoff cameron' , 'Berlin' , 100 , 5003),
(3003 , 'Jozy Altidor' , 'Moscow' , 200 , 5007),
(3001, 'Brad Guzan' , 'London' , null , 5005);

select * from customers;

use sales;

 create table salesman ( salesman_id int , Name Varchar(50) , city varchar(50) , commission decimal (5,2));

insert into salesman
values (5001 , 'James Hoog' , 'New York' , 0.15),
(5002 , 'Nail Knite' , 'Paris' , 0.13),
(5005 , 'Pit Alex' , 'London' , 0.11),
(5006 , 'Mc Lyon' , 'Paris', 0.14),
(5007 , 'Paul Adam' , 'Rome' , 0.13),
(5003 , 'Lauson Hen' , 'San Jose' , 0.12);

create table item_mast (pro_id int , pro_name varchar (50) , pro_price decimal (10,2) , pro_com int);
insert into item_mast
values
(101 , 'Mother Board' , 3200.00 , 15),
(102 , 'Key Board' , 450.00 , 16),
(103 , 'Zip Drive' , 250.00 , 14),
(104 ,'Speaker' , 550.00 , 16),
(105 , 'Monitor', 5000.00, 11),
(106 , 'DVD Drive', 900.00 , 12),
(107 , 'CD Drive' , 800.00 , 12),
(108 , 'Printer' , 2600.00 , 13),
(109 , 'Refil Cartridge' , 350.00 , 13),
(110 , 'Mouse' , 250.00 , 12);


create table emp_department (dpt_code int , dpt_name varchar (50) , dpt_allotment int);
insert into emp_department
values
(57 , 'IT' , 65000),
(63, 'Finance' , 15000),
(47 , 'HR' , 240000),
(27 , 'RD' , 55000),
(89 , 'QC' , 75000);

create table emp_details (emp_id int , emp_fname varchar(50) , emp_lname varchar(50) , emp_dept int);
insert into emp_details
values
(127323 , 'Michale' , 'Robbin' , 57),
(526689 , 'Carlos' , 'Snares' , 63),
(843795 , 'Enric' , 'Dosio' , 57),
(328717 , 'Jhon' , 'Snares' , 63),
(444527 , 'Joseph' , 'Dosni' , 47),
(659831 , 'Zanifer' , 'Emily' , 47),
(847674 , 'Kuleswar' , 'Sitaraman' , 57),
(748681 , 'Henry' , 'gabriel' , 47),
(555935 , 'Alex' , 'Manuel' , 57),
(539569 , 'George' , 'Mardy' , 27),
(733843 , 'Mario' , 'Saule' , 63),
(631548 , 'Alan' , 'Snappy' , 27),
(839139 , 'Maria' , 'Foster' , 57);

use sales;

-- Boolean and Relational Operator: 

-- 1. write a SQL query to locate the details of customers with grade values above 100. Return customer_id, cust_name, city, grade, and salesman_id. 
SELECT * FROM Customers;

select * from Customers
where grade > 100;

-- 2. write a SQL query to find all the customers in ‘New York’ city who have a grade value above 100.
--  Return customer_id, cust_name, city, grade, and salesman_id. 

select * from customers
where city = 'New York' and grade > 100;

-- 3. write a SQL query to find customers who are from the city of New York or have a grade of over 100.
--  Return customer_id, cust_name, city, grade, and salesman_id.


select * from customers
where city = 'New York' or grade > 100;

-- 4.  write a SQL query to find customers who are either from the city 'New York' or who do not have a grade greater than 100.
--  Return customer_id, cust_name, city, grade, and salesman_id. 

select * from customers
where city = 'New York' or not grade >100;

-- 5. write a SQL query to identify customers who are not from the city of 'New York' and do not have a grade value greater than 100.
--  Return customer_id, cust_name, city, grade, and salesman_id.

select * from customers
where not city = 'New York' and not grade > 100;

-- 6. write a SQL query to find details of all orders excluding those with ord_date equal to '2012-09-10' 
-- and salesman_id higher than 5005 or purch_amt greater than 1000.
-- Return ord_no, purch_amt, ord_date, customer_id and salesman_id.  

select * from orders;

select * from orders
where not ord_date = '2012-09-10' and (salesman_id > 5005 or purch_amt > 1000);

-- write a SQL query to find the details of those salespeople whose commissions range from 0.10 to0.12.
--  Return salesman_id, name, city, and commission. 
select * from salesman;

-- 7.  write a SQL query to find the details of those salespeople whose commissions range from 0.10 to0.12. 
-- Return salesman_id, name, city, and commission. 

select * from salesman
where commission between 0.10 and 0.12;

-- 8. write a SQL query to find details of all orders with a purchase amount less than 200 or 
-- exclude orders with an order date greater than or equal to '2012-02-10' and a customer ID less than 3009. 
-- Return ord_no, purch_amt, ord_date, customer_id and salesman_id.

select * from orders;

select * from orders
where purch_amt < 200 or (ord_date >= '2012-02-10' and customer_id < 3009);

-- 9. write a SQL query to find all orders that meet the following conditions.
-- Exclude combinations of order date equal to '2012-08-17' or customer ID greater than 3005 and purchase amount less than 1000.

select * from orders
where (not ord_date = '2012-08-17' or customer_id > 3005 and not purch_amt < 1000);

-- 10. Write a SQL query that displays order number, purchase amount, 
-- and the achieved and unachieved percentage (%) for those orders that exceed 50% of the target value of 6000.  

select * from orders;

-- 11. write a SQL query to find the details of all employees whose last name is ‘Dosni’ or ‘Mardy’. 
-- Return emp_idno, emp_fname, emp_lname, and emp_dept. 

select * from emp_details 
where emp_lname = 'Mardy';

-- 12. write a SQL query to find the employees who work at depart 47 or 63. 
-- Return emp_idno, emp_fname, emp_lname, and emp_dept.

select * from emp_details
where emp_dept between 47 and 63;

-- Aggregation functions:


-- 1. write a SQL query to calculate total purchase amount of all orders.
-- Return total purchase amount.
select sum(purch_amt) as Total_purchase_amount
from orders;

-- 2. write a SQL query to calculate the average purchase amount of all orders.
-- Return average purchase amount. 
select avg(purch_amt) as Avg_Purchase_amount
from orders;

-- 3.  write a SQL query that counts the number of unique salespeople.
-- Return number of salespeople.  
select count(salesman_id) as No_of_Salesmans
from salesman;

-- 4. write a SQL query to count the number of customers. 
-- Return number of customers.  
select count(customer_id) as No_of_customers
from customers;

-- 5. write a SQL query to determine the number of customers who received at least one grade for their activity.

select * from customers;

select count(customer_id) as Graded_Customers
from customers
where grade is not null;

-- 6. write a SQL query to find the maximum purchase amount.  

select max(purch_amt) as Maximum_purchase_amount
from orders;

-- 7. write a SQL query to find the minimum purchase amount. 

select min(purch_amt) as Maximum_purchase_amount
from orders;

-- 8. write a SQL query to find the highest purchase amount ordered by each customer. 
-- Return customer ID, maximum purchase amount. 


select max(purch_amt) as Highest_Purchase_Amount , customer_id
from orders
group by customer_id;

-- 9. write a SQL query to find the highest purchase amount ordered by each customer on a particular date. 
-- Return, order date and highest purchase amount.

select max(purch_amt) as Highest_Purchase_Amount , ord_date
from orders
group by ord_date;

-- 10. write a SQL query to find the highest purchase amount ordered by each customer on a particular date. 
-- Return, order date and highest purchase amount.

-- 11. write a SQL query to determine the highest purchase amount made by each salesperson on '2012-08-17'. 
-- Return salesperson ID, purchase amount 

select max(purch_amt) as Highest_Purchase_Amount , salesman_id , ord_date
from orders
where ord_date = '2012-08-17'
group by salesman_id;

-- 12.  write a SQL query to find the highest order (purchase) amount by each customer on a particular order date. 
-- Filter the result by highest order (purchase) amount above 2000.00.

select max(purch_amt) as highest_purchase_amount , ord_date , customer_id 
from orders
group by ord_date , customer_id
having max(purch_amt)  > 2000;

-- 13. write a SQL query to find the maximum order (purchase) amount in the range 2000 - 6000 (Begin and end values are included.)
--  by combination of each customer and order date. 
--  Return customer id, order date and maximum purchase amount.

select max(purch_amt) as highest_purchase_amount , customer_id , ord_date
from orders
group by ord_date , customer_id
having max(purch_amt) between 2000 and 6000;

-- 14. write a SQL query to find the maximum order (purchase) amount based on the combination of each customer and order date. 
-- Filter the rows for maximum order (purchase) amount is either 2000, 3000, 5760, 6000. 
-- Return customer id, order date and maximum purchase amount.

select max(purch_amt) as highest_purchase_amount , customer_id , ord_date
from orders
group by ord_date , customer_id
having max(purch_amt) in (2000,3000,5760,6000);

-- 15.  write a SQL query to determine the maximum order amount for each customer. 
-- The customer ID should be in the range 3002 and 3007(Begin and end values are included.). 
-- Return customer id and maximum purchase amount.

select max(purch_amt) as highest_purchase_amount , customer_id
from orders
group by purch_amt , customer_id
having customer_id between 3002 and 3007;

-- 16. write a SQL query to find the maximum order (purchase) amount for each customer. 
-- The customer ID should be in the range 3002 and 3007(Begin and end values are included.). 
-- Filter the rows for maximum order (purchase) amount is higher than 1000. 
-- Return customer id and maximum purchase amount.

select max(purch_amt) as highest_purchase_amount , customer_id
from orders
group by purch_amt , customer_id
having customer_id between 3002 and 3007 and max(purch_amt) > 1000;

-- 17. write a SQL query to determine the maximum order (purchase) amount generated by each salesperson. 
-- Filter the rows for the salesperson ID is in the range 5003 and 5008 (Begin and end values are included.). 
-- Return salesperson id and maximum purchase amount.

select max(purch_amt) as highest_purchase_amount , salesman_id 
from orders
group by salesman_id , purch_amt
having salesman_id between 5003 and 5008;

-- 18. write a SQL query to count all the orders generated on '2012-08-17'. 
-- Return number of orders.

select count(ord_no) , ord_date
from orders
group by ord_date
having ord_date = '2012-08-17';

-- 19.  write a SQL query to count the number of salespeople in a city. Return number of salespeople.
select count(salesman_id) , city
from salesman
group by city;

-- 20.  write a SQL query to count the number of orders based on the combination of each order date and salesperson. 
-- Return order date, salesperson id.

select count(ord_no) as Order_count , salesman_id , ord_date
from orders
group by ord_date , salesman_id;



