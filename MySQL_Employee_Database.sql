CREATE DATABASE IF NOT EXISTS Employee_db;
USE Employee_db;
CREATE TABLE IF NOT EXISTS Departments(
Department_ID INT PRIMARY KEY,
Department_name VARCHAR(100)
);
CREATE TABLE IF NOT EXISTS Location(
Location_ID INT PRIMARY KEY,
Location_name VARCHAR(30)
);
CREATE TABLE IF NOT EXISTS Employees(
Employee_ID INT PRIMARY KEY,
Employee_name VARCHAR(50),
Gender ENUM ('M','F'),
Age INT,
Hire_date DATE DEFAULT(CURRENT_DATE()),
Designation VARCHAR(100),
Salary DECIMAL(10,2),
Department_ID INT ,
Location_ID INT,
FOREIGN KEY (Department_ID) REFERENCES Departments(Department_ID),
FOREIGN KEY (Location_ID) REFERENCES Location(Location_ID)
);
ALTER TABLE Employees ADD COLUMN Email VARCHAR(100);
ALTER TABLE Employees MODIFY COLUMN Designation VARCHAR(150);
ALTER TABLE Employees DROP COLUMN Age;
ALTER TABLE Employees RENAME COLUMN Hire_date TO Date_of_joining;
RENAME TABLE Departments TO Departments_Info;
RENAME TABLE Location TO Locations;
TRUNCATE TABLE Employees;
DROP TABLE Employees;
DROP DATABASE Employee_db;

CREATE DATABASE Employee_db;
USE Employee_db;
CREATE TABLE Departments(
    Department_ID INT AUTO_INCREMENT PRIMARY KEY,
    Department_name VARCHAR(100) NOT NULL UNIQUE
);
CREATE TABLE Location(
    Location_ID INT AUTO_INCREMENT PRIMARY KEY,
    Location_name VARCHAR(30) NOT NULL UNIQUE
);
CREATE TABLE Employees(
    Employee_ID INT AUTO_INCREMENT PRIMARY KEY,
    Employee_name VARCHAR(50) NOT NULL,
    Gender ENUM('M','F'),
    Age INT CHECK (Age >= 18),
    Hire_date DATE DEFAULT (CURRENT_DATE()),
    Designation VARCHAR(100),
    Department_ID INT,
    Location_ID INT,
    Salary DECIMAL(10,2),
    FOREIGN KEY (Department_ID) REFERENCES Departments(Department_ID),
    FOREIGN KEY (Location_ID) REFERENCES Location(Location_ID)
);
