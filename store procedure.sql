--                            Store procedure
create database storepro
use storepro
-- Step 1: Create the Customers Table
CREATE TABLE Customers (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    City NVARCHAR(50),
    Country NVARCHAR(50)
);



-- Step 2: Insert sample data into the Customers table
INSERT INTO Customers (FirstName, LastName, City, Country)
VALUES 
('Harry', 'Potter', 'London', 'UK'),
('Hermione', 'Granger', 'London', 'UK'),
('Ron', 'Weasley', 'Ottery St Catchpole', 'UK');

-- Step 3: Create Insert Stored Procedure
CREATE PROCEDURE InsertCustomer
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @City NVARCHAR(50),
    @Country NVARCHAR(50)
AS
BEGIN
    INSERT INTO Customers (FirstName, LastName, City, Country)
    VALUES (@FirstName, @LastName, @City, @Country);
END;


GO

-- Example  to run this 
EXEC InsertCustomer 'saqib', 'Kazi', 'London', 'UK';
-- Example  to run this 


-- Step 4: Create Update Stored Procedure

CREATE PROCEDURE UpdateCustomer
    @CustomerID INT,
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @City NVARCHAR(50),
    @Country NVARCHAR(50)
AS
BEGIN
    UPDATE Customers
    SET FirstName = @FirstName,
        LastName = @LastName,
        City = @City,
        Country = @Country
    WHERE CustomerID = @CustomerID;
END;
GO
-- Example  to run this 
EXEC UpdateCustomer 1, 'dayan', 'sayed', 'Manchester', 'UK';
-- Example  to run this 


--Step 5: Create Delete Stored Procedure
CREATE PROCEDURE DeleteCustomer
    @CustomerID INT
AS
BEGIN
    DELETE FROM Customers
    WHERE CustomerID = @CustomerID;
END;
GO
-- Example  to run this 
EXEC DeleteCustomer 3;
-- Example  to run this 




--Step 6: Create Search (Select) Stored Procedure

CREATE PROCEDURE SearchCustomers
    @Keyword NVARCHAR(50)
AS
BEGIN
    SELECT * FROM Customers
    WHERE FirstName LIKE '%' + @Keyword + '%'
       OR LastName LIKE '%' + @Keyword + '%'
       OR City LIKE '%' + @Keyword + '%'
       OR Country LIKE '%' + @Keyword + '%';
END;
GO

-- Example  to run this 
EXEC SearchCustomers 'London';
-- Example  to run this



select * from Customers