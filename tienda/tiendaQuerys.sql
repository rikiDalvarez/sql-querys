USE tienda;

SELECT nombre 
FROM producto;

SELECT nombre, precio
FROM producto;

SELECT * FROM producto;

SELECT nombre, CONCAT(precio, ' €') AS precio_EUR, CONCAT(precio * 1.18, ' $') AS precio_USD FROM producto;

SELECT nombre AS 'nom de producto', CONCAT(precio, ' €') AS euros, CONCAT(precio * 1.18, ' $') AS dòlars FROM producto;

SELECT UPPER(nombre), precio FROM producto;

SELECT LOWER(nombre), precio FROM producto;

SELECT nombre, LEFT(UPPER(nombre), 2) AS siglas FROM fabricante;

SELECT nombre, ROUND(precio) FROM producto;

SELECT nombre, TRUNCATE(precio, 0) AS precio_truncado
FROM producto;

SELECT codigo FROM producto ;

SELECT DISTINCT codigo FROM producto ;

SELECT nombre FROM fabricante ORDER BY nombre ASC;

SELECT nombre FROM fabricante ORDER BY nombre DESC;

SELECT nombre, precio 
FROM producto 
ORDER BY nombre ASC, precio DESC;

SELECT * FROM fabricante LIMIT 5;

SELECT * FROM fabricante LIMIT 2 OFFSET 3;

SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;

SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;

SELECT nombre FROM producto WHERE codigo_fabricante = 2;

SELECT p.nombre, p.precio, f.nombre FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo;

SELECT p.nombre, p.precio, f.nombre FROM producto p JOIN fabricante f on p.codigo_fabricante = f.codigo ORDER BY f.nombre ASC;

SELECT p.codigo, p.nombre, p.codigo_fabricante, f.nombre FROM producto p JOIN fabricante f on p.codigo_fabricante = f.codigo;

SELECT p.nombre, p.precio, f.nombre FROM producto p JOIN fabricante f on p.codigo_fabricante = f.codigo ORDER BY p.precio ASC LIMIT 1;

SELECT p.nombre, p.precio, f.nombre FROM producto p JOIN fabricante f on p.codigo_fabricante = f.codigo ORDER BY p.precio DESC LIMIT 1;

SELECT * FROM producto JOIN fabricante f ON producto.codigo_fabricante = f.codigo WHERE f.nombre = 'Lenovo';

SELECT * FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Crucial' AND p.precio > 200;

SELECT * FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Asus' OR f.nombre = 'Hewlett-Packard' OR f.nombre = 'Seagate';

SELECT * FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');

SELECT * FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE '%e';

SELECT DISTINCT f.nombre, p.precio FROM fabricante f JOIN producto p ON f.codigo = p.codigo_fabricante WHERE f.nombre LIKE '%w%';


SELECT p.nombre, p.precio, f.nombre FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE p.precio >= 180 ORDER BY p.precio DESC, p.nombre ASC;


SELECT p.codigo, f.nombre FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo;


SELECT f.nombre, p.nombre FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante;

SELECT f.nombre FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante WHERE p.codigo_fabricante IS NULL;

SELECT nombre FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo');

SELECT * FROM producto WHERE precio = (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));

SELECT nombre FROM producto WHERE precio = (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));

SELECT nombre FROM producto WHERE precio = (SELECT MIN(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = "Hewlett-Packard" ));

SELECT * FROM producto WHERE precio >= (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));

SELECT * FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Asus') AND precio > (SELECT AVG(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Asus'));

