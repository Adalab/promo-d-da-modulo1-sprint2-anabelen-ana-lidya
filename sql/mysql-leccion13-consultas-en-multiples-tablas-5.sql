

/* 1. Extraed los pedidos con el máximo "order_date" para cada empleado.
Nuestro jefe quiere saber la fecha de los pedidos más recientes que ha gestionado cada empleado. Para eso nos pide que lo hagamos con una query correlacionada.*/

SELECT order_id, order_date, employee_id
	FROM orders AS t1
	WHERE order_date = (SELECT MAX(order_date)
						FROM orders AS t2
						WHERE t1.employee_id = t2.employee_id);
					
                                                
/* 2. Extraed el precio unitario máximo (unit_price) de cada producto vendido.
Supongamos que ahora nuestro jefe quiere un informe de los productos vendidos y su precio unitario. De nuevo lo tendréis que hacer con queries correlacionadas.*/

SELECT DISTINCT product_id, unit_price AS Max_unit_price_sold
	FROM order_details AS t1
	WHERE unit_price = (SELECT MAX(unit_price)
						FROM order_details AS t2
        	            WHERE t1.product_id = t2.product_id);
						

/* 3. Ciudades que empiezan con "A" o "B".
Por un extraño motivo, nuestro jefe quiere que le devolvamos una tabla con aquelas compañias 
que están afincadas en ciudades que empiezan por "A" o "B". Necesita que le devolvamos la ciudad,
el nombre de la compañia y el nombre de contacto.*/

SELECT city, company_name, contact_name
	FROM customers
	WHERE city LIKE 'A%' OR city LIKE 'B%';


/* 4. Número de pedidos que han hecho en las ciudades que empiezan con L.
En este caso, nuestro objetivo es devolver los mismos campos que en la query anterior el número de total de pedidos que han hecho todas las ciudades que empiezan por "L".*/

SELECT city, company_name, contact_name, COUNT(order_id)
	FROM customers
	INNER JOIN orders
	ON customers.customer_id = orders.customer_id
	WHERE city LIKE 'L%'
	GROUP BY city, company_name, contact_name;


/* 5. Todos los clientes cuyo "contact_title" no incluya "Sales".
Nuestro objetivo es extraer los clientes que no tienen el contacto "Sales" en su "contact_title". Extraer el nombre de contacto, su posición (contact_title) y el nombre de la compañia.*/

SELECT contact_name, contact_title, company_name
	FROM customers
	WHERE contact_title NOT LIKE '%sales%';


/* 6. Todos los clientes que no tengan una "A" en segunda posición en su nombre.
Devolved unicamente el nombre de contacto.*/

SELECT contact_name
	FROM customers
	WHERE contact_name NOT LIKE '_a%';





