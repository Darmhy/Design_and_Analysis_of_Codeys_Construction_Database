-- Knowledge questions for 

-- Questions 1/8
/*Write a single query to pull data for Ubaldo Predovic and Tess Hermiston. The column names should be "Employee ID", "First Name", "Last Name", and "Hours".*/

SELECT pe.employee_id AS "Employee ID",
       first_name AS "First Name",
       last_name AS "Last Name",
       hours AS "Hours"
FROM   employees ee
       JOIN project_employees pe
         ON ee.id = pe.employee_id
WHERE last_name IN ('Predovic', 'Hermiston')

-- Questions 2/8 (1)
/*Codey wants to know the number of employees who have an hourly wage of greater than or equal to $50.00/hr. Write a query to figure this out.*/
SELECT COUNT(DISTINCT id) 
FROM employees
WHERE hourly_wage >= 50.0


-- Questions 2/8 (2)
/*Find the sum of the price of all job orders placed after '2018-01-01 00:00:00'.*/
SELECT SUM(price) 
FROM   job_orders 
WHERE  order_datetime > '2018-01-01 00:00:00'

-- Questions 2/8 (3)
/*Find the average number of hours worked on the Washington Avenue Barber project.*/

SELECT AVG(hours)
FROM  projects pj
      JOIN project_employees pe
        ON pj.id = pe.project_id
WHERE name like '%Washington Avenue Barber%' /*Using Like*/

SELECT AVG(hours) 
FROM   projects p 
       JOIN project_employees pe 
         ON p.id = pe.project_id 
WHERE  name = "Washington Avenue Barber" 


-- Questions 2/8 (4)
/*When was Codey’s Construction’s first employee hired?*/
SELECT MIN(hire_date) 
FROM   employees

-- Questions 2/8 (5)
/*When was Codey’s Construction’s latest employee hired?*/
SELECT MAX(hire_date) 
FROM   employees


-- Questions 3/8
/* Codey would like you to find out the cost of all job orders for each project. Write a query to return for each project:
- The project's name as "Project Name"
- The sum of quantity for all job orders as "Job Order Quantity"
- The sum of price for all job orders as "Job Order Price", and
- The cost of all job orders as "Cost".
To create the cost column, use the arithmetic operator * to multiply the sum of quantity by the sum of price.*/

SELECT p.name AS 'Project Name',
       SUM(jo.quantity) AS  "Job Order Quantity",
       SUM(jo.price) AS "Job Order Price",
       (SUM(jo.quantity)* SUM(jo.price)) AS "Cost"
FROM projects p
JOIN job_orders jo ON p.id = jo.project_id
JOIN employees e ON e.id = jo.employee_id
GROUP  BY p.name


-- Question 4/8
/*For these two projects, Central Valley Hospital project and Big Money Bank project, return:
- The project's name, as "Project Name"
- The first name and last name of employees who worked on the project, as "First Name" and "Last Name", and
- Their total spending (i.e. the cost of their job orders), as "Spending".
Filter your results to employees who spent over $10,000,000 on either project, and order your results by highest cost to lowest.*/

SELECT pt.name AS "Project Name",
       ep.first_name AS "First Name",
       ep.last_name AS "Last Name",
       (SUM(jr.quantity)* SUM(jr.price)) AS 'Spending'
FROM projects pt
JOIN job_orders jr ON pt.id = jr.project_id
JOIN employees ep ON ep.id = jr.employee_id
WHERE pt.name IN ('Central Valley Hospital ','Big Money Bank')
GROUP  BY 1,
          2,
          3
HAVING (SUM(jr.quantity)* SUM(jr.price)) > 10000000 
ORDER BY 4 DESC;


-- Question 5/8 (1)
/*For ALL employees, write a query with a RIGHT JOIN that returns their ID, first name, last name, and sum of hours (this column should show ‘0.00’ for the three employees with no value in hours). Give your columns aliases ("ID", "First Name", "Last Name", "Hours").*/

SELECT e.id AS "ID",
       e.first_name AS "First Name",
       e.last_name AS "Last Name",
       COALESCE(SUM(hours), 0) AS "Hours"
FROM project_employees pe
      RIGHT JOIN employees e ON e.id = pe.employee_id
GROUP  BY e.id


-- Question 5/8 (2)
/*For ALL employees, write a query with a LEFT JOIN that returns their ID, first name, last name, and sum of hours (this column should show ‘0.00’ for the three employees with no value in hours). Give your columns aliases ("ID", "First Name", "Last Name", "Hours").*/
SELECT e.id AS "ID",
       e.first_name AS "First Name",
       e.last_name AS "Last Name",
       COALESCE(SUM(hours), 0) AS "Hours"
FROM  employees e 
      LEFT JOIN project_employees pe ON pe.employee_id = e.id
GROUP  BY e.id


-- Question 5/8 (3)
/*For only employees with hours, write a query with a RIGHT JOIN that returns their ID, first name, last name, and sum of hours. Give your columns aliases ("ID", "First Name", "Last Name", "Hours").*/
SELECT e.id AS "ID",
       e.first_name AS "First Name",
       e.last_name AS "Last Name",
       COALESCE(SUM(hours), 0) AS Hours
FROM project_employees pe
      RIGHT JOIN employees e ON e.id = pe.employee_id
GROUP  BY e.id
HAVING Hours > 0

-- Question 5/8 (4)
/*For only employees with hours, write a query with a LEFT JOIN that returns their ID, first name, last name, and sum of hours. Give your columns aliases ("ID", "First Name", "Last Name", "Hours").*/
SELECT e.id AS "ID",
       e.first_name AS "First Name",
       e.last_name AS "Last Name",
       COALESCE(SUM(hours), 0) AS Hours
FROM  employees e 
      LEFT JOIN project_employees pe ON pe.employee_id = e.id
GROUP  BY e.id
HAVING Hours > 0


