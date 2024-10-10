create database library;
use library;


create  table Authors(
author_id int primary key,
first_name varchar(50),
last_name varchar(50),
date_of_birth date,
nationality varchar(50)
);

insert into Authors(author_id,first_name,last_name,date_of_birth,nationality)
 values
(1, 'George', 'Orwell', '1903-06-25', 'British'),
(2, 'Jane', 'Austen', '1775-12-16', 'British'),
(3, 'Mark', 'Twain', '1835-11-30', 'American'),
(4, 'J.K.', 'Rowling', '1965-07-31', 'British'),
(5, 'Gabriel', 'Garcia Marquez', '1927-03-06', 'Colombian');

select * from authors;





create table Books(
book_id int primary key,
title varchar(50),
author_id int ,
publication_year year,
genre varchar(50),
isbn varchar(50),
available_copies int,
foreign key (author_id) references Authors(author_id));

insert into Books(book_id,title,author_id,publication_year,genre,isbn,available_copies)
values
(1, '1984', 1, 1949, 'Dystopian', '9780451524935', 12),
(2, 'Pride and Prejudice', 2, 1913, 'Romance', '9780141040349', 8),
(3, 'Adventures of Huckleberry Finn', 3, 1984, 'Adventure', '9780142437179', 5),
(4, 'Harry Potter and the Sorcerer\'s Stone', 4, 1997, 'Fantasy', '9780439554930', 10),
(5, 'One Hundred Years of Solitude', 5, 1967, 'Magical Realism', '9780060883287', 6);
select * from Books;


create table Members(
member_id int primary key,
first_name varchar(50),
last_name varchar(50),
date_of_birth date,
contact_number varchar(10),
email varchar(20),
membership_date date);
insert into Members (member_id,first_name,last_name,date_of_birth,contact_number,email,membership_date)
values
(1, 'Alice', 'Johnson', '1990-02-15', '9876543210', 'alice.j@example.com', '2022-01-10'),
(2, 'Bob', 'Smith', '1985-07-22', '9123456789', 'bob.s@example.com', '2021-03-19'),
(3, 'Charlie', 'Brown', '1992-12-05', '9988776655', 'chare.b@example.com', '2023-05-08'),
(4, 'David', 'Miller', '1975-09-18', '9876123456', 'david.m@example.com', '2020-11-01'),
(5, 'Eva', 'Williams', '1988-04-09', '9998887776', 'eva.w@example.com', '2022-09-21');
select* from Members;

create table Loans(
loan_id  int primary key,
book_id int ,
member_id int ,
loan_date date,
return_date date,
actual_return_date date,
foreign key (book_id) references Books(book_id),
foreign key (member_id) references Members(member_id)) ;
insert into Loans(loan_id,book_id,member_id,loan_date,return_date,actual_return_date)
values
(1, 1, 1, '2023-09-01', '2023-09-15', '2023-09-14'),
(2, 3, 2, '2023-08-10', '2023-08-24', '2023-08-22'),
(3, 2, 3, '2023-07-01', '2023-07-15', NULL),
(4, 4, 4, '2023-06-20', '2023-07-04', '2023-06-30'),
(5, 5, 5, '2023-05-11', '2023-05-25', NULL);
select* from Loans;

create table staff (
staff_id int primary key,
first_name varchar(50),
last_name varchar(50),
position varchar(50),
contact_number varchar(15),
email varchar(20),
hire_date date);
insert into staff(staff_id,first_name,last_name,position,contact_number,email,hire_date)
values
(1, 'Sophia', 'Clark', 'Librarian', '9876123400', 'sophia.c@example.com', '2020-02-15'),
(2, 'James', 'Walker', 'Assistant', '9123409876', 'james.w@example.com', '2021-05-20'),
(3, 'Mia', 'Hill', 'Librarian', '9991234567', 'mia.h@example.com', '2019-08-13'),
(4, 'Liam', 'Scott', 'Technician', '9887654321', 'liam.s@example.com', '2022-10-30'),
(5, 'Emma', 'Adams', 'Assistant', '9876543211', 'emma.a@example.com', '2021-11-25');
select * from  staff;

-- 1 DDL

-- 1 Add a new column to the books table:
alter table Books 
add column publisher varchar(50); 
select * from Books;

-- 2 Rename the position column in the staff table to job_title:
alter table Staff 
rename column position to job_title;
select *from staff;

-- 3 drop the email column from the members table:
alter table members
drop email;
select*from members;

-- DML
-- 1. Insert new data into the books table:
insert into Authors(author_id,first_name,last_name,date_of_birth,nationality)
 values
(101, 'Pushpak', 'Deore', '2025-06-25', 'Indian');
insert into Books(book_id,title,author_id,publication_year,genre,isbn,available_copies)
values
(6,'The Grate Gatsby',101,1925,'Fiction','409883u340',10);

select*from books;

-- 2 update  a members contact number 

update members
set  contact_number ='8080685915'
where member_id =1;
select*from members;

-- 3 delete specific loan record 
delete from Loans 
where loan_id =1;
select * from Loans;

-- 4 insert a new loan record 
insert into loans(loan_id,book_id,member_id,loan_date,return_date,actual_return_date)
value(10, 1, 2, '2024-10-01', '2024-10-15', NULL);

-- join queres 

-- 1 retrive all books along with their authors 
select A.title, B.first_name,B.last_name from
Books A
join authors B
on A.author_id =B.author_id;

-- 2. Find all books currently on loan along with member details:



-- 3. List all books borrowed by a specific member:
select B.title 
from Loans  l  
join books b
on L.book_id =b.book_id
where l.member_id =2;

-- 4. Get the total number of books and the total available copies for each genre:
select genre, COUNT(book_id) AS total_books, SUM(available_copies) AS total_copies
from Books
group by genre;



-- 5  Find all staff members who are librarians and their hire dates:
select first_name ,last_name ,hire_date
from staff
where job_title = 'librarian';






































