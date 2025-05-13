CREATE DATABASE `WillyWonkaFactoryDB`;

USE WillyWonkaFactoryDB;

CREATE TABLE Ingredients (
    ingredient_id INT PRIMARY KEY,
    ingredient_name VARCHAR(50),
    quantity INT
    );
    
CREATE TABLE ChocolateProducts (
	product_id INT PRIMARY KEY,
	product_name VARCHAR(50),
	packing_id INT
	);
    
CREATE TABLE Offer (
	StartDate  DATE CHECK (StartDate >= '2024-01-01'),
	DiscountPercentage INT ,
	EndDate DATE,
	PID INT,
	CONSTRAINT fk_ChocolateProducts
	FOREIGN KEY (PID)
	REFERENCES ChocolateProducts(product_id),
	PRIMARY KEY(StartDate,PID)
	);
CREATE TABLE Company (
	CompanyID INT PRIMARY KEY,
	ContactPerson VARCHAR(50),
	Name VARCHAR(50),
	AnnualProfit DECIMAL (3, 1),
	Address VARCHAR(50),
	ContactNumber INT
	);
CREATE TABLE Employee(
	EmployeeID INT PRIMARY KEY,
	fName VARCHAR(20),
	lName VARCHAR(20),
	PhoneNumber INT,
	Salary DECIMAL (7,2),
	Position VARCHAR(10)
	);
CREATE TABLE Choco_Flavors (
	CPflavor VARCHAR(50),
	Product_ID INT ,
	CONSTRAINT fk_Chocolate_Product
	FOREIGN KEY (Product_ID)
	REFERENCES ChocolateProducts(product_id),
	PRIMARY KEY(CPflavor,Product_ID)
	);
CREATE TABLE Used (
	Iid INT,
	Pid INT,
	CONSTRAINT fk_ingredient
	FOREIGN KEY (Iid)
	REFERENCES Ingredients(ingredient_id),
	CONSTRAINT fk_CProduct
	FOREIGN KEY (Pid)
	REFERENCES ChocolateProducts(product_id),
	PRIMARY KEY(Iid,Pid)
	);
CREATE TABLE Receives (
	Pid INT,
	Cid INT,
	CONSTRAINT fk_ChocProduct
	FOREIGN KEY (Pid)
	REFERENCES ChocolateProducts(product_id),
	CONSTRAINT fk_company
	FOREIGN KEY (Cid)
	REFERENCES Company(CompanyID),
	PRIMARY KEY(Pid,Cid)
	);
CREATE TABLE Deliver(
	Eid INT,
	Cid INT,
	CONSTRAINT fk_employee
	FOREIGN KEY (Eid)
	REFERENCES Employee(EmployeeID),
	CONSTRAINT fk_CompanyD
	FOREIGN KEY (Cid)
	REFERENCES Company(CompanyID),
	PRIMARY KEY(Eid,Cid)
	);
CREATE TABLE Associate(
	Pid INT,
	Eid INT,
	CONSTRAINT fk_ChocProductAS
	FOREIGN KEY (Pid)
	REFERENCES ChocolateProducts(product_id),
	CONSTRAINT fk_employeeAS
	FOREIGN KEY (Eid)
	REFERENCES Employee(EmployeeID),
	PRIMARY KEY(Pid,Eid)
	);

INSERT INTO Ingredients(ingredient_id, ingredient_name, quantity)
VALUES(1,'Cocoa Powder',100),
(2,'Sugar',200),
(3,'Milk',150),
(4,'Vanilla Extract',50),(5,'Cocoa Butter',300);

INSERT INTO ChocolateProducts(product_id, product_name, packing_id)
VALUES(1,'Darck Chocolate Bar',1001),
(2,'Milk Chocolate Bar',1001),
(3,'White Chocolate Bar',1001),
(4,'Assorted Chocolates',1002),
(5,'Chocolate Spread',1003);

INSERT INTO Used (Iid, Pid)
VALUES(1,1),(2,1),(2,2),(3,2),(4,3),(1,4),(2,4),(3,4),(4,4),(1,5),(2,5),(3,5);

INSERT INTO choco_flavors (Product_ID, CPflavor)
VALUES(1, 'Dark'),
(2, 'Milk'),
(3, 'White'),
(4, 'Assorted'),
(5, 'Hazelnut');

