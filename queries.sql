-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

SELECT p.ProductName, c.CategoryName FROM Product p INNER JOIN Category c on p.CategoryId = c.Id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

SELECT o.Id, s.CompanyName, o.OrderDate FROM "Order" as o JOIN Shipper as s ON o.ShipVia = s.Id WHERE o.OrderDate < '2012-08-09';

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

SELECT o.OrderId, o.Quantity, p.ProductName FROM "OrderDetail" as o JOIN "Product" as p ON o.ProductId = p.Id Where "OrderId" = 10251 ORDER BY "p.ProductName";

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

SELECT o.Id as "Order Id", c.CompanyName, e.LastName as "Employee Last Name"
From "Order" as o
JOIN Customer as c
JOIN Employee as e
on o.CustomerId = c.Id AND o.EmployeeId = e.Id;
