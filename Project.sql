-- Create a database named library and following TABLES in the database: 
CREATE DATABASE library;
USE library;

-- 1. Branch 2. Employee 3. Books 4. Customer 5. IssueStatus 6. ReturnStatus Attributes for the tables: 
-- 1. Branch Branch_no - Set as PRIMARY KEY Manager_Id Branch_address Contact_no 
Create table Branch(Branch_no Int PRIMARY KEY,
Manager_Id Int,
Branch_address varchar(30),
Contact_no bigint);
INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no)
VALUES
(1, 101, 'Downtown Library', 9876543210),
(2, 102, 'Uptown Library', 8765432109),
(3, 103, 'Central City Library', 7654321098),
(4, 104, 'Westside Library', 6543210987),
(5, 105, 'Eastside Library', 5432109876);
select * from Branch;

-- 2. Employee Emp_Id – Set as PRIMARY KEY Emp_name Position Salary Branch_no - Set as FOREIGN KEY and it refer Branch_no in Branch table 
Create table Employee(Emp_Id int PRIMARY KEY,
Emp_name varchar(20),
Position varchar(20),
Salary bigint,
Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no));
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no)
VALUES
(101, 'John Doe', 'Manager', 75000, 1),
(102, 'Jane Smith', 'Manager', 50000, 2),
(103, 'Robert Brown', 'Manager', 60000, 3),
(104, 'Emily Davis', 'Technician', 55000, 4),
(105, 'Michael Wilson', 'Clerk', 45000, 5),
(106,'Varun K','Clerk',70000,3),
(107,'Simi K','Assistant',70000,5),
(108,'Kiran K','Technician',5000,3),
(109,'Baiji K','Technician',6000,3),
(110,'Adam K','Technician',70000,3),
(111,'Nooh K','Manager',70000,3);
select * from Employee;

-- 3. Books ISBN - Set as PRIMARY KEY Book_title Category Rental_Price Status [Give yes if book available and no if book not available] Author Publisher 
Create table Books(ISBN bigint PRIMARY KEY,
Book_title varchar(30),
Category varchar(30),
Rental_Price int,
Status varchar(10),
Author VARCHAR(50),
Publisher VARCHAR(50));
INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES
(1110, 'The Great Gatsby', 'Fiction', 300, 'yes', 'F. Scott Fitzgerald', 'Scribner'),
(1111, 'To Kill a Mockingbird', 'Fiction', 250, 'no', 'Harper Lee', 'J.B. Lippincott & Co.'),
(1112, 'Fahrenheit 451', 'Dystopian', 350, 'yes', 'Ray Bradbury', 'Simon & Schuster'),
(1113, '1984', 'Dystopian', 280, 'no', 'George Orwell', 'Houghton Mifflin Harcourt'),
(1114, 'Pride and Prejudice', 'Romance', 200, 'yes', 'Jane Austen', 'Modern Library'),
(1115, 'History forever', 'Romance', 200, 'yes', 'Jane Austen', 'Modern Library');
select * from Books;

-- 4. Customer Customer_Id - Set as PRIMARY KEY Customer_name Customer_address Reg_date 
create table Customer(Customer_Id int PRIMARY KEY,
Customer_name varchar(20),
Customer_address varchar(50),
Reg_date date);
INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES
(1, 'John Doe', '123 Elm St, Springfield', '2024-01-15'),
(2, 'Jane Smith', '456 Oak St, Springfield', '2024-02-22'),
(3, 'Emily Johnson', '789 Pine St, Springfield', '2024-03-10'),
(4, 'Michael Brown', '101 Maple St, Springfield', '2024-04-05'),
(5, 'Sarah Davis', '202 Birch St, Springfield', '2024-05-18'),
(6, 'Rincy Davis', '202 Birch St, Springfield', '2021-05-18'),
(7, 'Natalie Portman', '501 Oak St, Springfield', '2021-11-15'),
(8, 'Chris Hemsworth', '601 Pine St, Springfield', '2021-12-10');
select * from Customer;

