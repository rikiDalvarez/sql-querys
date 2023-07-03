--getProductsName
SELECT nombre 
FROM producto;

--getNamePriceProduct
SELECT nombre, precio
FROM producto;

--getAllProduct
SELECT * FROM producto;

--getPriceDolarEuro
SELECT nombre, CONCAT(precio, ' €') AS precio_EUR, CONCAT(precio * 1.18, ' $') AS precio_USD FROM producto;

--getPriceDolarEuroAs
SELECT nombre AS 'nom de producto', CONCAT(precio, ' €') AS euros, CONCAT(precio * 1.18, ' $') AS dòlars FROM producto;

--getNamePriceInUpper
SELECT UPPER(nombre), precio FROM producto;

--getNamePriceLower
SELECT LOWER(nombre), precio FROM producto;

--getNameASUpper
SELECT nombre, LEFT(UPPER(nombre), 2) AS siglas FROM fabricante;

--getNameRoundPrice
SELECT nombre, ROUND(precio) FROM producto;

--getNameTruncatePrice
SELECT nombre, TRUNCATE(precio, 0) AS precio_truncado
FROM producto;

--getFabrCodeInProductTable
SELECT codigo FROM producto ;

--getDistFabrCodeInProductTable
SELECT DISTINCT codigo FROM producto ;

--getAscFabrName
SELECT nombre FROM fabricante ORDER BY nombre ASC;

--getDescFabrName
SELECT nombre FROM fabricante ORDER BY nombre DESC;

--getNameAscPreDesc
SELECT nombre, precio 
FROM producto 
ORDER BY nombre ASC, precio DESC;

--getTop5FromFabr
SELECT * FROM fabricante LIMIT 5;

--getTop2FromFabrOffset3
SELECT * FROM fabricante LIMIT 2 OFFSET 3;

--getCheapestProduct
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;

--getMostExpensiveProduct
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;

--getNameCodEql2
SELECT nombre FROM producto WHERE codigo_fabricante = 2;

--getNamePriceFNom
SELECT p.nombre, p.precio, f.nombre FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo;

--getNamePriceFNomAsc
SELECT p.nombre, p.precio, f.nombre FROM producto p JOIN fabricante f on p.codigo_fabricante = f.codigo ORDER BY f.nombre ASC;

--getCodNamCFab
SELECT p.codigo, p.nombre, p.codigo_fabricante, f.nombre FROM producto p JOIN fabricante f on p.codigo_fabricante = f.codigo;

--getCheapestNomPreFab
SELECT p.nombre, p.precio, f.nombre FROM producto p JOIN fabricante f on p.codigo_fabricante = f.codigo ORDER BY p.precio ASC LIMIT 1;

--getMostExpensiveNomPreFab
SELECT p.nombre, p.precio, f.nombre FROM producto p JOIN fabricante f on p.codigo_fabricante = f.codigo ORDER BY p.precio DESC LIMIT 1;

--getAllFromLenovo
SELECT * FROM producto JOIN fabricante f ON producto.codigo_fabricante = f.codigo WHERE f.nombre = 'Lenovo';

--getAllFromCrucialLess200
SELECT * FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Crucial' AND producto.precio > 200;

--getAllFromAsusHPSeagate
SELECT * FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Asus' OR f.nombre = 'Hewlett-Packard' OR f.nombre = 'Seagate';

--getAllFromAsusHPSeagateIN
SELECT * FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');

--getFabrEndE
SELECT * FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE '%e';

--get
SELECT DISTINCT f.nombre, p.precio FROM fabricante f JOIN producto p ON f.codigo = p.codigo_fabricante WHERE f.nombre LIKE '%w%';

--getByPrice180+
SELECT p.nombre, p.precio, f.nombre FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE p.precio >= 180 ORDER BY p.precio DESC, p.nombre ASC;

--getCode&Name
SELECT p.codigo, f.nombre FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo;

--getFabrName&ProdName
SELECT f.nombre, p.nombre FROM farbicante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante;

--getFabrNameWIthoutProd
SELECT f.nombre FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante WHERE p.codigo_fabricante IS NULL;

--getLenovoProd
SELECT nombre FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo');

--getAllSamePriceAsLenovo
SELECT * FROM producto WHERE precio = (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));

--getMostExpensiveLenovo
SELECT nombre FROM producto WHERE precio = (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));

--getCheapestHPProd
SELECT nombre FROM producto WHERE precio = (SELECT MIN(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = "Hewlett-Packard" ));

--getHigherThanLenovo
SELECT * FROM producto WHERE precio >= (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));

--getHigherThanAsusAvg
SELECT * FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Asus') AND precio > (SELECT AVG(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Asus'));

