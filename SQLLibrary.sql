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

ALTER TABLE location
ADD CONSTRAINT FK_Child_Parent
FOREIGN KEY (LID)
REFERENCES library1(LibraryId)
ON DELETE CASCADE
ON UPDATE CASCADE;

create table bookk1(
bookID int identity(1,1)  NOT NULL,
ISBN varchar(10) NOT NULL,
title varchar(255),
price DECIMAL(8,2),
BLID int foreign key references library1(LibraryId),
primary key(bookID)
);

alter table bookk1
add  LocationShelf varchar(50)

alter table bookk1
add IsAvailable varchar(100)
create table member1(
memberID int  identity(1,1) NOT NULL,
Fname varchar(100),
Lname varchar(100),
phoneNumber VARCHAR(15),
email VARCHAR(254),
membershipStartDate date
primary key(memberID)
);

alter table library1
add booksId int foreign key references book(bookID)
ON DELETE CASCADE
ON UPDATE CASCADE;





drop column booksId
select * from library1

alter table book
add membersID int foreign key references member(memberID)

select * from book

create table staff1(
staffID int  identity(1,1) NOT NULL,
Fname varchar(100),
Lname varchar(100),
position varchar(50),
contactNumber varchar(15),
primary key(staffID)
);

drop table staff 

alter table library1
add staffsID int foreign key references staff(staffID)
ON DELETE CASCADE
ON UPDATE CASCADE;


select * from staff

create table review1(
reviewID int identity(1,1) NOT NULL,
rating TINYINT NOT NULL,
reviewDate date,
comments VARCHAR(1000),
memberssID int foreign key references member(memberID),
primary key(reviewID)
);
select * from review
drop table review

create table loan1(
LoanID int identity(1,1) NOT NULL,
loanDate date Not NULL,
dueDate date NOT NULL ,
status varchar(255) NOT NULL ,
returnDate date,
primary key(LoanID)
);

select * from loan1

create table payment1(
PayID int identity(1,1) NOT NULL ,
payDate date  NOT NULL,
amount DECIMAL(10,2) NOT NULL,
method varchar(100),
finePayment DECIMAL(10,2),
primary key(payID)
);
alter table payment1
add loanID int foreign key references loan1(LoanID)
ON DELETE CASCADE
ON UPDATE CASCADE;


select * from payment1

alter table loan
add paysDate date foreign key references payment(payDate)

create table link(
IDBooks int,
IDMemerber int,
LDate date,
primary key(IDBooks,IDMemerber,LDate),
IdBook int foreign key references book(bookID),
IdMember int foreign key references member(memberID),
Ldates date foreign key references loan(loanDate)
);


create table  link2(
IDBook2 int ,
IDMember2 int ,
rating2 TINYINT,
primary key(IDBook2,IDMember2,rating2),
IDbooks int foreign key references book(bookID),
IDMembers int foreign key references member(memberID),
ratings TINYINT foreign key references review(rating)
);


create table library1(
LibraryId int identity(1,1)NOT NULL,
LibraryName varchar(100) UNIQUE NOT NULL ,
contactNumber int NOT NULL ,
Lyear int ,
primary key(LibraryId)

);
select * from book
--------------------------------

ALTER TABLE library
ADD LibraryId INT IDENTITY(1,1) PRIMARY KEY;

alter table Library
add UNIQUE (LibraryName)


alter table book
add UNIQUE (ISBN)

alter table member
add UNIQUE(email)


ALTER TABLE Library
DROP CONSTRAINT UQ__Library__549440CC94D8B5F6;

ALTER TABLE Library
ALTER COLUMN LibraryName VARCHAR(100) NOT NULL;

ALTER TABLE Library
ADD CONSTRAINT UQ_Library_LibraryName UNIQUE (LibraryName);




--SELECT LibraryName
--FROM library
--WHERE LibraryId IS NOT NULL;



alter table location
ALTER COLUMN Location varchar(100) NOT NULL

alter table library
ALTER COLUMN contactNumber int NOT NULL

alter table bookk1
ALTER COLUMN title varchar(255) NOT NULL

alter table bookk1
ALTER COLUMN ISBN varchar(10) NOT NULL

alter table bookk1
ALTER COLUMN title varchar(255) NOT NULL

alter table bookk1
ALTER COLUMN ISBN varchar(10) NOT NULL

alter table bookk1
add Genre varchar(100) NOT NULL

alter table bookk1
add  ShelfLocation varchar(255) NOT NULL

