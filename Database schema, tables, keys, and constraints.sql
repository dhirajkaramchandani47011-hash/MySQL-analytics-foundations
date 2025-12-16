create database CollegeDB;
use CollegeDB;

create table Course(
course_id int primary key,
course_name varchar (50),
department_id int , 
professor_id int );

create table Departments(
department_id int Primary key,
department_name varchar (50));

create table Enrolments(
enrolment_id int primary key,
student_id int ,
course_id int,
foreign key (course_id) references course(course_id),
enrolment_date date);

create table professor (
professor_id int Primary Key,
professor_name varchar(50),
department_id int ,
foreign key (department_id) references Departments(department_id));

create table students(
student_id int Primary Key,
student_name varchar(50),
gender varchar (50),
birth_date date,
department_id int,
foreign key (department_id) references Departments (department_id));

alter table course
add constraint department_id foreign key (department_id)
references Departments (department_id);

alter table course
add constraint professor_id foreign key (professor_id)
references professor (professor_id);

alter table enrolments
add constraint student_id foreign key (student_id)
references students(student_id);

alter table students 
add constraint gender check (gender = 'Male' or 'Female');