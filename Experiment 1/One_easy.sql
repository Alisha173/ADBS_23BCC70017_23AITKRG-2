Create database Experiments;
Use Experiments;
--Learning Inner Join and Foriegn Key
/* Create table author and book with relation using foreign key*/

Create table TBL_Author
(
	Author_ID Int Primary Key,
	Author_Name Varchar(MAX),
	Country Varchar(MAX)
)

Create table TBL_Book
(
	Book_ID Int Primary Key,
	Book_Title Varchar(MAX),
	AuthorID Int,
	Foreign Key (AuthorID) References TBL_Author(Author_ID)
)

INSERT INTO TBL_Author (Author_ID, Author_Name, Country)
VALUES 
(1, 'J.K. Rowling', 'United Kingdom'),
(2, 'George Orwell', 'United Kingdom'),
(3, 'Haruki Murakami', 'Japan'),
(4, 'Paulo Coelho', 'Brazil'),
(5, 'Agatha Christie', 'United Kingdom');

INSERT INTO TBL_Book (Book_ID, Book_Title, AuthorID)
VALUES 
(101, 'Harry Potter', 1),
(102, '1984', 2),
(103, 'Kafka on the Shore', 3),
(104, 'The Alchemist', 4),
(105, 'Murder on the Orient Express', 5);

--Inner JOIN
/*
Select TBL_Author.*,TBL_Author.*
From TBL_Book
Inner Join
TBL_Author
on
TBL_Author.Author_ID = TBL_Book.AuthorID;
*/
Select B.*,A.*
From TBL_Book AS B
Inner Join
TBL_Author AS A
on
A.Author_ID = B.AuthorID;