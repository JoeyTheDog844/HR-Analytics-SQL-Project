-- Create Departments table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

-- Create Employees table
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    DepartmentID INT,
    Salary FLOAT
);

-- Create Attendance table
CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY,
    EmpID INT,
    Date DATE,
    Status VARCHAR(10)
);

INSERT INTO Departments VALUES
(1, 'Engineering'),
(2, 'Marketing'),
(3, 'HR');

INSERT INTO Employees VALUES
(101, 'Amaan', 22, 1, 60000),
(102, 'Sarah', 30, 2, 55000),
(103, 'Kenji', 27, 1, 65000),
(104, 'Priya', 35, 3, 50000),
(105, 'Lucas', 26, 2, 58000);

-- Attendance for 2025-03-30
INSERT INTO Attendance VALUES
(1, 101, '2025-03-30', 'Present'),
(2, 102, '2025-03-30', 'Absent'),
(3, 103, '2025-03-30', 'Present'),
(4, 104, '2025-03-30', 'Leave'),
(5, 105, '2025-03-30', 'Present'),
(6, 101, '2025-03-31', 'Absent'),
(7, 102, '2025-03-31', 'Present'),
(8, 103, '2025-03-31', 'Present'); 

SELECT Employees.Name, Departments.DepartmentName
FROM Employees
JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;

SELECT Departments.DepartmentName, AVG(Employees.Salary) AS AvgSalary
FROM Employees
JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID
GROUP BY Departments.DepartmentName;

SELECT Departments.DepartmentName, COUNT(*) AS NumEmployees
FROM Employees
JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID
GROUP BY Departments.DepartmentName;

SELECT Employees.Name
FROM Employees
JOIN Attendance ON Employees.EmpID = Attendance.EmpID
WHERE Attendance.Date = '2025-03-30'
  AND Attendance.Status = 'Present';

SELECT Date, COUNT(*) AS NumPresent
FROM Attendance
WHERE Status = 'Present'
GROUP BY Date;

SELECT Departments.DepartmentName, COUNT(*) AS NumPresent
FROM Employees
JOIN Attendance ON Employees.EmpID = Attendance.EmpID
JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID
WHERE Attendance.Date = '2025-03-30'
  AND Attendance.Status = 'Present'
GROUP BY Departments.DepartmentName;

