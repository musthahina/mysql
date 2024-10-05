# Library Management System - SQL Database
## Description
This project is a SQL-based library management system that maintains information about the following entities:

* Branches
* Employees
* Books
* Customers
* Issue Status
* Return Status \
The database includes various tables for storing and managing data related to books issued by customers, employees working in branches, and other operations like book returns. The SQL queries provided help to interact with this data and retrieve meaningful insights.

## Database Schema
### Branch Table
Stores details about different library branches.\
Attributes: Branch_no (Primary Key), Manager_Id, Branch_address, Contact_no.
### Employee Table
Stores details about employees working in different branches.\
Attributes: Emp_Id (Primary Key), Emp_name, Position, Salary, Branch_no (Foreign Key refers to Branch_no in Branch table).
### Books Table
Stores details about the books available in the library.\
Attributes: ISBN (Primary Key), Book_title, Category, Rental_Price, Status (Availability), Author, Publisher.
### Customer Table
Stores details about customers registered with the library.\
Attributes: Customer_Id (Primary Key), Customer_name, Customer_address, Reg_date.
### IssueStatus Table
Tracks books that have been issued to customers.\
Attributes: Issue_Id (Primary Key), Issued_cust (Foreign Key refers to Customer_Id in Customer table), Issued_book_name, Issue_date, Isbn_book (Foreign Key refers to ISBN in Books table).
### ReturnStatus Table
Tracks books that have been returned by customers.\
Attributes: Return_Id (Primary Key), Return_cust, Return_book_name, Return_date, Isbn_book2 (Foreign Key refers to ISBN in Books table).


## SQL Queries
### Table Creation
* Each table is created with relevant attributes, primary keys, and foreign key relationships.
* Example: The Branch table is linked to the Employee table via the Branch_no attribute.
## Data Insertion
* Sample data is inserted into the tables using INSERT INTO statements.
## Sample Queries
* Retrieve all available books, listing their titles, categories, and rental prices.
* List employee names and salaries in descending order of salary.
* Retrieve the book titles and corresponding customers who have issued those books.
* Display the total number of books in each category.
* Retrieve employee details whose salary exceeds Rs. 50,000.
* List customers who registered before a specific date and have not issued any books yet.
* Display the count of employees in each branch.
* Retrieve names of customers who issued books in June 2023.
* Query specific book titles that contain the word "history".
* Retrieve branch numbers where the employee count exceeds 5.
* Retrieve employees who manage branches along with their branch addresses.
* List customers who issued books with a rental price above Rs. 25.