--ALTER TABLE member
--alter column  email VARCHAR(254) NOT NULL


--ALTER TABLE member
--DROP CONSTRAINT UQ__member__549440CC94D8B5F6;

--SELECT name, type_desc
--FROM sys.indexes
--WHERE object_id = OBJECT_ID('member');
--DROP INDEX UQ__member__549440CC94D8B5F6 ON member;
--SELECT  
--    s.name  AS SchemaName,
--    t.name  AS TableName,
--    i.name  AS IndexName
--FROM sys.indexes i
--JOIN sys.tables t ON i.object_id = t.object_id
--JOIN sys.schemas s ON t.schema_id = s.schema_id
--WHERE i.name = 'UQ__member__549440CC94D8B5F6';

--DROP INDEX UQ__member__549440CC94D8B5F6 
--ON dbo.member;




ALTER TABLE member
ALTER COLUMN email VARCHAR(254) NOT NULL;

ALTER TABLE member
ADD CONSTRAINT UQ_member_email UNIQUE (email);

alter table member
add  ShelfLocation varchar(255) NOT NULL 

alter table loan
alter column   dueDate date NOT NULL 

alter table loan
alter column status varchar(255) NOT NULL 


alter table payment1
alter column amount DECIMAL(10,2) NOT NULL 

alter table review1
alter column reviewDate date NOT NULL 
-------------------------------------------
select * from bookk1
ALTER TABLE bookk1
ADD CONSTRAINT CK_Book_Genre1
CHECK (Genre IN ('Fiction', 'Non-fiction', 'Reference', 'Children'));

ALTER TABLE loan1
ADD CONSTRAINT CK_Loan_Status1
CHECK (Status IN ('Issued', 'Returned', 'Overdue'));

ALTER TABLE bookk1
ADD CONSTRAINT CK_Book_Price_Positive1
CHECK (Price > 0);

ALTER TABLE payment1
ADD CONSTRAINT CK_Payment_Amount_Positive1
CHECK (amount > 0);

ALTER TABLE loan1
ADD CONSTRAINT CK_Loan_ReturnDate1
CHECK (returnDate >= loanDate);

ALTER TABLE review1
ADD CONSTRAINT CK_Review_Rating1
CHECK (rating BETWEEN 1 AND 5);

ALTER TABLE bookk1
ADD CONSTRAINT DF_Book_IsAvailable1
DEFAULT 1 FOR IsAvailable;

ALTER TABLE loan1
ADD CONSTRAINT DF_Loan_Status1
DEFAULT 'Issued' FOR status;

ALTER TABLE review1
ADD CONSTRAINT DF_Review_Comments1
DEFAULT 'No comments' FOR comments;
select * from review1
-----------------------
insert into library1(LibraryName,contactNumber,Lyear,booksId,staffsID)
values('History',99667754,2001, NULL, NULL),
('computing',98754308,2009, NULL, NULL),
('Islamic',93246129,2017, NULL, NULL),
('computing',90561237,2001, NULL, NULL),
('business',99291357,2009, NULL, NULL),
('Islamic',99976543,2005, NULL, NULL),
('business',90091235,2006, NULL, NULL),
('computing',93698123,2015, NULL, NULL),
('History',99807054,2012, NULL, NULL),
('History',938129542,2018, NULL, NULL);


ALTER TABLE bookk1
DROP column BLID;
select * from payment1


 insert into bookk1(title,ISBN,	price,BLID,isAvailable,Genre,ShelfLocation)
 values('cloud computing',1234,20,NULL,'True','Reference','New York'),
 ('human resources',1223,20,NULL,'True','Children','Massachusetts'),
 ('praying',1223,20,NULL,'True','Reference','Boston'),
 ('netwoking',1981,30,NULL,'Flase','Reference','New York'),
 ('education with funny',1265,20,NULL,'True','Children','Boston'),
  ('education with funny',1265,20,NULL,'Flase','Children','Boston'),
 ('Foundation of historical writing',1232,70,NULL,'True','Non-fiction','Massachusetts'),
 ('sciences',1230,40,NULL,'True','fiction','Massachusetts');


 insert into member(memberID,Fname,Lname,phoneNumber,email,membershipStartDate,ShelfLocation)
 values(1,'Ali','Mohammed',90085541,'a@gmail.com','2023-09-07','New York'),
 (2,'Ahmed','Mohammed',99812354,'ah@gmail.com','2023-08-03','Massachusetts'),
  (3,'Sara','Salam',92132179,'s@gmail.com','2024-08-21','Massachusetts'),
    (4,'Fatma','Salam',93232189,'f@gmail.com','2024-10-09','New York'),
	 (5,'Salah','Ali',99932178,'sa@gmail.com','2025-11-09','New York'),
	  (6,'Heba','Ahmed',98712453,'h@gmail.com','2024-12-20','Massachusetts'),
	  (7,'maram','Ahmed',98332121,'mr@gmail.com','2023-10-20','Massachusetts');

