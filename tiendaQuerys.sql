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

-- Retorna un llistat amb el nom i el preu de tots els productes dels fabricants el nom dels quals acabi per la vocal e.
-- Retorna un llistat amb el nom i el preu de tots els productes el nom de fabricant dels quals contingui el caràcter w en el seu nom.
-- Retorna un llistat amb el nom de producte, preu i nom de fabricant, de tots els productes que tinguin un preu major o igual a 180 €. Ordena el resultat, en primer lloc, pel preu (en ordre descendent) i, en segon lloc, pel nom (en ordre ascendent).
-- Retorna un llistat amb el codi i el nom de fabricant, solament d'aquells fabricants que tenen productes associats en la base de dades.
-- Retorna un llistat de tots els fabricants que existeixen en la base de dades, juntament amb els productes que té cadascun d'ells. El llistat haurà de mostrar també aquells fabricants que no tenen productes associats.
-- Retorna un llistat on només apareguin aquells fabricants que no tenen cap producte associat.
-- Retorna tots els productes del fabricador Lenovo. (Sense utilitzar INNER JOIN).
-- Retorna totes les dades dels productes que tenen el mateix preu que el producte més car del fabricant Lenovo. (Sense usar INNER JOIN).
-- Llista el nom del producte més car del fabricant Lenovo.
-- Llista el nom del producte més barat del fabricant Hewlett-Packard.
-- Retorna tots els productes de la base de dades que tenen un preu major o igual al producte més car del fabricant Lenovo.
-- Llesta tots els productes del fabricant Asus que tenen un preu superior al preu mitjà de tots els seus productes.