-- 5. IssueStatus Issue_Id - Set as PRIMARY KEY Issued_cust – Set as FOREIGN KEY and it refer customer_id in CUSTOMER table Issued_book_name Issue_date Isbn_book – Set as FOREIGN KEY and it should refer isbn in BOOKS table 
create table IssueStatus(Issue_Id int PRIMARY KEY,
Issued_cust int,
FOREIGN KEY (Issued_cust) REFERENCES CUSTOMER(customer_id),
Issued_book_name varchar(30),
Issue_date date,
Isbn_book bigint,
FOREIGN KEY (Isbn_book) REFERENCES BOOKS(ISBN));
INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES
    (1, 1, 'The Great Gatsbye', '2024-08-01', 1110),
    (2, 2, 'To Kill a Mockingbird', '2024-08-05', 1111),
    (3, 3, '1984', '2024-08-10', 1113),
    (4, 4, 'Fahrenheit 451', '2024-08-15', 1112),
    (5, 5, 'Pride and Prejudice', '2024-08-20', 1114),
    (6, 6, '202 Birch St, Springfield', '2023-06-04', 1115);
    select * from IssueStatus;
-- 6. ReturnStatus Return_Id - Set as PRIMARY KEY Return_cust Return_book_name Return_date Isbn_book2 - Set as FOREIGN KEY and it should refer isbn in BOOKS table Display all the tables and Write the queries for the following 
create table ReturnStatus(Return_Id int PRIMARY KEY,
Return_cust varchar(20),
Return_book_name varchar(30),
Return_date date,
Isbn_book2 bigint,
FOREIGN KEY (Isbn_book2) REFERENCES BOOKS(ISBN));
INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES
    (1, 1, 'The Great Gatsbye', '2024-08-15', 1110),
    (2, 2, 'To Kill a Mockingbird', '2024-08-20', 1111),
    (3, 3, '1984', '2024-08-25', 1113),
    (4, 4, 'Fahrenheit 451', '2024-09-01', 1112),
    (5, 5, 'Pride and Prejudice', '2024-09-10', 1114);
    select * from ReturnStatus;
    
    -- 1. Retrieve the book title, category, and rental price of all available books. 
    select Book_title,Category,Rental_Price from Books;
    
    -- 2. List the employee names and their respective salaries in descending order of salary. 
    select Emp_name,Salary from Employee order by salary desc;
    
    -- 3. Retrieve the book titles and the corresponding customers who have issued those books. 
    Select Issued_book_name,Issued_cust from IssueStatus;
    
    -- 4. Display the total count of books in each category. 
    select category,count(*) as 'Count of books' from books group by category;
    
    -- 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000. 
    select Emp_name,Position from Employee where Salary > 50000;
    
    -- 6. List the customer names who registered before 2022-01-01 and have not issued any books yet. 
    select Customer_name from Customer where Reg_date < '2022-01-01' and Customer_Id NOT IN (select Issued_cust from IssueStatus);
    
    -- 7. Display the branch numbers and the total count of employees in each branch. 
    select Branch_no, count(*) as Employee_Count from Employee group by(Branch_no);
    
    -- 8. Display the names of customers who have issued books in the month of June 2023. 
    select C.Customer_name from Customer C JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust where I.Issue_date between '2023-06-01' and '2023-06-30';
    
    -- 9. Retrieve book_title from book table containing history. 
    select Book_title from Books where Book_title LIKE '%history%';
    
    -- 10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees 
    SELECT Branch_no, COUNT(Emp_Id) AS Employee_Count FROM Employee GROUP BY Branch_no HAVING COUNT(Emp_Id) > 5;
    
    -- 11. Retrieve the names of employees who manage branches and their respective branch addresses. 
    SELECT E.Emp_name, B.Branch_address FROM Employee E JOIN Branch B ON E.Emp_Id = B.Manager_Id AND E.Branch_no = B.Branch_no;
    
    -- 12. Display the names of customers who have issued books with a rental price higher than Rs. 25. 
    select C.Customer_name from Customer C JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust JOIN Books B ON B.Isbn = I.Isbn_book where B.Rental_Price > 25;