insert into staff1(Fname,Lname,position,contactNumber)
values('Ali','Mohammed','Oman',90087541),
('Sara','Ali','America',91234567),
('Fares','Ali','UAE',99878687),
('Eman','Saif','Oman',91234543),
('Ahmed','Hasem','Bahrain',91214318),
('Ameera','Ahmed','Oman',912354127),
('Shaed','Ali','America',912378541);

insert into review1(rating,reviewDate,comments,memberssID)
values(2,'2023-02-02','add new member',3),
(4,'2024-12-12','edit member',2),
(5,'2025-09-12','delete member',7),
(3,'2025-03-09','edit member',4),
(1,'2023-09-11','add new member',6),
(2,'2025-09-12','delete member',7),
(5,'2025-12-12','delete member',5);


insert into loan1(loanDate,dueDate,status,returnDate)
values('2025-09-06','2025-09-16','Returned','2025-09-26'),
('2025-07-01','2025-07-11','Issued','2025-07-16'),
('2025-02-06','2025-02-16','Returned','2025-02-26'),
('2025-05-15','2025-05-25','Overdue','2025-06-05'),
('2025-07-06','2025-07-16','Returned','2025-07-26'),
('2025-01-06','2025-01-16','Issued','2025-01-26');

insert into payment1(payDate,amount,method,finePayment,loanID)
values('2025-02-23',20,'cash',0,2),
('2025-09-14',15,'visa',0,3),
('2025-05-27',30,'no pay',10,1),
('2025-07-12',20,'visa',0,5);

insert into link(IDBooks,IDMemerber,LDate)
values(2,1,'2025-07-01'),
(1,2,'2025-09-06'),
(3,4,'2025-01-06');

insert into link2(IDBook2,IDMember2,rating2)
values(2,1,3),
(1,2,2),
(3,4,1);

SELECT *
FROM library1;










SELECT *
FROM member;

SELECT *
FROM bookk1;

SELECT LibraryName,Lyear 
from library1;










SELECT title,Genre,price
from bookk1;

SELECT Fname,email
from member;

SELECT staffID,Fname,Lname,position
from staff1;










SELECT title
from bookk1
where ShelfLocation='New York';

SELECT title
from bookk1 
where isAvailable='True';

SELECT Fname
from staff1
where position='Oman';

SELECT loanDate
from loan1
where status='Overdue';

SELECT title
from bookk1
where price>20;

SELECT memberID
from member
where membershipStartDate<' 2025-01-01';

SELECT PayID
from payment1
where amount >=10;

SELECT title
from bookk1
where price <=20;

SELECT reviewDate
from review1
where rating !=5;

SELECT title
from bookk1
where Genre='Fiction' AND isAvailable='True';








SELECT title
from bookk1
where Genre='Fiction' OR Genre='Children';






SELECT memberID
FROM member
where ShelfLocation='New York' AND membershipStartDate >'2024-01-01';




SELECT title
from bookk1
where  (price >= 10 AND price <=30);








SELECT loanDate
from loan1
where status <>'Returned' ;

SELECT title
from bookk1
ORDER BY title ASC;

SELECT title,price
from bookk1
ORDER BY price DESC;


SELECT memberID,membershipStartDate
from member
ORDER BY membershipStartDate DESC;








SELECT LibraryName, Lyear
from library1
ORDER BY Lyear ASC;

SELECT rating, reviewDate
from review1 
ORDER BY rating DESC ,  reviewDate ASC;


SELECT DISTINCT Genre
from bookk1;


SELECT DISTINCT LibraryName
from library1;







SELECT DISTINCT position
from staff1;

SELECT DISTINCT status
from loan1;

SELECT Top 5 title,price
from bookk1
ORDER BY price DESC;

SELECT Top 10 memberID,membershipStartDate
from member
ORDER BY membershipStartDate ASC; 

SELECT Top 3 LibraryName,Lyear
from library1
ORDER BY Lyear ASC;

