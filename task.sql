-- Create database and tables

CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE Products (
    ID INT,
    ProductName VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE Warehouses (
    ID INT,
    WarehouseName VARCHAR(50),
    WarehouseAddress VARCHAR(50),
    PRIMARY KEY (ID)
);


CREATE TABLE ProductInventory (
    ID INT,
    ProductID INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ID) ON DELETE CASCADE,
    WarehouseAmount INT,
    WarehouseID INT,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID) ON DELETE CASCADE,
    CountryID INT,
	FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);

-- Populate test data

INSERT INTO Countries (ID,Name)
	VALUES (1, 'Country1');
INSERT INTO Countries (ID,Name)
	VALUES (2, 'Country2');

INSERT INTO Products (ID,ProductName)
    VALUES (1, 'Product1');
INSERT INTO Products (ID,ProductName)
    VALUES (2, 'Product2');

INSERT INTO Warehouses (ID,WarehouseName,WarehouseAddress)
    VALUES (1, 'Warehouse1', 'Address1');

INSERT INTO Warehouses (ID,WarehouseName,WarehouseAddress)
    VALUES (2, 'Warehouse2', 'Address2');

INSERT INTO ProductInventory (ID,ProductID,WarehouseAmount,WarehouseID,CountryID)
	VALUES (1, 1, 2, 1, 1);
INSERT INTO ProductInventory (ID,ProductID,WarehouseAmount,WarehouseID,CountryID)
	VALUES (2, 1, 5, 2, 2);
