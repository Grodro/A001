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