SELECT Top 5 rating,reviewDate
from review1
ORDER BY rating DESC;



SELECT title
from bookk1
where title LIKE 'The%';

SELECT email
from member
where email LIKE '%gmail.com%';







SELECT LibraryName
from library1
where LibraryName LIKE '%library';

SELECT title
from bookk1
where title LIKE '%with%';

SELECT Fname
from staff1
where Fname LIKE 'A%';

SELECT loanDate,returnDate,status
from loan1
where returnDate IS NULL;



SELECT loanDate,returnDate,status
from loan1
where returnDate IS NOT  NULL;





SELECT reviewDate,comments
from review1
where comments IS NULL OR comments ='NO comment';

SELECT title,Genre, price,isAvailable
from bookk1
where Genre='Fiction'
AND isAvailable='True'
AND price <25
ORDER BY price ASC;


SELECT  Top 5 status,loanDate,dueDate
from loan1
where status='Overdue'
ORDER BY dueDate DESC;

SELECT title,ShelfLocation,price
from bookk1
where ShelfLocation='New York' OR ShelfLocation='California'
AND  price >=30
ORDER BY title ASC;





SELECT title,Genre,price
from bookk1
where Genre='Fiction' OR Genre='Children'
AND (price >= 10 AND price <=30);

SELECT memberID,Fname,email,membershipStartDate
from member
where Year(membershipStartDate)= 2023 OR Year(membershipStartDate)=2024
AND email='%gmail.com%'
ORDER BY membershipStartDate ASC;





SELECT TOP 10 Genre,isAvailable
from bookk1 
where Genre='Fiction' OR Genre='Non-Fiction';

SELECT loanDate,status,returnDate
from loan1
where status='Issued' 
AND Year(returnDate)=2025
ORDER BY loanDate;

SELECT staffsID,LibraryName,Lyear
from library1
where Lyear < 2010 
AND LibraryName='History' OR LibraryName='computing';

alter table review1
add bookReview int;

alter table review1
add CONSTRAINT FK_review1_book 
FOREIGN KEY (bookReview) REFERENCES bookk1(bookID);

SELECT bookID,reviewID
from bookk1 left outer join review1
ON bookID=bookReview;







--------------------------------------
alter table loan1
add bookloan int;
alter table loan1
add CONSTRAINT FK_loan_book 
FOREIGN KEY (bookloan) REFERENCES bookk1(bookID);

alter table library1
add bookkID int;
alter table library1
add CONSTRAINT FK_library_book 
FOREIGN KEY (bookkID) REFERENCES bookk1(bookID);


SELECT LoanID,title,loanDate,dueDate
from  bookk1 inner join loan1 
on bookID =bookloan








SELECT Fname,Lname,position,LibraryName,LibraryId
from staff1 inner join library1
on  staffsID=staffID

SELECT title,Genre,price,LibraryName,Lyear
from bookk1 inner join library1
on bookkID=bookID

select * from review1


SELECT Fname,Lname,rating,comments,reviewDate
from member inner join review1
on memberssID=memberID

alter table review1
add bookrev int;

alter table review1
add CONSTRAINT FK_review_book 
FOREIGN KEY (bookrev) REFERENCES bookk1(bookID);


SELECT title,rating,comments,reviewDate
from bookk1 inner join review1
on bookID=bookrev

SELECT LoanID,PayDate,amount,method,status
from loan1  l inner join payment1 p
on p.loanID=l.LoanID

SELECT l.LoanID AS LoanID_from_loan1, p.LoanID AS LoanID_from_payment1, 
p.PayDate, p.amount, p.method, l.status 
FROM loan1 l INNER JOIN payment1 p 
ON p.LoanID = l.LoanID;

SELECT * from review1

alter table loan1
add memberIDs int;
alter table loan1
add CONSTRAINT FK_loan_member 
FOREIGN KEY (memberIDs) REFERENCES loan1(LoanID);

alter table member
add bookIDss int;
alter table member
add CONSTRAINT FK_book_member 
FOREIGN KEY (bookIDss) REFERENCES bookk1(bookID);
 --inner join
SELECT m.Fname,m.Lname,b.title,l.loanDate,l.dueDate,l.status
from member m  inner join loan1 l  on memberIDs=LoanID
inner join bookk1 b on m.bookIDss=b.bookID

SELECT m.Fname,m.Lname,b.title,r.rating,r.comments
from member m inner join bookk1 b on  m.bookIDss= b.bookID
inner join review1 r on r.bookReview=b.bookID

