-- trigger Example
drop database tri
create database tri;
use tri

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name NVARCHAR(100)
);

CREATE TABLE EmployeeLog (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeID INT,
    LogTime DATETIME
);


CREATE TRIGGER LogInsert
ON Employees
AFTER INSERT
AS
BEGIN
    INSERT INTO EmployeeLog(EmployeeID, LogTime)
    SELECT EmployeeID, GETDATE() FROM inserted;
END;


INSERT INTO Employees (EmployeeID, Name)
VALUES (2, 'Affan');


SELECT * FROM EmployeeLog;


