create database library
use library

create table library(
LibraryId int NOT NULL,
LibraryName varchar(100),
contactNumber int,
year int,
primary key(LibraryId)
);


alter table library
drop column year

alter table library
add  column year year


drop table library

create table Library(
LibraryId int NOT NULL,
LibraryName varchar(100),
contactNumber int,
year int,
primary key(LibraryId)
);

create table location(
ID INT,
Location varchar(100),
primary key(ID,Location),
LID int foreign key references Library(LibraryId)
);

create table book(
bookID int NOT NULL,
ISBN varchar(10) NOT NULL,
title varchar(255),
price DECIMAL(8,2),
BLID int foreign key references Library(LibraryId),
primary key(bookID)
);

create table member(
memberID int NOT NULL,
Fname varchar(100),
Lname varchar(100),
phoneNumber VARCHAR(15),
email VARCHAR(254),
membershipStartDate date
primary key(memberID)
);

alter table Library
add booksId int foreign key references Library(LibraryId)

select * from Library

alter table book
add membersID int foreign key references member(memberID)

select * from book

create table staff(
staffID int NOT NULL,
Fname varchar(100),
Lname varchar(100),
position varchar(50),
contactNumber varchar(15),
primary key(staffID)
);

drop table staff 

alter table Library
add staffsID int foreign key references staff(staffID)

select * from staff

create table review(
rating TINYINT NOT NULL,
reviewDate date,
comments VARCHAR(1000),
memberssID int foreign key references member(memberID),
primary key(rating)
);
select * from review
drop table review

create table loan(
loanDate date Not NULL,
dueDate date,
status varchar(255),
returnDate date,
primary key(loanDate)
);
select * from loan

create table payment(
payDate date NOT NULL,
amount DECIMAL(10,2),
method varchar(100),
finePayment DECIMAL(10,2),
loansDate date foreign key references loan(loanDate)
);
select * from payment