SELECT b.title,b.Genre,l.LibraryName,l.Lyear,l.contactNumber
from bookk1 b inner join library1 l 
on l.booksId=b.bookID

--left outer join
SELECT b.title,b.Genre,r.rating,r.comments
from bookk1 b left outer join review1 r
on r.bookReview=b.bookID








SELECT m.Fname,m.Lname, m.email,l.loanDate,l.dueDate,l.status
from member m left outer join loan1 l
on l.memberIDs=m.memberID

SELECT l.LoanID, l.loanDate,l.status,p.PayDate,p.amount
from loan1 l left outer join payment1 p
on p.loanID=p.LoanID

SELECT b.bookID,b.title
from bookk1 b left outer join review1 r
on r.bookReview=b.bookID
where r.bookReview IS NULL;








SELECT b.title,m.Fname,m.Lname,r.rating,r.comments
from bookk1 b left outer join member m
on m.bookIDss=b.bookID left outer join review1 r
on r.memberssID=m.memberID

--right outer join
SELECT m.Fname,m.Lname, m.email,l.loanDate,l.dueDate,l.status
from member m right outer join loan1 l
on l.memberIDs=m.memberID

SELECT l.LoanID, l.loanDate,l.status,p.PayDate,p.amount
from loan1 l right outer join payment1 p
on p.loanID=p.LoanID


SELECT * from library1
SELECT b.title,b.Genre,l.LibraryName,l.Lyear,l.contactNumber
from bookk1 b right outer join library1 l 
on l.bookkID=b.bookID


SELECT l.LibraryName,s.Fname
from library1 l right outer join staff1 s
on l.staffsID = s.staffID

--full outer join
SELECT b.title,r.rating,r.comments
from bookk1 b FULL OUTER JOIN review1 r
on r.bookReview=b.bookID








SELECT l.loanID,l.loanDate,p.PayDate,p.amount
from loan1 l full outer join payment1 p
on p.loanID=l.LoanID



-- task 2.7 and task 5.3  i go table incluing member id, book id, loan id because ther is relationship between them 
-- so i can not do join between them

select * from payment1s
update  payment1
set loanID= 1
where PayID=3



-- multi types of join
SELECT m.Fname,m.Lname,l.loanDate,l.dueDate,l.status,p.PayDate,p.amount
from member m inner join loan1 l 
on l.memberIDs=m.memberID left outer join payment1 p
on p.loanID=l.LoanID


SELECT l.LibraryName,b.title,b.Genre,r.rating, r.comments
from bookk1 b inner join library1 l
on l.booksId=b.bookID left outer join review1 r
on r.bookrev=b.bookID

SELECT m.Fname,m.Lname,b.title,lb.LibraryName,l.loanDate,l.returnDate
from member m inner join loan1 l 
on l.memberIDs=m.memberID inner join bookk1 b
on l.bookloan=b.bookID inner join library1 lb
on lb.booksId=b.bookID

 SELECT lb.LibraryName,b.title, 
 COUNT(s.staffID) AS staffNumber,COUNT(l.loanID) AS loanNumber
 from bookk1 b left outer join loan1 l
 on   l.bookloan = b.bookID left  outer join library1 lb
 on lb.booksId=b.bookID left outer join staff1 s
 on lb.staffsID=s.staffID 
 GROUP BY lb.LibraryName,b.title
 ORDER BY lb.LibraryName;

 SELECT  m.Fname,m.email,
 COUNT(l.loanID) AS TotalLoans,COUNT(r.reviewID) AS totalReviews
 from member m left outer join loan1 l
 on l.memberIDs=m.memberID left outer join review1 r
 on r.memberssID=m.memberID 
 GROUP BY m.Fname , m.email
 ORDER BY m.Fname;



 

SELECT b.Title, lb.LibraryName, 
AVG(r.Rating) AS AverageRating, COUNT(r.ReviewID) AS TotalReviews 
from library1 lb LEFT JOIN Bookk1 b 
ON lb.booksId = b.BookID LEFT JOIN Review1 r
ON r.BookReview = b.BookID 
GROUP BY b.Title,
lb.LibraryName 
ORDER BY lb.LibraryName, b.Title;

--here can not do join between library and payment
SELECT m.Fname AS memberName,m.email,b.title AS bookTitles
DATEDIFF(DAY, loan.DueDate, GETDATE()) AS DaysOverdue, p.Finepayment AS FinePaid
from loan1 l inner  join member m
on l.memberIDs=m.memberID inner join bookk1 b
on m.bookIDss=b.bookID inner join library1 lb
on lb.booksId=b.bookID left outer join payment1 p