INSERT INTO Employee (EmployeeID, fName, lName, PhoneNumber, Salary, Position)
VALUES(1, 'Jhon', 'Doe', '0555548917', '2500.00', 'Production'),
(2, 'Jane', 'Smith', '059099034', '4300.00', 'Deliver'),
(3, 'Retal', 'Malki', '0558906427', '5000.00', 'Manager'),
(4, 'Jennifer', 'Furman', '0542219078', '3800.00', 'Production'),
(5, 'Andy', 'Chou', '0573438678', '4800.00', 'Supervisor');

INSERT INTO Associate (Pid,Eid)
VALUES(1, 4), (2, 1), (3, 3), (4, 5), (5, 2), (2, 5), (4,3);

INSERT INTO Company (CompanyID, ContactPerson, Name, AnnualProfit, Address, ContactNumber)
VALUES (1, 'Malek', 'Velvet Truffles', 27.0, '123 Main Street', '0555531471'),
    (2, 'Ahmed', 'Cocoa Couture', 35.0, '456 Elm Street', '0555537487'),
    (3, 'Tala', 'Cocoa Haven', 17.0, '789 Oak Street', '0555576163'),
    (4, 'Omar', 'Cocoa Kingdom', 12.0, '123 Main Street', '0506080922'),
    (5, 'Shatha', 'Chocolate Breeze', 19.0, '456 Elm Street', '0555576164');

INSERT INTO Receives (Pid, Cid)
VALUES (1, 4), (2, 1), (3, 3), (4, 5), (5, 2), (2, 5), (4,3);

INSERT INTO Offer (StartDate, DiscountPercentage, EndDate, PID)
VALUES 
    ('2024-02-22', 30, '2024-02-27', 1), -- Offer for Dark Chocolate Bar
    ('2024-09-23', 50, '2024-09-28', 2), -- Offer for Milk Chocolate Bar
    ('2024-11-29', 20, '2024-12-03', 3), -- Offer for White Chocolate Bar
    ('2024-02-14', 22, '2024-02-19', 4), -- Offer for Assorted Chocolates
    ('2024-12-26', 25, '2024-12-31', 5);   -- Offer for Chocolate Spread
    
INSERT INTO Deliver (Eid, Cid)
VALUES (4,3), 
(4, 5), 
(3, 3), 
(2, 1), 
(5, 2), 
(2, 5), 
(1, 4);

SELECT ingredient_name FROM Ingredients;

SELECT *
FROM Employee 
WHERE fName ='Retal';

SELECT product_name
FROM ChocolateProducts 
WHERE product_id =2;

UPDATE Ingredients
SET quantity=120
WHERE ingredient_id=1;

UPDATE Company
SET Name='R5KM'
WHERE AnnualProfit=35.0;

DELETE FROM Used
WHERE Iid AND Pid =1;

DELETE FROM Deliver
WHERE Eid =1;

SELECT	product_name, packing_id
FROM	chocolateproducts
ORDER BY product_name ASC;

SELECT	* 
FROM	employee
ORDER BY Salary DESC;

SELECT	Position, COUNT(EmployeeID) AS count, SUM(Salary) AS sum
FROM	employee
GROUP BY Position
HAVING	COUNT(EmployeeID) > 1;

SELECT		cf.CPflavor, COUNT(*) AS product_count
FROM		choco_flavors cf
JOIN		chocolateproducts p ON cf.Product_ID = p.product_id
GROUP BY	cf.CPflavor;


SELECT product_name
FROM ChocolateProducts
WHERE product_id IN (SELECT PID FROM Offer WHERE EndDate >= CURDATE());


SELECT 
    c.ContactPerson AS Company_Contact,
    (
        SELECT COUNT(*)
        FROM Deliver d
        WHERE d.Cid = c.CompanyID
    ) AS delivery_count
FROM 
    Company c;


SELECT i.ingredient_name, cp.product_name
FROM Ingredients i
JOIN Used u ON i.ingredient_id = u.Iid
JOIN ChocolateProducts cp ON u.Pid = cp.product_id;

SELECT c.Name AS Company, cp.product_name
FROM Company c
JOIN Receives r ON c.CompanyID = r.Cid
JOIN ChocolateProducts cp ON r.Pid = cp.product_id;
