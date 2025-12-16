use sales;
select * from emp_department;
select * from emp_details;

-- List all employees along with their department names.

select e.emp_id , e.emp_fname , e.emp_lname , e.emp_dept , d.dpt_name
from emp_details e inner join emp_department d on e.emp_dept = d.dpt_code;

-- Find employees who are assigned to a department.
select e.emp_id , e.emp_fname , e.emp_lname , e.emp_dept , d.dpt_name
from emp_details e left join emp_department d on e.emp_dept = d.dpt_code;

-- Get the full names and department names of employees whose department is 'IT'. 
select e.emp_fname , e.emp_lname , e.emp_dept , d.dpt_name
from emp_details e
left join emp_department d on e.emp_dept = d.dpt_code
where d.dpt_name = 'IT';

-- Find all departments that have at least one employee.
select * from emp_department d
inner join emp_details e on d.dpt_code = e.emp_dept;


-- List employees and departments where department ID is the same in both tables.
select * from emp_department d
inner join emp_details e on d.dpt_code = e.emp_dept;

-- List all employees and their departments, including employees without a department.

SELECT 
 * FROM 
    emp_details e
LEFT JOIN 
    emp_department d ON d.dpt_code = e.emp_dept
    union
    SELECT 
 * FROM 
    emp_details e
RIGHT JOIN 
    emp_department d1 ON e.emp_dept = d1.dpt_code;
  
  use sales;
insert into emp_details (emp_id , emp_fname , emp_lname , emp_dept)
values (839140 , 'Jonathan' , 'Park' , null);
    
-- Show all employees, replacing NULL department names with 'Unassigned'.

select e.emp_id , e.emp_fname , e.emp_lname , coalesce(d.dpt_name , 'unassigned') as department_name
from emp_details e
left join emp_department d on e.emp_dept = d.dpt_code;

-- List all employees and their department names, ordered by department.

select * from emp_details 
inner join emp_department on emp_dept = dpt_code
order by emp_dept;

-- Get the count of employees per department, including departments with zero employees.

select count(e.emp_id) as employee_count , d.dpt_code , d.dpt_name , d.dpt_allotment 
from emp_department d
left join emp_details e on e.emp_dept = d.dpt_code
group by d.dpt_code , d.dpt_name , d.dpt_allotment;

-- List all departments and their employees, including departments without employees.

select d.dpt_code , d.dpt_name , d.dpt_allotment , e.emp_id , e.emp_fname , e.emp_lname 
from emp_department d
left join emp_details e on d.dpt_code = e.emp_dept;

-- Find all departments that currently have no employees assigned.

select d.dpt_code , d.dpt_name , d.dpt_allotment , e.emp_id , e.emp_fname , e.emp_lname 
from emp_department d
left join emp_details e on d.dpt_code = e.emp_dept
where e.emp_id is null;

-- Count how many employees are in each department, showing departments with zero employees too.
select count(e.emp_id) as employee_count , d.dpt_code , d.dpt_name , d.dpt_allotment 
from emp_department d
left join emp_details e on e.emp_dept = d.dpt_code
group by d.dpt_code , d.dpt_name , d.dpt_allotment;

-- Display department names and employees, sorted by department name.
select * from emp_details 
inner join emp_department on emp_dept = dpt_code
order by dpt_name;

-- Find all employees who don’t belong to any department and all departments without employees.
select d.dpt_code , d.dpt_name , d.dpt_allotment , e.emp_id , e.emp_fname , e.emp_lname 
from emp_department d
left join emp_details e on d.dpt_code = e.emp_dept
where e.emp_id is null
union
select d.dpt_code , d.dpt_name , d.dpt_allotment , e.emp_id , e.emp_fname , e.emp_lname 
from emp_department d
right join emp_details e on d.dpt_code = e.emp_dept
where d.dpt_code is null;

-- Show all employees and departments, labeling NULLs as 'Unassigned' or 'No Employee'.
select d.dpt_code , coalesce(d.dpt_name , 'unassigned') as department_name, d.dpt_allotment , coalesce(e.emp_id , 'No Employee') , e.emp_fname , e.emp_lname 
from emp_department d
left join emp_details e on d.dpt_code = e.emp_dept
union
select d.dpt_code , d.dpt_name , d.dpt_allotment , e.emp_id , e.emp_fname , e.emp_lname 
from emp_department d
right join emp_details e on d.dpt_code = e.emp_dept; 