SELECT m.Fname AS memberNames ,b.title AS bookTitle ,b.Genre,lb.LibraryName,l.loanDate,l.returnDate,
DATEDIFF(DAY, l.loanDate, ISNULL(l.returnDate, GETDATE())) AS DaysBorrowed, r.rating AS RatingGiven
from member m inner join bookk1 b
on m.bookIDss=b.bookID inner join library1 lb
on lb.booksId=b.bookID left outer join loan1 l
on l.bookloan=b.bookID left outer join review1 r
on r.bookrev=b.bookID
ORDER BY m.Fname,l.loanDate



SELECT b.title,b.Genre,b.price,lb.libraryName,l.loanID
from bookk1 b left outer join library1 lb
on lb.booksId =b.bookID left outer join loan1 l 
on l.bookloan=b.bookID
where l.loanID IS NULL ;






--here join can not do because ther is no relationship between loan and review
SELECT m.Fname,m.memberID, r.reviewDate,r.comments
DATEDIFF(DAY, l.loanDate, ISNULL(l.returnDate, GETDATE())) AS DaysBorrowed
from member m left outer join loan1 l
on l.memberIDs=m.memberID left outer join review1 r
on



SELECT s.Fname, s.position, lb.LibraryName, 
COUNT(DISTINCT b.bookID) AS numberOfBook, 
COUNT(DISTINCT CASE WHEN l.returnDate IS NULL THEN l.loanID END) AS numberofactiveloans 
FROM staff1 s JOIN library1 lb 
ON lb.staffsID = s.staffID LEFT OUTER JOIN bookk1 b 
ON b.bookStaff = s.staffID LEFT OUTER JOIN loan1 l
ON l.bookloan = b.bookID 
GROUP BY s.Fname, s.position, lb.LibraryName;





alter table bookk1
add bookStaff int;
alter table bookk1
add CONSTRAINT FK_book_staff
FOREIGN KEY (bookStaff) REFERENCES staff1(staffID);

-------------------------aggrigration funtion
SELECT COUNT(*) AS num_books
from bookk1








SELECT COUNT(memberID) AS num_registered_member
from member


SELECT SUM(price)AS sum_price_books
from bookk1

SELECT AVG(price) AS avger_price_books
from bookk1










SELECT MIN(price) AS cheapest_book , MAX(price) AS  most_expensive_book 
from bookk1

SELECT COUNT(loanID) AS num_loans 
from loan1 
where status='Overdue';









SELECT MAX(rating) AS highest_rating
from review1 

SELECT MIN(rating) AS highest_rating
from review1 


SELECT COUNT(amount) AS all_fines_collected ,
 SUM(PayID) AS sum_every_payment
from payment1 








SELECT COUNT(*) AS loan_returned
from loan1
where returnDate IS NOT NULL;


SELECT COUNT(*),Genre
from bookk1
GROUP BY Genre;


SELECT lb.LibraryID, COUNT(s.staffID) AS num_staffs
from library1 lb  left outer join staff1 s 
on lb.staffsID=s.staffID 
GROUP BY LibraryID;







--here i use code case when for count each status of loan
SELECT COUNT(CASE WHEN l.status = 'Issued' THEN 1 END) AS issued_loans, 
COUNT(CASE WHEN l.status = 'Returned' THEN 1 END) AS returned_loans, 
COUNT(CASE WHEN l.status = 'Overdue' THEN 1 END) AS overdue_loans
from loan1 l
GROUP BY status;

SELECT AVG(price) AS  average_book_price, Genre
from bookk1
GROUP BY Genre;


SELECT SUM(price) AS  sum_book_price, Genre
from bookk1
GROUP BY Genre;


SELECT MAX(price) AS  most_expensive_book , Genre
from bookk1
GROUP BY Genre;








SELECT COUNT(reviewID) AS num_reviews, rating
from review1 
GROUP BY rating;



SELECT lb.LibraryID, COUNT(b.bookID) AS num_books
from library1 lb left outer join bookk1 b
on lb.bookkID=b.bookID
GROUP BY lb.LibraryID;








SELECT m.memberID,COUNT(l.loanID) AS num_loans
from member m left outer join loan1 l
on l.memberIDs=m.memberID
GROUP BY m.memberID;

