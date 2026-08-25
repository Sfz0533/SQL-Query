-- Example: Advanced SQL — Find Top Customers by Sales


Create Database SFZ

use SFZ
--- 1.CREATE TABLE Customers
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(50),
    Age INT,
    Email VARCHAR(100)
);

-- 2. INSERT data on  Customers Table
INSERT INTO Customers 
(CustomerID, CustomerName, City, Age, Email)
VALUES
(1, 'Ahmed Khan', 'Aurangabad', 28, 'ahmed@gmail.com'),
(2, 'Rahul Sharma', 'Pune', 32, 'rahul@gmail.com'),
(3, 'Sameer Patel', 'Mumbai', 25, 'sameer@gmail.com'),
(4, 'Priya Singh', 'Nashik', 29, 'priya@gmail.com'),
(5, 'Amit Verma', 'Nagpur', 35, 'amit@gmail.com'),
(6, 'Sneha Joshi', 'Pune', 27, 'sneha@gmail.com'),
(7, 'Imran Shaikh', 'Aurangabad', 31, 'imran@gmail.com'),
(8, 'Neha Patil', 'Mumbai', 24, 'neha@gmail.com');

-- 3.Check the Data
SELECT * 
FROM Customers;

-- 4.CREATE TABLE Orders
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    ProductName VARCHAR(100),
    Quantity INT,
    Amount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID));

--5 INSERT data on Orders
	INSERT INTO Orders
(OrderID, CustomerID, OrderDate, ProductName, Quantity, Amount)
VALUES
(101, 1, '2026-01-10', 'Laptop', 1, 55000),
(102, 2, '2026-01-15', 'Mouse', 2, 1500),
(103, 1, '2026-02-05', 'Keyboard', 1, 2500),
(104, 3, '2026-02-10', 'Monitor', 1, 18000),
(105, 2, '2026-02-20', 'Laptop', 1, 60000),
(106, 4, '2026-03-01', 'Printer', 1, 12000),
(107, 5, '2026-03-05', 'Keyboard', 2, 5000),
(108, 3, '2026-03-10', 'Mouse', 3, 2250);


SELECT
 c.CustomerID,
    c.CustomerName,
    c.City,
    COUNT(o.OrderID) AS TotalOrders,
    SUM(o.Amount) AS TotalSales,
    AVG(o.Amount) AS AverageOrderValue,
    RANK() OVER (ORDER BY SUM(o.Amount) DESC) AS SalesRank
	   	    
FROM Customers c
INNER JOIN Orders o
    	
	ON c.CustomerID = o.CustomerID
GROUP BY
    c.CustomerID,
    c.CustomerName,
    c.City
ORDER BY TotalSales DESC;