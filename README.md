# Garden DataBase by Simon Mantilla and Jorge Jaimes



![image](https://github.com/simonmantillago/FiltroDB/assets/150193274/686e2118-f9d1-46e2-8b5b-d01548034294)


## Consultas sobre una tabla



1. Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.

   ```sql
   Select 
   	o.codigo_oficina,
   	o.ciudad
   FROM
   	oficina o;
   +----------------+--------+
   | codigo_oficina | ciudad |
   +----------------+--------+
   | OF001          | Cucuta |
   | OF002          | Bga    |
   | OF003          | Madrid |
   +----------------+--------+
   ```

   

2. Devuelve un listado con la ciudad y el teléfono de las oficinas de España.

   ```sql
   Select 
   	o.codigo_oficina,
   	o.ciudad,
   	o.pais
   FROM
   	oficina o
   WHERE 
   	o.pais = 'Espana';
   	
   +----------------+--------+--------+
   | codigo_oficina | ciudad | pais   |
   +----------------+--------+--------+
   | OF003          | Madrid | Espana |
   +----------------+--------+--------+
   ```

   

3. Devuelve un listado con el nombre, apellidos y email de los empleados cuyo
   jefe tiene un código de jefe igual a 7.

   ```sql
   SELECT
   	e.nombre,
   	e.apellido1,
   	e.email
   FROM 
   	empleado e
   WHERE e.puesto !=  'Jefe' AND e.codigo_jefe = 7;
   
   +--------+-----------+----------------------+
   | nombre | apellido1 | email                |
   +--------+-----------+----------------------+
   | Jorge  | Jaimes    | Jorge@notHOTmail.com |
   | Simon  | Mantilla  | Simon@HOTmail.com    |
   +--------+-----------+----------------------+
   ```

   

4. Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la
   empresa.

   ```sql
   SELECT
   	e.nombre,
   	e.apellido1,
   	e.email,
   	e.puesto
   FROM 
   	empleado e
   WHERE e.puesto =  'Jefe';
   
   +---------+-----------+---------------------+--------+
   | nombre  | apellido1 | email               | puesto |
   +---------+-----------+---------------------+--------+
   | Johlver | Pardo     | Johlver@HOTmail.com | Jefe   |
   +---------+-----------+---------------------+--------+
   ```

   

5. Devuelve un listado con el nombre, apellidos y puesto de aquellos
   empleados que no sean representantes de ventas.

   ```sql
   SELECT
   	e.nombre,
   	e.apellido1,
   	e.puesto
   FROM 
   	empleado e
   WHERE e.puesto != 'Rep.ventas' AND e.puesto !='Jefe';
   
   +--------+-----------+----------+
   | nombre | apellido1 | puesto   |
   +--------+-----------+----------+
   | Jorge  | Jaimes    | Empleado |
   +--------+-----------+----------+
   ```

   

6. Devuelve un listado con el nombre de los todos los clientes españoles.

   ```sql
   SELECT
   	c.codigo_cliente, 
   	c.nombre_cliente,
   	c.pais
   FROM 
   	cliente c
   WHERE 
   	c.pais = 'Espana';
   	
   +----------------+----------------+--------+
   | codigo_cliente | nombre_cliente | pais   |
   +----------------+----------------+--------+
   |     1005338578 | Max Steel      | Espana |
   +----------------+----------------+--------+
   ```

   

7. Devuelve un listado con los distintos estados por los que puede pasar un
   pedido.

   ```sql
   SELECT
    	p.estado
    FROM 
    	pedido p;
    
    +-----------+
   | estado    |
   +-----------+
   | Entregado |
   | Pendiente |
   | Rechazado |
   +-----------+
   ```

   

8. Devuelve un listado con el código de cliente de aquellos clientes que
   realizaron algún pago en 2008.

   ```sql
   SELECT
       codigo_cliente, 
       forma_pago, 
       id_transaccion, 
       fecha_pago
   FROM
       pago
   WHERE YEAR(fecha_pago) = 2008;
   --------------------------------------------------------------
   SELECT
       codigo_cliente, 
       forma_pago, 
       id_transaccion, 
       fecha_pago
   FROM
       pago
   WHERE DATE_FORMAT(fecha_pago, '%Y') = '2008';
   
   
   +----------------+------------+----------------+------------+
   | codigo_cliente | forma_pago | id_transaccion | fecha_pago |
   +----------------+------------+----------------+------------+
   |     1097490430 | Paypal     | 666            | 2008-07-01 |
   +----------------+------------+----------------+------------+
   ```

   

9. Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos que no han sido entregados a tiempo.

   ```sql
   SELECT
       codigo_pedido, 
       fecha_pedido,
       estado
   FROM
   	pedido
   WHERE estado = 'Pendiente';
   
   +---------------+--------------+-----------+
   | codigo_pedido | fecha_pedido | estado    |
   +---------------+--------------+-----------+
   |             2 | 2024-07-02   | Pendiente |
   +---------------+--------------+-----------+
   ```

   

10. Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha esperada.

   ```sql
   SELECT
       codigo_pedido,
       codigo_cliente,
       fecha_esperada,
       fecha_entrega,
       estado
   FROM
       pedido
   WHERE
       DATEDIFF(fecha_esperada, fecha_entrega) >= 2;
   ----------------------------------------------------
   SELECT
       codigo_pedido,
       codigo_cliente,
       fecha_esperada,
       fecha_entrega
   FROM
       pedido
   WHERE
       fecha_entrega <= ADDDATE(fecha_esperada, INTERVAL -2 DAY);
   
   +---------------+----------------+----------------+---------------+
   | codigo_pedido | codigo_cliente | fecha_esperada | fecha_entrega |
   +---------------+----------------+----------------+---------------+
   |             1 |     1097490430 | 2008-07-10     | 2008-07-05    |
   +---------------+----------------+----------------+---------------+
   ```




11. Devuelve un listado de todos los pedidos que fueron rechazados en 2009.

    ```sql
    SELECT 
    	codigo_pedido, 
    	fecha_pedido, 
    	estado, 
    	codigo_cliente
    FROM
    	pedido
    WHERE estado = 'Rechazado' AND DATE_FORMAT(fecha_pedido, '%Y') = '2009';
    
    +---------------+--------------+-----------+----------------+
    | codigo_pedido | fecha_pedido | estado    | codigo_cliente |
    +---------------+--------------+-----------+----------------+
    |             3 | 2009-07-02   | Rechazado |     1097490430 |
    +---------------+--------------+-----------+----------------+
    ```

    

12. Devuelve un listado de todos los pedidos que han sido entregados en el
    mes de enero de cualquier año.

    ```sql
    SELECT
        codigo_pedido,
        codigo_cliente,
        fecha_entrega,
        estado
    FROM
        pedido
    WHERE
        DATE_FORMAT(fecha_entrega, '%m') = '01';
    
    +---------------+----------------+---------------+-----------+
    | codigo_pedido | codigo_cliente | fecha_entrega | estado    |
    +---------------+----------------+---------------+-----------+
    |             4 |     1097490430 | 2012-01-05    | Entregado |
    +---------------+----------------+---------------+-----------+
    ```

    



13. Devuelve un listado con todos los pagos que se realizaron en el
    año 2008 mediante Paypal. Ordene el resultado de mayor a menor.
    
    ```sql
    SELECT
        codigo_cliente, 
        forma_pago, 
        id_transaccion, 
        fecha_pago, 
        total
    FROM
        pago
    WHERE 
    	YEAR(fecha_pago) = 2008 AND forma_pago = 'Paypal'
    ORDER BY
        total DESC;
        
    +----------------+------------+----------------+------------+-----------+
    | codigo_cliente | forma_pago | id_transaccion | fecha_pago | total     |
    +----------------+------------+----------------+------------+-----------+
    |     1097490430 | Paypal     | 666            | 2008-07-01 | 200000.00 |
    +----------------+------------+----------------+------------+-----------+
    ```



14. Devuelve un listado con todas las formas de pago que aparecen en la
    tabla pago. Tenga en cuenta que no deben aparecer formas de pago
    repetidas.
    
    
    
    ```sql
    SELECT DISTINCT
        forma_pago 
    FROM
        pago;
    +---------------+
    | forma_pago    |
    +---------------+
    | Paypal        |
    | No registrada |
    | Transferencia |
    +---------------+
    
    ```



15. Devuelve un listado con todos los productos que pertenecen a la
    gama Ornamentales y que tienen más de 100 unidades en stock. El listado
    deberá estar ordenado por su precio de venta, mostrando en primer lugar
    los de mayor precio.
    
    ```sql
    SELECT 
    	codigo_producto, 
    	nombre_producto,
        gama,
        precio_venta
    FROM 
     	producto
    WHERE 
    	gama = 'Ornamentales' AND cantidad_en_stock > 100
    ORDER BY 
    	precio_venta DESC;
    
    +-----------------+-----------------+--------------+--------------+
    | codigo_producto | nombre_producto | gama         | precio_venta |
    +-----------------+-----------------+--------------+--------------+
    | P001            | Mesa de jardín  | Ornamentales |    100000.00 |
    +-----------------+-----------------+--------------+--------------+
    ```



16. Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y
    cuyo representante de ventas tenga el código de empleado 11 o 30.
    
    ```sql
    SELECT
    	codigo_cliente, 
    	nombre_cliente,
    	ciudad,
    	pais,
    	codigo_empleado_rep_ventas
    FROM 
    	cliente
    WHERE ciudad = 'Madrid' AND codigo_empleado_rep_ventas = 11;
    
    +----------------+----------------+--------+--------+----------------------------+
    | codigo_cliente | nombre_cliente | ciudad | pais   | codigo_empleado_rep_ventas |
    +----------------+----------------+--------+--------+----------------------------+
    |     1005338578 | Max Steel      | Madrid | Espana |                         11 |
    +----------------+----------------+--------+--------+----------------------------+
    ```





## Consultas multitabla (Composición interna)

1. *Obtén un listado con el nombre de cada cliente y el nombre y apellido de su*
    *representante de ventas.*

  ```mysql
  SELECT
  c.nombre_cliente,
  e.nombre AS nombre_representante,
  e.apellido1 AS apellido_representante
  FROM 
  cliente c
  JOIN
  empleado e ON e.codigo_empleado=c.codigo_empleado_rep_ventas;
  
  
  +------------------+----------------------+------------------------+
  | nombre_cliente   | nombre_representante | apellido_representante |
  +------------------+----------------------+------------------------+
  | Max Steel        | Jorge                | Jaimes                 |
  | Pepita Confesuda | Simon                | Mantilla               |
  +------------------+----------------------+------------------------+
  
  
  ```

2. *Muestra el nombre de los clientes que hayan realizado pagos junto con el*
    *nombre de sus representantes de ventas.*

  ```MYsql
  SELECT
  c.nombre_cliente,
  e.nombre AS nombre_representante,
  e.apellido1 AS apellido_representante,
  p.fecha_pago,
  p.id_transaccion
  FROM 
  cliente c
  JOIN
  pago p ON p.codigo_cliente=c.codigo_cliente
  JOIN
  empleado e ON e.codigo_empleado=c.codigo_empleado_rep_ventas
  WHERE
  p.forma_pago != 'No registrada'
  
  +------------------+----------------------+------------------------+------------+----------------+
  | nombre_cliente   | nombre_representante | apellido_representante | fecha_pago | id_transaccion |
  +------------------+----------------------+------------------------+------------+----------------+
  | Max Steel        | Jorge                | Jaimes                 | 2024-07-02 | 999            |
  | Pepita Confesuda | Simon                | Mantilla               | 2008-07-01 | 666            |
  +------------------+----------------------+------------------------+------------+----------------+
  
  ```

3. *Muestra el nombre de los clientes que no hayan realizado pagos junto con*
    *el nombre de sus representantes de ventas.* 

  ```mysql
  SELECT
  c.nombre_cliente,
  e.nombre AS nombre_representante,
  e.apellido1 AS apellido_representante,
  p.fecha_pago,
  p.id_transaccion
  FROM 
  cliente c
  JOIN
  pago p ON p.codigo_cliente=c.codigo_cliente
  JOIN
  empleado e ON e.codigo_empleado=c.codigo_empleado_rep_ventas
  WHERE
  p.forma_pago = 'No registrada'
  
  +------------------+----------------------+------------------------+------------+----------------+
  | nombre_cliente   | nombre_representante | apellido_representante | fecha_pago | id_transaccion |
  +------------------+----------------------+------------------------+------------+----------------+
  | Pepita Confesuda | Simon                | Mantilla               | NULL       | 888            |
  +------------------+----------------------+------------------------+------------+----------------+
  
  ```

4. *Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus*
    *representantes junto con la ciudad de la oficina a la que pertenece elrepresentante.*

  ```mysql
  SELECT
  c.nombre_cliente,
  e.nombre AS nombre_representante,
  e.apellido1 AS apellido_representante,
  o.ciudad AS ciudad_oficina,
  p.fecha_pago,
  p.id_transaccion
  FROM 
  pago p
  JOIN
  cliente c ON p.codigo_cliente=c.codigo_cliente
  JOIN
  empleado e ON e.codigo_empleado=c.codigo_empleado_rep_ventas
  JOIN 
  oficina o ON e.codigo_oficina=o.codigo_oficina
  WHERE
  p.forma_pago != 'No registrada';
  
  +------------------+----------------------+------------------------+----------------+------------+----------------+
  | nombre_cliente   | nombre_representante | apellido_representante | ciudad_oficina | fecha_pago | id_transaccion |
  +------------------+----------------------+------------------------+----------------+------------+----------------+
  | Max Steel        | Jorge                | Jaimes                 | Cucuta         | 2024-07-02 | 999            |
  | Pepita Confesuda | Simon                | Mantilla               | Cucuta         | 2008-07-01 | 666            |
  +------------------+----------------------+------------------------+----------------+------------+----------------+
  
  ```

  

5. *Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre*
    *de sus representantes junto con la ciudad de la oficina a la que pertenece el*
    *representante.*



  ```mysql
  SELECT
  c.nombre_cliente,
  e.nombre AS nombre_representante,
  e.apellido1 AS apellido_representante,
  o.ciudad AS ciudad_oficina,
  p.fecha_pago,
  p.id_transaccion
  FROM 
  pago p
  JOIN
  cliente c ON p.codigo_cliente=c.codigo_cliente
  JOIN
  empleado e ON e.codigo_empleado=c.codigo_empleado_rep_ventas
  JOIN 
  oficina o ON e.codigo_oficina=o.codigo_oficina
  WHERE
  p.forma_pago = 'No registrada';
  
  +------------------+----------------------+------------------------+----------------+------------+----------------+
  | nombre_cliente   | nombre_representante | apellido_representante | ciudad_oficina | fecha_pago | id_transaccion |
  +------------------+----------------------+------------------------+----------------+------------+----------------+
  | Pepita Confesuda | Simon                | Mantilla               | Cucuta         | NULL       | 888            |
  +------------------+----------------------+------------------------+----------------+------------+----------------+
  
  
  ```

6. *Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.*



  ```mysql
  INSERT INTO cliente (codigo_cliente, nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, linea_direccion2, ciudad, region, pais, codigo_postal, codigo_empleado_rep_ventas, limite_credito) VALUES
  (12320430, 'Bob Esponja', 'Bob', 'Esponja', '23421151', '444444', 'Cr 123', 'Casa 23', 'Fuenlabrada', 'España', 'España', '00030', 11, 5000000);
  
  SELECT 
  c.nombre_cliente,
  c.ciudad,
  o.codigo_oficina,
  o.codigo_postal AS codigo_postal_oficina,
  o.linea_direccion1,
  o.linea_direccion2
  FROM
  cliente c
  JOIN
  empleado e ON c.codigo_empleado_rep_ventas=e.codigo_empleado
  JOIN
  oficina o ON e.codigo_oficina=o.codigo_oficina
  WHERE
  c.ciudad='Fuenlabrada';
  
  +----------------+-------------+----------------+-----------------------+------------------+------------------+
  | nombre_cliente | ciudad      | codigo_oficina | codigo_postal_oficina | linea_direccion1 | linea_direccion2 |
  +----------------+-------------+----------------+-----------------------+------------------+------------------+
  | Bob Esponja    | Fuenlabrada | OF001          | 68004                 | Calle 10-52      | Apto 2           |
  +----------------+-------------+----------------+-----------------------+------------------+------------------+
  
  ```

6. *Devuelve el nombre de los clientes y el nombre de sus representantes junto*
     *con la ciudad de la oficina a la que pertenece el representante.*



  ```mysql
  SELECT
  c.nombre_cliente,
  e.nombre AS nombre_representante,
  o.ciudad AS ciudad_oficina
  FROM
  cliente c
  JOIN
  empleado e ON c.codigo_empleado_rep_ventas=e.codigo_empleado
  JOIN
  oficina o ON e.codigo_oficina=o.codigo_oficina;
  
  +------------------+----------------------+----------------+
  | nombre_cliente   | nombre_representante | ciudad_oficina |
  +------------------+----------------------+----------------+
  | Bob Esponja      | Jorge                | Cucuta         |
  | Max Steel        | Jorge                | Cucuta         |
  | Pepita Confesuda | Simon                | Cucuta         |
  +------------------+----------------------+----------------+
  ```

8. *Devuelve un listado con el nombre de los empleados junto con el nombre*
    *de sus jefes.*

  

  ```mysql
  SELECT
  e.nombre AS empleado,
  a.nombre AS jefe
  FROM
  empleado e
  JOIN 
  empleado a ON a.codigo_empleado=e.codigo_jefe
  WHERE 
  e.codigo_empleado!=e.codigo_jefe
  
  +----------+---------+
  | empleado | jefe    |
  +----------+---------+
  | Jorge    | Johlver |
  | Simon    | Johlver |
  +----------+---------+
  
  ```

9. *Devuelve un listado que muestre el nombre de cada empleados, el nombre*
    *de su jefe y el nombre del jefe de sus jefe.*

  ```mysql
  INSERT INTO empleado (codigo_empleado, nombre, apellido1, apellido2, extension, email, codigo_oficina, codigo_jefe, puesto) VALUES
  (69, 'carlos', 'santana', 'perez', '007', 'carlos@HOTmail.com', 'OF001', 11, 'Empleado');
  
  SELECT
  e.nombre AS Empleado,
  a.nombre AS Jefe_menor,
  b.nombre AS Jefe_mayor
  FROM
  empleado e
  JOIN 
  empleado a ON a.codigo_empleado=e.codigo_jefe
  JOIN 
  empleado b ON b.codigo_empleado=a.codigo_jefe
  WHERE 
  e.codigo_empleado!=e.codigo_jefe
  
  +----------+------------+------------+
  | Empleado | Jefe_menor | Jefe_mayor |
  +----------+------------+------------+
  | Jorge    | Johlver    | Johlver    |
  | carlos   | Jorge      | Johlver    |
  | Simon    | Johlver    | Johlver    |
  +----------+------------+------------+
  
  ```

10. *Devuelve el nombre de los clientes a los que no se les ha entregado a*
    *tiempo un pedido.*

      ```mysql
      SELECT
      c.nombre_cliente,
      p.codigo_pedido
      FROM
      pedido p
      JOIN
      cliente c ON p.codigo_cliente=c.codigo_cliente
      WHERE
      p.estado != 'Entregado';
      
      +------------------+---------------+
      | nombre_cliente   | codigo_pedido |
      +------------------+---------------+
      | Max Steel        |             2 |
      | Pepita Confesuda |             3 |
      +------------------+---------------+
      ```
    
11. *Devuelve un listado de las diferentes gamas de producto que ha comprado*
    *cada cliente.*

  ```mysql
  SELECT
  c.nombre_cliente,
  g.gama,
  g.descripcion_texto AS descripcion
  FROM
  cliente c
  JOIN
  pedido p ON c.codigo_cliente=p.codigo_cliente
  JOIN
  detalle_pedido d ON p.codigo_pedido=d.codigo_pedido
  JOIN
  producto pr ON d.codigo_producto=pr.codigo_producto
  JOIN
  gama_producto g ON pr.gama=g.gama
  
  +------------------+--------------+--------------------+
  | nombre_cliente   | gama         | descripcion        |
  +------------------+--------------+--------------------+
  | Max Steel        | Indoor       | Productos interior |
  | Pepita Confesuda | Ornamentales | Productos exterior |
  +------------------+--------------+--------------------+
  
  ```

## Consultas multitabla (Composición externa)

1. Devuelve un listado que muestre solamente los clientes que no han
   realizado ningún pago.

```sql
SELECT 
	c.codigo_cliente, 
	c.nombre_cliente, 
	p.id_transaccion
FROM 
	cliente c
LEFT JOIN 
	pago p ON c.codigo_cliente = p.codigo_cliente
WHERE p.codigo_cliente IS NULL;

+----------------+----------------+----------------+
| codigo_cliente | nombre_cliente | id_transaccion |
+----------------+----------------+----------------+
|       12320430 | Bob Esponja    | NULL           |
+----------------+----------------+----------------+
```

​	

2. Devuelve un listado que muestre solamente los clientes que no han
   realizado ningún pedido.

```sql
SELECT 
	c.codigo_cliente, 
	c.nombre_cliente
FROM 
	cliente c
LEFT JOIN 
	pedido p ON c.codigo_cliente = p.codigo_cliente
WHERE 
	p.codigo_cliente IS NULL;
	
	
+----------------+----------------+
| codigo_cliente | nombre_cliente |
+----------------+----------------+
|       12320430 | Bob Esponja    |
+----------------+----------------+
```



3. Devuelve un listado que muestre los clientes que no han realizado ningún
   pago y los que no han realizado ningún pedido.

```sql
SELECT 
	c.codigo_cliente, 
	c.nombre_cliente
FROM 
	cliente c
LEFT JOIN 
	pago p ON c.codigo_cliente = p.codigo_cliente
WHERE 
	p.codigo_cliente IS NULL
UNION
SELECT 
	c.codigo_cliente, 
	c.nombre_cliente
FROM 
	cliente c
LEFT JOIN 
	pedido pe ON c.codigo_cliente = pe.codigo_cliente
WHERE pe.codigo_cliente IS NULL;

+----------------+----------------+
| codigo_cliente | nombre_cliente |
+----------------+----------------+
|       12320430 | Bob Esponja    |
+----------------+----------------+
```



4. Devuelve un listado que muestre solamente los empleados que no tienen
   una oficina asociada.

```sql
SELECT 
	e.codigo_empleado, 
	e.nombre,
	o.codigo_oficina
FROM 
	empleado e
LEFT JOIN 
	oficina o ON e.codigo_oficina = o.codigo_oficina
WHERE o.codigo_oficina IS NULL;
```



5. Devuelve un listado que muestre solamente los empleados que no tienen un
   cliente asociado.

```sql
SELECT 
	 e.nombre, e.codigo_oficina
FROM 
	empleado e
LEFT JOIN 
	cliente c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
WHERE c.codigo_empleado_rep_ventas IS NULL;
+---------+----------------+
| nombre  | codigo_oficina |
+---------+----------------+
| Johlver | OF001          |
+---------+----------------+

```



## Consultas resumen



1. ¿Cuántos empleados hay en la compañía?

```sql
SELECT 
	COUNT(e.codigo_empleado) AS Empleados
FROM 
	empleado e;
+-----------+
| Empleados |
+-----------+
|         3 |
+-----------+
```

2. ¿Cuántos clientes tiene cada país?

```sql
SELECT 
	COUNT(codigo_cliente) AS clientes,
	pais
FROM cliente
GROUP BY pais;
+----------+----------+
| clientes | pais     |
+----------+----------+
|        2 | España   |
|        1 | Colombia |
+----------+----------+

```



3. ¿Cuál fue el pago medio en 2009?

```sql
SELECT 
	AVG(total) AS pago_medio
FROM 
	pago
WHERE YEAR(fecha_pago) = 2009;

```



4. ¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma
   descendente por el número de pedidos.

```sql
SELECT 
	estado, 
	COUNT(codigo_pedido) AS cantidad_pedidos
FROM 
	pedido
GROUP BY 
	estado
ORDER BY cantidad_pedidos DESC;

+-----------+------------------+
| estado    | cantidad_pedidos |
+-----------+------------------+
| Entregado |                2 |
| Pendiente |                1 |
| Rechazado |                1 |
+-----------+------------------+
```



5. Calcula el precio de venta del producto más caro y más barato en una
   misma consulta.

```sql
SELECT
    MAX(precio_venta) AS precio_mas_caro,
    MIN(precio_venta) AS precio_mas_barato
FROM producto;

+-----------------+-------------------+
| precio_mas_caro | precio_mas_barato |
+-----------------+-------------------+
|       400000.00 |         100000.00 |
+-----------------+-------------------+
```



6. Calcula el número de clientes que tiene la empresa.

```sql
SELECT 
	COUNT(codigo_cliente) AS total_clientes
FROM cliente;
+----------------+
| total_clientes |
+----------------+
|              3 |
+----------------+
```



7. ¿Cuántos clientes existen con domicilio en la ciudad de Madrid?

```sql
SELECT 
	COUNT(codigo_cliente) AS total_clientes
FROM 
	cliente
WHERE ciudad = 'Madrid';
+----------------+
| total_clientes |
+----------------+
|              1 |
+----------------+
```

8. ¿Calcula cuántos clientes tiene cada una de las ciudades que empiezan
   por M?

```sql
SELECT 
	ciudad, COUNT(codigo_cliente) AS cantidad_clientes
FROM 
	cliente
WHERE 
	ciudad LIKE 'M%'
GROUP BY ciudad;
+--------+-------------------+
| ciudad | cantidad_clientes |
+--------+-------------------+
| Madrid |                 1 |
+--------+-------------------+
```



9. Devuelve el nombre de los representantes de ventas y el número de clientes
   al que atiende cada uno.

```sql
SELECT 
	e.nombre,  
	COUNT(c.codigo_cliente) AS clientes_atendidos
FROM 
	empleado e
JOIN 
	cliente c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
GROUP BY e.nombre;
+--------+--------------------+
| nombre | clientes_atendidos |
+--------+--------------------+
| Jorge  |                  2 |
| Simon  |                  1 |
+--------+--------------------+
```

10. Calcula el número de clientes que no tiene asignado representante de
    ventas.

```sql
SELECT 
	COUNT(codigo_cliente) AS clientes_sin_representante
FROM 
	cliente
WHERE codigo_empleado_rep_ventas IS NULL;
+----------------------------+
| clientes_sin_representante |
+----------------------------+
|                          0 |
+----------------------------+
```

11. Calcula la fecha del primer y último pago realizado por cada uno de los
    clientes. El listado deberá mostrar el nombre y los apellidos de cada cliente.

```sql
SELECT c.nombre_cliente, c.nombre_contacto,
       MIN(p.fecha_pago) AS primer_pago,
       MAX(p.fecha_pago) AS ultimo_pago
FROM 
	cliente c
LEFT JOIN 
	pago p ON c.codigo_cliente = p.codigo_cliente
GROUP BY c.nombre_cliente, c.nombre_contacto, c.apellido_contacto;
+------------------+-----------------+-------------+-------------+
| nombre_cliente   | nombre_contacto | primer_pago | ultimo_pago |
+------------------+-----------------+-------------+-------------+
| Bob Esponja      | Bob             | NULL        | NULL        |
| Max Steel        | Max             | 2024-07-02  | 2024-07-02  |
| Pepita Confesuda | Pepa            | 2008-07-01  | 2008-07-01  |
+------------------+-----------------+-------------+-------------+
```

## Consultas resumen

​	

1. Devuelve el listado de clientes indicando el nombre del cliente y cuántos pedidos ha realizado. Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido.

```sql
SELECT
    c.codigo_cliente,
    c.nombre_cliente,
    COUNT(p.codigo_pedido) AS numero_pedidos
FROM
    cliente c
LEFT JOIN
    pedido p ON p.codigo_cliente = c.codigo_cliente
GROUP BY
    c.codigo_cliente;

+----------------+------------------+----------------+
| codigo_cliente | nombre_cliente   | numero_pedidos |
+----------------+------------------+----------------+
|       12320430 | Bob Esponja      |              0 |
|     1005338578 | Max Steel        |              1 |
|     1097490430 | Pepita Confesuda |              2 |
+----------------+------------------+----------------+
```

2. Devuelve un listado con los nombres de los clientes y el total pagado por cada uno de ellos. Tenga en cuenta que pueden existir clientes que no han realizado ningún pago.

  

```sql
SQL  SELECT
      c.codigo_cliente,
      c.nombre_cliente,
      SUM(p.total) AS total_pagado
  FROM
      cliente c
  LEFT JOIN
      pago p ON p.codigo_cliente = c.codigo_cliente
  GROUP BY
      c.codigo_cliente;
      
  +----------------+------------------+--------------+
  | codigo_cliente | nombre_cliente   | total_pagado |
  +----------------+------------------+--------------+
  |       12320430 | Bob Esponja      |         NULL |
  |     1005338578 | Max Steel        |   1600000.00 |
  |     1097490430 | Pepita Confesuda |    300000.00 |
  +----------------+------------------+--------------+
  
```

3. Devuelve el nombre de los clientes que hayan hecho pedidos en 2008 ordenados alfabéticamente de menor a mayor.

```sql
  SELECT
      c.codigo_cliente,
      c.nombre_cliente,
      p.codigo_pedido
  FROM
      cliente c
  JOIN
      pedido p ON p.codigo_cliente = c.codigo_cliente
  where 
      p.fecha_pedido > 2008
  ORDER BY
      c.nombre_cliente;
      
  +----------------+------------------+---------------+
  | codigo_cliente | nombre_cliente   | codigo_pedido |
  +----------------+------------------+---------------+
  |     1005338578 | Max Steel        |             2 |
  |     1097490430 | Pepita Confesuda |             1 |
  |     1097490430 | Pepita Confesuda |             3 |
  +----------------+------------------+---------------+
  
```

4. Devuelve el nombre del cliente, el nombre y primer apellido de su representante de ventas y el número de teléfono de la oficina del representante de ventas, de aquellos clientes que no hayan realizado ningún pago.

  

```sql
  SELECT
      c.codigo_cliente,
      c.nombre_cliente,
      e.nombre AS empleado,
      e.apellido1 AS empleado_apellido,
      o.telefono

  FROM
      cliente c
  LEFT JOIN
      pago p ON p.codigo_cliente = c.codigo_cliente
   LEFT JOIN
   empleado e ON c.codigo_empleado_rep_ventas=e.codigo_empleado
   LEFT JOIN
   oficina o ON o.codigo_oficina=e.codigo_oficina
     where
     p.total IS NULL

+----------------+----------------+----------+-------------------+-------------+
| codigo_cliente | nombre_cliente | empleado | empleado_apellido | telefono    |
+----------------+----------------+----------+-------------------+-------------+
|       12320430 | Bob Esponja    | Jorge    | Jaimes            | 62626260652 |
+----------------+----------------+----------+-------------------+-------------+
  
```