SELECT MIN(price) AS cheapest_book,Genre
from bookk1
GROUP BY Genre;


SELECT COUNT(bookID) AS num_books,Genre
from bookk1
GROUP BY Genre
ORDER BY Genre DESC;

SELECT AVG(price) AS average_price,Genre
from bookk1
GROUP BY Genre
ORDER BY average_price ASC;








SELECT COUNT(*) AS loan_status,status
from loan1
GROUP BY status
ORDER BY  status ASC;


SELECT SUM(amount) AS total_payment_amount,method
from payment1
GROUP BY method
ORDER BY total_payment_amount DESC;

SELECT Genre
from bookk1
GROUP BY Genre
HAVING COUNT(*) >= 3;

SELECT l.LibraryID, COUNT(s.staffID) AS num_staff 
FROM library1 l LEFT JOIN staff1 s
ON l.staffsID=s.staffID
GROUP BY l.LibraryID 
HAVING COUNT(s.staffID) >= 2;


SELECT m.memberID,COUNT(l.loanID) AS num_book_borrowed
from member m join loan1 l
on l.memberIDs=m.memberID
GROUP BY m.memberID
HAVING COUNT(l.loanID) >=1;







SELECT Genre,AVG(price) AS avg_price
from bookk1
GROUP BY Genre
HAVING AVG(price) > 30;


SELECT b.bookID, COUNT(r.reviewID) AS num_reviews
FROM bookk1 b JOIN review1 r 
ON r.bookReview = b.bookID 
GROUP BY b.bookID 
HAVING COUNT(r.reviewID)<=2
ORDER BY num_reviews DESC;


SELECT Genre,SUM(price) AS total_price
from bookk1
GROUP BY Genre
HAVING SUM(price)>20;


SELECT method,SUM(amount)AS total_amounts
from payment1
GROUP BY method
Having SUM(amount)>15;






SELECT count(status) AS status_loan_times
from loan1
GROUP BY status
HAVING COUNT(status) >=2;


SELECT m.memberID,COUNT(r.reviewID) AS num_reviews
from member m join review1 r 
on r.memberssID=m.memberID
GROUP BY m.memberID
having COUNT(r.reviewID)>=2;






SELECT lb.LibraryID, COUNT(b.bookID) AS num_books 
FROM library1 lb  left outer JOIN bookk1 b 
ON lb.booksId=b.bookID 
GROUP BY lb.LibraryID 
HAVING COUNT(b.bookID) >2;


SELECT Genre,COUNT(*) AS books_avaiable
from bookk1
where IsAvailable ='True'
GROUP BY Genre
HAVING COUNT(*)>1;







SELECT Genre, AVG(price) AS avg_price_genre
from bookk1
where Genre IN ('Fiction', 'Children')--is a filter condition which Only rows where the column Genre has a value of either 'Fiction' or 'Children'
GROUP BY Genre
HAVING AVG(price) >15;

SELECT l.memberIDs, COUNT(l.loanID) AS active_loans
FROM loan1 l 
WHERE l.status IN ('Overdue','Issued')
GROUP BY l.memberIDs 
HAVING COUNT(l.loanID) > 1 
ORDER BY active_loans DESC;

SELECT r.rating,b.title,COUNT(r.reviewID) AS num_book_reviews
from review1 join bookk1 b
on r.bookReview=b.bookID
where rating >=3
GROUP BY b.title
HAVING COUNT(r.reviewID)>=2;

SELECT Genre, COUNT(bookID) AS book_priced_below20 
FROM bookk1
WHERE price < 30
GROUP BY Genre
HAVING COUNT(bookID) > 1
ORDER BY book_priced_below20 DESC;


SELECT lb.libraryID,lb.LibraryName, COUNT(b.bookID) AS num_books
from library1 lb join bookk1 b
on lb.booksId=b.bookID
GROUP BY  lb.libraryID,lb.LibraryName
ORDER BY num_books DESC;

SELECT m.Fname,m.Lname,SUM(l.loanID) AS total_loans
from member m join loan1 l
on l.memberIDs=m.memberID
GROUP BY m.Fname,m.Lname
ORDER BY total_loans DESC; 

SELECT b.title,COUNT(l.loanDate) AS loan_times
from bookk1 b join loan1 l
on l.bookLoan=b.bookID
GROUP BY b.title
ORDER BY loan_times ASC;

