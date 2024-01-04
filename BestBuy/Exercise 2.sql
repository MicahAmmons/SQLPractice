/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */

SELECT p.Name, c.Name AS Category FROM bestbuy.products p
INNER JOIN bestbuy.categories c
ON p.CategoryID = c.CategoryID 
WHERE c.Name = 'Computers';
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 SELECT 
 p.Name,
 p.Price,
 r.Rating
 FROM bestbuy.products p
 INNER JOIN bestbuy.reviews r
 ON p.ProductID = r.ProductID
 WHERE r.Rating = 5;

/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT 
e.LastName,
SUM(s.quantity) AS quantity
FROM bestbuy.employees e
INNER JOIN bestbuy.sales s 
ON e.EmployeeID = s.EmployeeID
GROUP BY e.EmployeeID
ORDER BY quantity DESC
LIMIT 2;
-- HAVING quantity = MAX(quantity)



/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT 
d.Name,
c.Name
FROM bestbuy.departments d
INNER JOIN bestbuy.categories c
ON d.DepartmentID = c.DepartmentID
WHERE c.Name = 'Appliances' OR c.Name = 'Games';
 
/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT
p.Name,
SUM(s.PricePerUnit) AS Price,
SUM(s.Quantity) AS Quantity
FROM
bestbuy.products AS p
INNER JOIN
bestbuy.sales AS s
ON
p.ProductID = s.ProductID
WHERE
p.Name = 'Eagles: Hotel California'
GROUP BY
p.Name;


/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT
p.Name AS ProductName,
r.Reviewer AS ReviewerName,
r.Rating,
r.Comment
FROM bestbuy.products p 
INNER JOIN bestbuy.reviews r
ON p.ProductID = r.ProductID
WHERE p.Name = 'Visio TV'
ORDER BY r.Rating 
LIMIT 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
SELECT
e.EmployeeID,
e.LastName,
e.FirstName,
s.ProductID AS ProductID,
s.Quantity,
p.Name AS ProductName
FROM bestbuy.employees e
INNER JOIN bestbuy.sales s 
ON e.EmployeeID = s.EmployeeID
INNER JOIN bestbuy.products p 
ON s.ProductID = p.ProductID;





