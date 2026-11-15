# 🗄️ MySQL Employee Database
### DDL Commands • Constraints • Relational Database Design

A hands-on MySQL project showcasing the creation, modification, and management of an Employee Database using essential DDL commands and data integrity constraints.

---

## 📌 Project Overview

Organizations need a structured way to maintain employee information and connect it with departments and work locations. This project builds an `Employee_db` database in MySQL to manage these records through a relational structure.

The assignment demonstrates the complete database definition workflow — from creating databases and tables to altering schemas, renaming tables, truncating records, and applying constraints to maintain data consistency.

| Project Detail | Description |
|---|---|
| **Project** | MySQL Employee Database |
| **Assignment** | DDL Commands & Constraints |
| **Database** | `Employee_db` |
| **Tool** | MySQL Workbench |
| **Version** | MySQL 8.0 |
| **Language** | SQL |

## 🎯 Project Objectives

- Design a relational database for employees, departments, and locations.
- Create databases and tables using `CREATE`.
- Modify table structures using `ALTER`.
- Rename tables using `RENAME`.
- Remove table records using `TRUNCATE`.
- Delete database objects using `DROP`.
- Apply primary keys, foreign keys, and data integrity constraints.
- Understand how constraints help maintain accurate and consistent data.

## 🧩 Relationship Schema

![Employee Database Relationship Schema](images/relationship-schema.png)

The database contains three tables: `Departments`, `Location`, and `Employees`.

- One department can be associated with multiple employees.
- One location can be associated with multiple employees.
- Each employee record can reference a department and a location through foreign keys.

## 🗂️ Database Structure

### 1. Departments

| Column | Data Type | Description |
|---|---|---|
| `Department_ID` | `INT` | Primary Key |
| `Department_name` | `VARCHAR(100)` | Department name |

### 2. Location

| Column | Data Type | Description |
|---|---|---|
| `Location_ID` | `INT` | Primary Key |
| `Location_name` | `VARCHAR(30)` | Location name |

### 3. Employees

| Column | Data Type | Description |
|---|---|---|
| `Employee_ID` | `INT` | Primary Key |
| `Employee_name` | `VARCHAR(50)` | Employee name |
| `Gender` | `ENUM('M','F')` | Gender |
| `Age` | `INT` | Employee age |
| `Hire_date` | `DATE` | Date of hiring |
| `Designation` | `VARCHAR(100)` | Job designation |
| `Salary` | `DECIMAL(10,2)` | Employee salary |
| `Department_ID` | `INT` | Foreign Key → `Departments(Department_ID)` |
| `Location_ID` | `INT` | Foreign Key → `Location(Location_ID)` |

---

## ⚙️ Part 1 — DDL Commands

This section demonstrates the five core DDL commands used to define and manage database structures.

### 1. CREATE — Create the database and tables

```sql
CREATE DATABASE IF NOT EXISTS Employee_db;
USE Employee_db;

CREATE TABLE Departments (
    Department_ID INT PRIMARY KEY,
    Department_name VARCHAR(100)
);

CREATE TABLE Location (
    Location_ID INT PRIMARY KEY,
    Location_name VARCHAR(30)
);

CREATE TABLE Employees (
    Employee_ID INT PRIMARY KEY,
    Employee_name VARCHAR(50),
    Gender ENUM('M','F'),
    Age INT,
    Hire_date DATE DEFAULT (CURRENT_DATE()),
    Designation VARCHAR(100),
    Salary DECIMAL(10,2),
    Department_ID INT,
    Location_ID INT,
    FOREIGN KEY (Department_ID)
        REFERENCES Departments(Department_ID),
    FOREIGN KEY (Location_ID)
        REFERENCES Location(Location_ID)
);
```

### 2. ALTER — Modify the Employees table

The following changes were made to the `Employees` table:

```sql
-- Add an Email column
ALTER TABLE Employees
ADD COLUMN Email VARCHAR(100);

-- Increase the Designation column size
ALTER TABLE Employees
MODIFY COLUMN Designation VARCHAR(150);

-- Remove the Age column
ALTER TABLE Employees
DROP COLUMN Age;

-- Rename Hire_date to Date_of_joining
ALTER TABLE Employees
RENAME COLUMN Hire_date TO Date_of_joining;
```

### 3. RENAME — Rename the tables

```sql
RENAME TABLE Departments TO Departments_Info;
RENAME TABLE Location TO Locations;
```

### 4. TRUNCATE — Remove all employee records

```sql
TRUNCATE TABLE Employees;
```

This removes all rows while retaining the table structure.

