-- Make database
CREATE DATABASE AIDG; 
-- Retrieve database
USE AIDG;
-- view tables
SHOW TABLES;
-- Supply table
CREATE TABLE Supply (
    Supply_ID INT PRIMARY KEY,
    Supply_Name VARCHAR(255),
    Category VARCHAR(255),
    Description TEXT,
    Stock_Level INT,
    Cost DECIMAL(10, 2)
);

-- Order Supplies table
CREATE TABLE Order_Supplies (
    Order_ID INT PRIMARY KEY,
    Order_Date DATE,
    Supply_ID INT,
    Quantity INT,
    Total_Cost DECIMAL(10, 2),
    FOREIGN KEY (Supply_ID) REFERENCES Supply(Supply_ID)
);

-- Customer table
CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    Name VARCHAR(255),
    Phone VARCHAR(255),
    Customer_cars VARCHAR(255),
    Payment DECIMAL(10, 2)
);

-- Suits/Programmers table
CREATE TABLE Suits_Programmers (
    P_ID INT PRIMARY KEY,
    AIDG_ID INT,
    Expenses DECIMAL(10, 2),
    Net_worth DECIMAL(10, 2),
    Role VARCHAR(255),
    FOREIGN KEY (AIDG_ID) REFERENCES AI_Detail_Guy(AIDG_ID)
);
-- AI Detail Guy table
CREATE TABLE AI_Detail_Guy (
    AIDG_ID INT PRIMARY KEY,
    Appointment_number INT,
    P_ID INT,
    Customer_cars VARCHAR(255),
    Quote DECIMAL(10, 2),
    FOREIGN KEY (Appointment_number) REFERENCES Appointment (Appointment_number),
    FOREIGN KEY (P_ID) REFERENCES Suits_Programmers(P_ID)
);
-- Appointment table
CREATE TABLE Appointment (
    Appointment_number INT PRIMARY KEY,
    Customer_ID INT,
    AIDG_ID INT,
    Schedule_date DATE,  -- Changed to Schedule_date
    Customer_cars VARCHAR(255),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (AIDG_ID) REFERENCES AI_Detail_Guy(AIDG_ID)
);

-- Detailers table
CREATE TABLE Detailers (
    Detailer_ID INT PRIMARY KEY,
    Appointment_number INT,
    ProsPay DECIMAL(10, 2),
    LowersPay DECIMAL(10, 2),
    TotalCars INT,
    FOREIGN KEY (Appointment_number) REFERENCES Appointment(Appointment_number)
);

-- Invoice table
CREATE TABLE Invoice (
    INV_ID INT PRIMARY KEY,
    Appointment_number INT,
    Customer_ID INT,
    Customer_cars VARCHAR(255),
    Payment DECIMAL(10, 2),
    Totals DECIMAL(10, 2),
    Expenses DECIMAL(10, 2),
    Quote DECIMAL(10, 2),
    FOREIGN KEY (Appointment_number) REFERENCES Appointment (Appointment_number),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);

-- Odd Detailer_IDs are ProsPay and even are LowersPay
-- Suits/Programmers table
INSERT INTO Suits_Programmers (P_ID, AIDG_ID, Expenses, Net_worth, Role)
VALUES (1, 0101, 500.00, 10000.00, 'Lead Programmer'),
       (2, 0102, 300.00, 8000.00, 'Junior Programmer'),
       (3, 0103, 200.00, 6000.00, 'AI Engineer'),
       (4, 0104, 150.00, 4000.00, 'Suits Manager'),
       (5, 0105, 100.00, 3000.00, 'Support Staff');

-- Supply table
INSERT INTO Supply (Supply_ID, Supply_Name, Category, Description, Stock_Level, Cost)
VALUES (1, 'Car Shampoo', 'Cleaning', 'High-quality car shampoo', 100, 15.00),
       (2, 'Microfiber Towels', 'Accessories', 'Soft microfiber towels', 200, 2.50),
       (3, 'Glass Cleaner', 'Cleaning', 'Streak-free glass cleaner', 150, 7.00),
       (4, 'Polish Wax', 'Polishing', 'Premium car wax', 75, 25.00),
       (5, 'Wheel Cleaner', 'Cleaning', 'Powerful wheel cleaner', 50, 12.00);

-- Order Supplies table
INSERT INTO Order_Supplies (Order_ID, Order_Date, Supply_ID, Quantity, Total_Cost)
VALUES (1, '2024-09-01', 1, 20, 300.00),
       (2, '2024-09-02', 2, 50, 125.00),
       (3, '2024-09-03', 3, 30, 210.00),
       (4, '2024-09-04', 4, 15, 375.00),
       (5, '2024-09-05', 5, 25, 300.00);

-- AI Detail Guy table
INSERT INTO AI_Detail_Guy (AIDG_ID, Appointment_number, P_ID, Customer_cars, Quote)
VALUES (0101, 1001, 1, 'Tesla Model 3', 250.00),
       (0102, 1002, 2, 'Ford Mustang', 200.00),
       (0103, 1003, 3, 'BMW X5', 300.00),
       (0104, 1004, 4, 'Chevrolet Camaro', 180.00),
       (0105, 1005, 5, 'Audi Q7', 220.00);

-- Customer table
INSERT INTO Customer (Customer_ID, Name, Phone, Customer_cars, Payment)
VALUES (1, 'John Doe', '555-1234', 'Tesla Model 3', 250.00),
       (2, 'Jane Smith', '555-5678', 'Ford Mustang', 200.00),
       (3, 'Emily Davis', '555-9012', 'BMW X5', 300.00),
       (4, 'Michael Brown', '555-3456', 'Chevrolet Camaro', 180.00),
       (5, 'Sarah Johnson', '555-7890', 'Audi Q7', 220.00);

-- Appointment table
INSERT INTO Appointment (Appointment_number, Customer_ID, AIDG_ID, Schedule_date, Customer_cars)
VALUES (1001, 1, 0101, '2024-10-01', 'Tesla Model 3'),
       (1002, 2, 0102, '2024-10-02', 'Ford Mustang'),
       (1003, 3, 0103, '2024-10-03', 'BMW X5'),
       (1004, 4, 0104, '2024-10-04', 'Chevrolet Camaro'),
       (1005, 5, 0105, '2024-10-05', 'Audi Q7');

-- Detailers table
INSERT INTO Detailers (Detailer_ID, Appointment_number, ProsPay, LowersPay, TotalCars)
VALUES (201, 1001, 110.00, NULL, 17),
       (202, 1002, NULL, 60.00, 13),
       (203, 1003, 100.00, NULL, 13),
       (204, 1004, NULL, 65.00, 13),
       (205, 1005, 100.00, NULL, 10);

-- Invoice table
INSERT INTO Invoice (INV_ID, Appointment_number, Customer_ID, Customer_cars, Payment, Totals, Expenses, Quote)
VALUES (301, 1001, 1, 'Tesla Model 3', 250.00, 310.00, 110.00, 250.00),
       (302, 1002, 2, 'Ford Mustang', 200.00, 260.00, 60.00, 200.00),
       (303, 1003, 3, 'BMW X5', 300.00, 400.00, 100.00, 300.00),
       (304, 1004, 4, 'Chevrolet Camaro', 180.00, 245.00, 65.00, 180.00),
       (305, 1005, 5, 'Audi Q7', 220.00, 320.00, 100.00, 220.00);
