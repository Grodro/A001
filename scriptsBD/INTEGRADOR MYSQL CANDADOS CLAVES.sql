/*RODRIGO SALAS , GABRIEL ALOISIO , GIANINA AZCURRA , LEANDRO GIMENEZ , VANESA TORALES , FRANCO OSORIO Y MILAGROS GUASCO */
# MESA 07
#CANDADO A
/*Posición: El candado A está ubicado en la posición calculada a partir del número obtenido
en la/s siguiente/s consulta/s:
Muestre cuántas veces los jugadores lograron tener más o la misma cantidad de
asistencias por partido, que el máximo de asistencias por partido.
Este resultado nos dará la posición del candado (1, 2, 3 o 4)*/
SELECT * FROM JUGADORES;
select max(Asistencias_por_partido) from estadisticas;

SELECT count(*) as totalDeJugadores FROM estadisticas 
WHERE Asistencias_por_partido >= (SELECT max(Asistencias_por_partido) FROM estadisticas);

#02

/*Clave: La clave del candado A estará con formada por la/s siguientes consulta/s a la base
de datos:
Muestre la suma total del peso de los jugadores, donde la conferencia sea Este y la posición
sea centro o esté comprendida en otras posiciones*/


SELECT sum(j.Peso) FROM jugadores j INNER JOIN equipos e  ON j.Nombre_equipo = e.Nombre 
WHERE j.posicion LIKE "%C%" AND e.Conferencia = "East";


#14043

#CANDADO B
/*Posición: El candado B está ubicado en la posición calculada a partir del número obtenido
en la/s siguiente/s consulta/s:
Muestre la cantidad de jugadores que poseen más asistencias por partidos, que el numero
de jugadores que tiene el equipo Heat.
Este resultado nos dará la posición del candado (1, 2, 3 o 4)*/
SELECT count(nombre) FROM jugadores WHERE 
nombre_equipo LIKE ("%Heat%");
 

SELECT count(e.asistencias_por_partido) FROM jugadores j INNER JOIN estadisticas e ON 
e.jugador = j.codigo WHERE e.asistencias_por_partido >=(SELECT count(nombre) FROM jugadores WHERE 
nombre_equipo LIKE ("%Heat%"));

# 03
/*Clave: La clave del candado B estará con formada por la/s siguientes consulta/s a la base
de datos:
La clave será igual al conteo de partidos jugados durante las temporadas del año 1999*/

SELECT COUNT(*) FROM PARTIDOS WHERE TEMPORADA LIKE '%99%';

# 3480

#CANDADO C
/*Posición: El candado C está ubicado en la posición calculada a partir del número obtenido
en la/s siguiente/s consulta/s:
La posición del código será igual a la cantidad de jugadores que proceden de Michigan y
forman parte de equipos de la conferencia oeste.
Al resultado obtenido lo dividiremos por la cantidad de jugadores cuyo peso es mayor o igual
a 195, y a eso le vamos a sumar 0.9945.
Este resultado nos dará la posición del candado (1, 2, 3 o 4)

3*/

SELECT COUNT(*) FROM JUGADORES J INNER JOIN EQUIPOS E ON J.Nombre_equipo=E.Nombre WHERE J.Procedencia LIKE '%MICHIGAN%' AND E.Conferencia LIKE 'WEST';

select ((COUNT(*) / (select COUNT(*) from jugadores where Peso >= 195)) + 0.9945 ) as 'Resultado '
from jugadores j inner join equipos e on j.Nombre_equipo = e.Nombre where j.Procedencia = "Michigan" 
and e.Conferencia = "West" ;
#01
/*Clave: La clave del candado B estará con formada por la/s siguientes consulta/s a la base
de datos:
Para obtener el siguiente código deberás redondear hacia abajo el resultado que se
devuelve de sumar: el promedio de puntos por partido, el conteo de asistencias por partido,
y la suma de tapones por partido. Además, este resultado debe ser, donde la división sea
central*/



select(FLOOR(avg(Puntos_por_partido) + COUNT(Asistencias_por_partido) + SUM(Tapones_por_partido)) ) as Resultado from ((jugadores j inner join estadisticas es on j.codigo = es.jugador) inner join equipos eq on j.Nombre_equipo = eq.Nombre) where eq.Division = "Central";


#631

#CANDADO D
/*Posición: El candado D está ubicado en la posición calculada a partir del número obtenido
en la/s siguiente/s consulta/s:
Muestre los tapones por partido del jugador Corey Maggette durante la temporada 00/01.
Este resultado debe ser redondeado. Nota: el resultado debe estar redondeado
Este resultado nos dará la posición del candado (1, 2, 3 o 4)*/


SELECT  round(Tapones_por_partido) FROM estadisticas e inner join jugadores j on e.jugador = j.codigo 
where temporada = "00/01" and j.nombre = "Corey Maggette";

#04



/*Clave: La clave del candado D estará con formada por la/s siguientes consulta/s a la base
de datos:
Para obtener el siguiente código deberás redondear hacia abajo, la suma de puntos por
partido de todos los jugadores de procedencia argentina.*/

SELECT FLOOR(SUM(Puntos_por_partido)) FROM estadisticas E 
INNER JOIN jugadores J ON J.codigo=E.jugador 
WHERE J.Procedencia='Argentina';




#191