--here becase put data type for rating TINYINT so no reult run
SELECT b.title,AVG(CAST(r.rating AS DECIMAL(3,2))) AS avg_rating
from book1 b  left outer join review1 r
on r.bookReview=b.bookID
GROUP BY b.title
ORDER BY avg_rating DESC;


SELECT lb.LibraryName, COUNT(b.bookID) AS num_books 
FROM library1 lb JOIN bookk1 b
ON lb.bookkID = b.bookID
GROUP BY lb.LibraryName 
HAVING COUNT(b.bookID) >= 1 
ORDER BY num_books DESC;

SELECT b.title,AVG(r.rating) AS avg_ratings
from bookk1 b join review1 r 
on r.bookReview=b.bookID
GROUP BY b.title
HAVING AVG(r.rating)>4
ORDER BY avg_ratings DESC;


SELECT lb.libraryID,lc.city ,SUM(p.finePayment) AS sum_fines 
FROM locayion lc join library1 lb
on lc.LIDs=lb.libraryID join bookk1 b
on lb.booksId=b.bookID join loan1 l
on l.bookloan=b.bookID join payment1 p
on p.loanID=l.loanID
GROUP BY lb.libraryID,lc.city
HAVING SUM(p.finePayment) >=10
ORDER BY sum_fines DESC;




SELECT b.Genre,COUNT(l.loanID) AS num_loans
from bookk1  b join loan1 l
on l.bookloan=b.bookID
GROUP BY b.Genre
HAVING COUNT(l.loanID)>2
ORDER BY b.Genre ASC;



SELECT m.Fname,COUNT(l.loanID) AS borrowed_loans
from member m join loan1 l
on l.memberIDs=m.memberID
GROUP BY m.Fname
HAVING COUNT(l.loanID)>=1
ORDER BY borrowed_loans DESC;







UPDATE payment1 
SET finePayment = 7
WHERE PayID = 3;
select * from loan1
--here ther is no relationship between library and loan
SELECT lb.LibraryName,SUM(l.loanID)AS sum_loans
from library1 lb join loan1 l

SELECT m.Fname, COUNT(l.loanID) AS num_overdue_loans 
FROM member m JOIN loan1 l 
ON l.memberIDs = m.memberID 
WHERE l.status = 'Overdue' 
GROUP BY m.Fname 
HAVING COUNT(l.loanID) >=1
ORDER BY num_overdue_loans;



SELECT b.title,COUNT(l.loanID) AS num_borrowrs,AVG(r.rating) AS  avg_review_rating
from review1 r join bookk1 b 
on r.bookReview=b.bookID left outer join loan1 l
on l.bookloan=b.bookID 
GROUP BY b.title
HaVING COUNT(l.loanID)>=1 AND AVG(r.rating)>3
ORDER BY avg_review_rating DESC;





SELECT b.Genre,COUNT(b.title) AS num_books, AVG(b.price) AS avg_price , MIN(b.price) AS cheapeast_price_book
from bookk1 b
GROUP BY b.Genre
HAVING AVG(price) BETWEEN 15 AND 50
ORDER BY avg_price ASC;
-- task5.6

SELECT lb.LibraryName,lc.city,COUNT( DISTINCT b.bookID) AS num_books,COUNT( DISTINCT s.staffID) AS num_staffs,
COUNT(l.loanID) AS num_loans,SUM(p.finePayment) AS sum_fines
from library1 lb left outer join locayion lc
on lc.lIDs=lb.libraryID left outer join staff1 s
on lb.staffsID=s.staffID left outer join bookk1 b
on b.bookStaff=s.staffID left outer join loan1 l
on l.bookloan=l.loanID left outer join payment1 p
on p.loanID=l.loanID
GROUP BY lb.LibraryName,lc.city
HAVING COUNT(l.loanID)>=1
ORDER BY num_loans DESC;

select * from loan1 

create table locayion(
lID int identity(1,1) NOT NULL,
city varchar(100) NOT NULL,
primary key(lID)
);
insert into locayion values('Suhar');
insert into locayion values('Muscat');
insert into locayion values('Nizwa');
insert into locayion values('Ibra');



alter table locayion
add lIDs int 
alter table locayion
add CONSTRAINT FK_locayion_library
FOREIGN KEY (lIDs) REFERENCES library1(libraryID);


update  locayion
set lIDs=3
where LID=1


select* from locayion
SELECT bookID FROM bookk1 WHERE bookID = 2;

update  library1
set booksId=2
where LibraryId=2










 select * from loan1
 update  bookk1
set bookStaff= 2
where bookID=3





 

















