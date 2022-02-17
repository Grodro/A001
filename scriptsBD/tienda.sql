DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda CHARACTER SET utf8mb4;
USE tienda;

CREATE TABLE fabricante (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

CREATE TABLE producto (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio DOUBLE NOT NULL,
  codigo_fabricante INT UNSIGNED NOT NULL,
  FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo)
);

INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');

INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

# 01
SELECT nombre from producto;
# 02 
SELECT nombre,precio from producto;
#03
SELECT * from producto;
#04
SELECT nombre,ROUND(precio) from producto;
#05
SELECT codigo_fabricante from producto;
#10 
SELECT DISTINCT codigo_fabricante from producto;
#11
SELECT nombre  from fabricante
ORDER BY nombre;
#12
SELECT nombre,precio from producto order by nombre; 
SELECT nombre,precio from producto order by precio desc;
#13
SELECT * from fabricante LIMIT 5;
#14
SELECT nombre,precio from producto order by precio LIMIT 1;
#15
SELECT nombre,precio from producto order by precio desc LIMIT 1;
#16
SELECT nombre,precio from producto WHERE precio<=120;
#17
SELECT nombre,precio from producto WHERE PRECIO BETWEEN 60 AND 200;
#18
SELECT nombre,precio,codigo from producto WHERE CODIGO IN(1,3,5);
#23
SELECT nombre,precio,codigo from producto WHERE nombre LIKE '%portatil%' ;

#MT 01

SELECT p.codigo,p.nombre,X.codigo,X.nombre FROM producto p  LEFT JOIN fabricante X ON
X.codigo=p.codigo_fabricante;

#MT 02
SELECT p.nombre,p.precio,X.nombre FROM producto p  INNER JOIN fabricante X ON
X.codigo=p.codigo_fabricante order by X.nombre;

#MT 03
SELECT p.nombre,p.precio,X.nombre FROM producto p  INNER JOIN fabricante X ON
X.codigo=p.codigo_fabricante order by p.precio Limit 1;

#MT 04
SELECT p.nombre,p.precio,X.nombre FROM producto p  RIGHT JOIN fabricante X ON
X.codigo=p.codigo_fabricante WHERE X.nombre like 'lenovo';

#MT 05
SELECT p.nombre,p.precio,X.nombre FROM producto p  RIGHT JOIN fabricante X ON
X.codigo=p.codigo_fabricante WHERE X.nombre like 'CRUCIAL' AND p.precio>200;

#MT 06
SELECT p.nombre,p.precio,X.nombre FROM producto p  RIGHT JOIN fabricante X ON
X.codigo=p.codigo_fabricante WHERE X.nombre IN ('ASUS','Hewlett-Packard');

#MT 07
SELECT p.nombre,p.precio,X.nombre FROM producto p  INNER JOIN fabricante X ON
X.codigo=p.codigo_fabricante WHERE p.precio >=180 ORDER BY p.precio desc,p.nombre;

#MT 01
SELECT X.nombre,p.nombre,p.precio FROM fabricante X  LEFT JOIN producto p ON
X.codigo=p.codigo_fabricante;

#MT 02
SELECT X.nombre,p.nombre,p.precio FROM fabricante X  LEFT JOIN producto p ON
X.codigo<>p.codigo_fabricante;


