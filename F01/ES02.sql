-- Ejercicios:

USE classicmodels;
-- Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyo nombre empiece con a.
SELECT employeeNumber, lastName, firstName
FROM employees
WHERE firstName LIKE 'a%';
-- Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyo nombre termina con on.
SELECT employeeNumber, lastName, firstName
FROM employees
WHERE firstName LIKE '%on';
-- Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyo nombre incluye la cadena on.
SELECT employeeNumber, lastName, firstName
FROM employees
WHERE firstName LIKE '%on%';
-- Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyos nombres tienen tres letras e inician con T y finalizan con m.
SELECT employeeNumber, lastName, firstName
FROM employees
WHERE firstName LIKE 'T_m';
-- Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyo nombre no inicia con B.
SELECT employeeNumber, lastName, firstName
FROM employees
WHERE firstName NOT LIKE 'B%';
-- Dentro de la tabla products, obten el código de producto y nombre de los productos cuyo código incluye la cadena _20. **
SELECT productCode, productName
FROM products
WHERE productCode LIKE '%_20%';
-- Dentro de la tabla orderdetails, obten el total de cada orden.
SELECT orderNumber, SUM(quantityOrdered*priceEach) AS total
FROM orderdetails
GROUP BY orderNumber;
-- Dentro de la tabla orders obten el número de órdenes por año.
SELECT YEAR(orderDate) AS ano, COUNT(*) AS ordenes
FROM orders
GROUP BY YEAR(orderDate);
-- Obten el apellido y nombre de los empleados cuya oficina está ubicada en USA.**s
SELECT lastName, firstName
FROM employees
WHERE officeCode IN 
	(SELECT officeCode 
    FROM offices 
    WHERE country = 'USA');
-- Obten el número de cliente, número de cheque y cantidad del cliente que ha realizado el pago más alto.
SELECT customerNumber, checkNumber, amount
FROM payments
ORDER BY amount DESC
LIMIT 1;
-- Obten el número de cliente, número de cheque y cantidad de aquellos clientes cuyo pago es más alto que el promedio.
SELECT customerNumber, checkNumber, amount
FROM payments
WHERE amount > 
	(SELECT AVG(amount) 
    FROM payments );
-- Obten el nombre de aquellos clientes que no han hecho ninguna orden.
SELECT customerName
FROM customers
WHERE customerNumber 
NOT IN 
	(SELECT customerNumber
    FROM orders);
-- Obten el máximo, mínimo y promedio del número de productos en las órdenes de venta.***
SELECT MAX(no_productos) AS max, MIN(no_productos) AS min, AVG(no_productos) as promedio
FROM 
	(SELECT productCode, COUNT(*) AS no_productos
	FROM orderdetails
	GROUP BY productCode) AS p1;
-- Dentro de la tabla orders, obten el número de órdenes que hay por cada estado.***
SELECT state, COUNT(*) AS no_ordenes
FROM customers
WHERE customerNumber
IN
	(SELECT customerNumber
    FROM orders)
GROUP BY state;