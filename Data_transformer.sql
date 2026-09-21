
-- 1. CREATE CUSTOMERS TABLE

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    RegistrationDate DATE
);

INSERT INTO Customers VALUES
(1, 'John', 'Doe', 'john.doe@email.com', '2022-03-15'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '2021-11-02'),
(3, 'Rahul', 'Patel', 'rahul.patel@email.com', '2022-05-20'),
(4, 'Priya', 'Shah', 'priya.shah@email.com', '2023-01-10'),
(5, 'Amit', 'Joshi', 'amit.joshi@email.com', '2022-08-14'),
(6, 'Neha', 'Mehta', 'neha.mehta@email.com', '2023-03-25'),
(7, 'Raj', 'Desai', 'raj.desai@email.com', '2021-06-18'),
(8, 'Pooja', 'Patel', 'pooja.patel@email.com', '2023-07-05'),
(9, 'Karan', 'Shah', 'karan.shah@email.com', '2022-12-12'),
(10, 'Vishu', 'Mehta', 'vishu.mehta@email.com', '2024-01-20');

select * from Customers;

-- 2. CREATE ORDERS TABLE

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders VALUES
(101, 1, '2023-07-01', 150.50),
(102, 2, '2023-07-03', 200.75),
(103, 3, '2023-07-05', 550.00),
(104, 4, '2023-07-08', 1200.00),
(105, 5, '2023-07-10', 450.25),
(106, 6, '2023-07-12', 750.50),
(107, 7, '2023-07-15', 1800.00),
(108, 8, '2023-07-18', 325.75),
(109, 9, '2023-07-20', 950.00),
(110, 10, '2023-07-22', 2500.00);

select * from Orders;

-- 3. CREATE EMPLOYEES TABLE

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    HireDate DATE,
    Salary DECIMAL(10,2)
);

INSERT INTO Employees VALUES
(1, 'Mark', 'Johnson', 'Sales', '2020-01-15', 50000.00),
(2, 'Susan', 'Lee', 'HR', '2021-03-20', 55000.00),
(3, 'David', 'Brown', 'IT', '2019-07-10', 65000.00),
(4, 'Emily', 'Davis', 'Finance', '2022-02-18', 48000.00),
(5, 'James', 'Wilson', 'Sales', '2020-11-05', 60000.00),
(6, 'Sophia', 'Taylor', 'HR', '2023-01-12', 52000.00),
(7, 'Daniel', 'Anderson', 'IT', '2018-06-25', 75000.00),
(8, 'Olivia', 'Thomas', 'Finance', '2021-09-30', 58000.00),
(9, 'Michael', 'Moore', 'Sales', '2019-12-14', 70000.00),
(10, 'Emma', 'Martin', 'IT', '2022-08-22', 62000.00);

select * from Employees;

-- QUERY 1: INNER JOIN

SELECT
    o.OrderID,
    o.CustomerID,
    c.FirstName,
    c.LastName,
    c.Email,
    o.OrderDate,
    o.TotalAmount
FROM Orders o
INNER JOIN Customers c
ON o.CustomerID = c.CustomerID;


-- QUERY 2: LEFT JOIN

SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    c.Email,
    o.OrderID,
    o.OrderDate,
    o.TotalAmount
FROM Customers c
LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID;


-- QUERY 3: RIGHT JOIN

SELECT
    o.OrderID,
    o.OrderDate,
    o.TotalAmount,
    c.CustomerID,
    c.FirstName,
    c.LastName
FROM Customers c
RIGHT JOIN Orders o
ON c.CustomerID = o.CustomerID;


-- QUERY 4: FULL OUTER JOIN

SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    o.OrderID,
    o.OrderDate,
    o.TotalAmount
FROM Customers c
FULL OUTER JOIN Orders o
ON c.CustomerID = o.CustomerID;


-- QUERY 5: CUSTOMERS ABOVE AVERAGE ORDER

SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    o.OrderID,
    o.TotalAmount
FROM Customers c
JOIN Orders o
ON c.CustomerID = o.CustomerID
WHERE o.TotalAmount > (
    SELECT AVG(TotalAmount)
    FROM Orders
);


-- QUERY 6: EMPLOYEES ABOVE AVERAGE SALARY

SELECT
    EmployeeID,
    FirstName,
    LastName,
    Department,
    Salary
FROM Employees
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employees
);


-- QUERY 7: EXTRACT YEAR AND MONTH

SELECT
    OrderID,
    OrderDate,
    EXTRACT(YEAR FROM OrderDate) AS OrderYear,
    EXTRACT(MONTH FROM OrderDate) AS OrderMonth
FROM Orders;


-- QUERY 8: DAYS BETWEEN ORDER DATE AND CURRENT DATE

SELECT
    OrderID,
    OrderDate,
    CURRENT_DATE AS CurrentDate,
    CURRENT_DATE - OrderDate AS DaysDifference
FROM Orders;


-- QUERY 9: FORMAT ORDER DATE

SELECT
    OrderID,
    OrderDate,
    TO_CHAR(OrderDate, 'DD-Mon-YYYY') AS FormattedDate
FROM Orders;


-- QUERY 10: CONCATENATE FIRST NAME AND LAST NAME


SELECT
    CustomerID,
    CONCAT(FirstName, ' ', LastName) AS FullName
FROM Customers;


-- QUERY 11: REPLACE JOHN WITH JONATHAN

SELECT
    CustomerID,
    REPLACE(FirstName, 'John', 'Jonathan') AS UpdatedFirstName
FROM Customers;


-- QUERY 12: LOWERCASE

SELECT
    CustomerID,
    LOWER(FirstName) AS LowerFirstName,
    LOWER(LastName) AS LowerLastName
FROM Customers;


-- QUERY 13: TRIM EMAIL

SELECT
    CustomerID,
    Email,
    TRIM(Email) AS TrimmedEmail
FROM Customers;


-- QUERY 14: RUNNING TOTAL

SELECT
    OrderID,
    OrderDate,
    TotalAmount,
    SUM(TotalAmount) OVER (
        ORDER BY OrderDate, OrderID
    ) AS RunningTotal
FROM Orders;


-- QUERY 15: RANK ORDERS

SELECT
    OrderID,
    CustomerID,
    TotalAmount,
    RANK() OVER (
        ORDER BY TotalAmount DESC
    ) AS OrderRank
FROM Orders;


-- QUERY 16: DISCOUNT

SELECT
    OrderID,
    TotalAmount,
    CASE
        WHEN TotalAmount >= 1000 THEN '10% Off'
        WHEN TotalAmount >= 500 THEN '5% Off'
        ELSE 'No Discount'
    END AS Discount
FROM Orders;


-- QUERY 17: SALARY CATEGORY

SELECT
    EmployeeID,
    FirstName,
    LastName,
    Salary,
    CASE
        WHEN Salary >= 55000 THEN 'High'
        WHEN Salary >= 50000 THEN 'Medium'
        ELSE 'Low'
    END AS SalaryCategory
FROM Employees;