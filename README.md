# Data Transformer

A SQL practice project demonstrating relational database design, joins, subqueries, date/string functions, window functions, and conditional logic using a simple e-commerce and HR data model.

## Overview

This repository contains a set of SQL scripts that build sample `Customers`, `Orders`, and `Employees` tables, populate them with sample data, and then run a series of queries covering common real-world SQL patterns — from basic joins to window functions and data transformation.

## Database Schema

### Customers
| Column | Type | Description |
|---|---|---|
| CustomerID | INT (PK) | Unique customer identifier |
| FirstName | VARCHAR(50) | Customer's first name |
| LastName | VARCHAR(50) | Customer's last name |
| Email | VARCHAR(100) | Customer's email address |
| RegistrationDate | DATE | Date the customer registered |

### Orders
| Column | Type | Description |
|---|---|---|
| OrderID | INT (PK) | Unique order identifier |
| CustomerID | INT (FK) | References `Customers.CustomerID` |
| OrderDate | DATE | Date the order was placed |
| TotalAmount | DECIMAL(10,2) | Total value of the order |

### Employees
| Column | Type | Description |
|---|---|---|
| EmployeeID | INT (PK) | Unique employee identifier |
| FirstName | VARCHAR(50) | Employee's first name |
| LastName | VARCHAR(50) | Employee's last name |
| Department | VARCHAR(50) | Department the employee belongs to |
| HireDate | DATE | Date the employee was hired |
| Salary | DECIMAL(10,2) | Employee's salary |

## What's Included

The main SQL file is organized into two parts:

1. **Schema & Sample Data** — `CREATE TABLE` and `INSERT` statements for all three tables, with 10 sample rows each.
2. **Query Library** — 17 queries grouped by concept:

| # | Query | Concept |
|---|---|---|
| 1 | Orders with customer details | `INNER JOIN` |
| 2 | All customers with their orders | `LEFT JOIN` |
| 3 | All orders with their customers | `RIGHT JOIN` |
| 4 | All customers and orders combined | `FULL OUTER JOIN` |
| 5 | Orders above the average order value | Correlated subquery |
| 6 | Employees earning above average salary | Subquery |
| 7 | Extract year and month from order date | `EXTRACT()` |
| 8 | Days between order date and today | Date arithmetic |
| 9 | Formatted order date | `TO_CHAR()` |
| 10 | Full customer name | `CONCAT()` |
| 11 | Replace text in a name | `REPLACE()` |
| 12 | Lowercase names | `LOWER()` |
| 13 | Trim whitespace from email | `TRIM()` |
| 14 | Running total of order amounts | Window function (`SUM() OVER`) |
| 15 | Rank orders by amount | Window function (`RANK() OVER`) |
| 16 | Discount tier by order value | `CASE` expression |
| 17 | Salary category by employee | `CASE` expression |

## Project Structure

```
Data-Tranformer/
├── Data_transformer.sql        # Schema, sample data, and all 17 queries
├── Data_transformer_outputs/   # Query results / output samples
└── README.md
```

## Getting Started

### Prerequisites
- A PostgreSQL-compatible database (queries use `EXTRACT`, `TO_CHAR`, and `CURRENT_DATE`, which are PostgreSQL/Oracle-style functions)

### Running the Scripts
1. Clone the repository:
   ```bash
   git clone https://github.com/vishakhamaisuriya17-hub/Data-Tranformer.git
   cd Data-Tranformer
   ```
2. Connect to your database (e.g., via `psql` or a GUI client like pgAdmin/DBeaver).
3. Run `Data_transformer.sql` top to bottom — it creates the tables, inserts sample data, and then runs each query in sequence.
4. Check `Data_transformer_outputs/` for sample results of each query.

> **Note:** If you're using MySQL or SQL Server, `FULL OUTER JOIN`, `EXTRACT`, and `TO_CHAR` will need minor syntax adjustments, since these are PostgreSQL/Oracle-specific.

## Purpose

This project was built as hands-on practice for core SQL skills — joins, subqueries, date and string manipulation, window functions, and conditional logic — using a realistic e-commerce/HR-style schema.

## License

This project is open source and available for learning purposes.
