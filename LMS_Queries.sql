Use `Library Management System`;

-- sorting by first letter of the books ascending order.

Select Title
From books
-- Where id = 1
order by Title asc; 

-- Getting all active members to send discount deals or do a promotion.

Select 
Id,
First_Name, 
Last_Name
From Members
Where Status = 'Active';

-- Which book has the most reservations- Phatoms of Stone 
-- Count returns the number of rows that meet a specified criterion. 

Select 
Books_Id,
Count(Books_Id) As Value_Occurence
From Reservations 
Group by Books_Id
Order by Value_Occurence, Books_Id Asc;

Select Title
From Books
Where Id = 2; 

-- Write a query to display the member id, member name who have taken the book with book Title-  Phatoms of stone.

Select 
M.Id,
M.First_Name,
M.Last_Name
From Members M
Join Loans L on M.Id = L.Members_Id
Where Books_Id IN 
(Select Id from Books Where title = 'Phatoms_of_stone');

-- A query to display the book code, book title and author of the books whose author name begins with ‘P’.

Select 
Id,
Title,
Author
From Books
Where Author Like 'J%'; 

-- Ans John_Smith, Jade_Joshi

-- A query to display the total number of Thriller books available in library.

Select 
Count(Category) AS 'No_of_Thriller_Books'
From Categories
Where Category = 'Thriller'; 

-- A query to display the number of books published by “Prentice Hall” with the alias name “NO_OF_BOOKS”.
Select 
Title,
Count(Id) AS 'Published_in_2010'
From Books
Where Publication_year = '2010'
Group by Title, Id;

-- A query to display the book code, book title of the books which are issued on the date “1st April 2012″.

Select 
Id,
Title
FROM books 
where Publication_year = '2010';

--  temporarily disabling foreign key checks to change the members primary key to be auto_increment.

set foreign_key_checks=0;
ALTER TABLE members MODIFY id INT AUTO_INCREMENT;

-- Entering a new column of Date_Registration in Members table and updating the values of Registration dates.

Update Members
Set Date_Registration = '2020-10-10'
Where iD =1; 

Update Members 
Set Date_Registration = '2019-09-08'
Where id = 2; 

Update Members 
Set Date_Registration = '2018-09-08'
Where id = 4; 

-- Displaying the member_id, member name, date of registration, membership status of members who 
-- registered before 2021 and membership status is 'active'.

Select 
id, 
First_Name,
Last_Name,
Date_Registration, 
Status
From Members 
Where Date_Registration < '2021-01-01' 
And Status = 'Active'; 

-- Inserting values into column City of members table.

Update members
set city = 'Seattle'
where id = 1; 

-- Inserting values into column city for multiple members in the members table.

Update members
set city = 'Seattle'
where id IN (2,3); 

-- A query to display the member id, member name who’s City is Seattle. Display the member name in title case with alias name ‘Name’.

Select 
iD,
CONCAT (First_Name,' ', Last_Name)  AS 'Name'
From members
Where City = 'Seattle'; 

-- A query to concatenate book title, author and display in the following format- Book_Title is written_by_Author

Select 
Concat (Title, ' ', "is written by", ' ',  Author) As "Book Titles with Author"
From Books;

-- A query to display the average price of books with alias name “AVERAGEPRICE”.

Select
Avg(LoanPrice) AS "Average Price"
From Loans;

-- A query to display the member id, member name, city and member status of members with 
-- the total fine paid by them with alias name “Fine”.

Select 
M.id,
Concat (First_Name, ' ', Last_Name) AS 'Member_Name',
City, 
Status,
Sum(FP.Payment_Amount) AS 'Fine_Paid'
From Members M
Join Fine_Payments FP on M.iD = FP.Members_Id
Group By M.id, 'Member_Name', City, Status;