### 5. DROP — Remove database objects

```sql
DROP TABLE Employees;
DROP DATABASE Employee_db;
```

---

## 🔒 Part 2 — Constraints & Database Recreation

After completing the DDL operations, the database is recreated with additional constraints to improve data integrity.

```sql
DROP DATABASE IF EXISTS Employee_db;
CREATE DATABASE Employee_db;
USE Employee_db;

CREATE TABLE Departments (
    Department_ID INT AUTO_INCREMENT PRIMARY KEY,
    Department_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Location (
    Location_ID INT AUTO_INCREMENT PRIMARY KEY,
    Location_name VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE Employees (
    Employee_ID INT AUTO_INCREMENT PRIMARY KEY,
    Employee_name VARCHAR(50) NOT NULL,
    Gender ENUM('M','F'),
    Age INT CHECK (Age >= 18),
    Hire_date DATE DEFAULT (CURRENT_DATE()),
    Designation VARCHAR(100),
    Department_ID INT,
    Location_ID INT,
    Salary DECIMAL(10,2),
    FOREIGN KEY (Department_ID)
        REFERENCES Departments(Department_ID),
    FOREIGN KEY (Location_ID)
        REFERENCES Location(Location_ID)
);
```

### 🛡️ Constraints Applied

| Requirement | Constraint | Purpose |
|---|---|---|
| Unique department identifier | `PRIMARY KEY` | Identifies each department uniquely. |
| Department name must be present and unique | `NOT NULL UNIQUE` | Prevents missing and duplicate department names. |
| Automatically generated department and location IDs | `AUTO_INCREMENT` | Generates ID values automatically. |
| Location name must be present and unique | `NOT NULL UNIQUE` | Prevents missing and duplicate location names. |
| Unique employee identifier | `PRIMARY KEY` | Identifies each employee uniquely. |
| Employee name is mandatory | `NOT NULL` | Ensures every employee has a name. |
| Gender restricted to M or F | `ENUM('M','F')` | Limits the accepted values. |
| Employee age must be 18 or above | `CHECK (Age >= 18)` | Enforces the age condition. |
| Hire date defaults to the current date | `DEFAULT (CURRENT_DATE())` | Supplies a date when one is not specified. |
| Employee linked to a valid department and location | `FOREIGN KEY` | Maintains relationships between tables. |

## 🧠 Key Learnings

Through this project, I gained practical experience in:

- Creating and managing relational databases in MySQL.
- Understanding the purpose and application of DDL commands.
- Modifying existing table structures with `ALTER TABLE`.
- Establishing table relationships using primary and foreign keys.
- Applying constraints to improve data integrity.
- Understanding the differences between `TRUNCATE`, `DROP TABLE`, and `DROP DATABASE`.
- Organizing employee information through a relational database structure.

## 🛠️ Skills Demonstrated

`MySQL` · `SQL` · `DDL Commands` · `CREATE` · `ALTER` · `RENAME` · `TRUNCATE` · `DROP` · `Primary Key` · `Foreign Key` · `Constraints` · `Relational Database Design`

## 📁 Repository Structure

```text
mysql-employee-database/
│
├── Employee_Database_Monisha.sql
├── Employee_Database_Monisha.pdf
├── images/
│   └── relationship-schema.png
└── README.md
```

## ▶️ How to Run the Project

1. Install and open **MySQL Workbench**.
2. Connect to your local MySQL Server instance.
3. Open `Employee_Database_Monisha.sql`.
4. Execute the statements section by section:
   - First, run **Part 1 — DDL Commands**.
   - Then, run **Part 2 — Constraints & Database Recreation**.
5. Verify the database and tables using:

```sql
SHOW DATABASES;
USE Employee_db;
SHOW TABLES;
DESCRIBE Employees;
SHOW CREATE TABLE Employees;
```

> **Note:** The script includes `DROP` statements that delete database objects. Run it in a practice environment and make sure you do not need any existing data before executing those statements.

---

## 👨‍💻 About Me

I am an aspiring **Data Analyst** building my portfolio through hands-on projects in SQL, data analysis, and business intelligence.

My journey is focused on developing strong analytical and technical skills, understanding how data is structured, and learning how to transform raw information into meaningful insights.

I enjoy exploring new tools, solving problems, and applying what I learn through practical projects. This MySQL project is one of the steps in strengthening my database and SQL fundamentals.

**Learning by doing. Growing with every query. Building towards a career in Data Analytics.** 🚀

Thank you for visiting my project!

Feel free to explore the repository and share your feedback.

⭐ If you find this project useful, consider giving the repository a star!

