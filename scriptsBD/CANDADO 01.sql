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

