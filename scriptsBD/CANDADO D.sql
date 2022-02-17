/*Posición: El candado D está ubicado en la posición calculada a partir del número obtenido
en la/s siguiente/s consulta/s:
Muestre los tapones por partido del jugador Corey Maggette durante la temporada 00/01.
Este resultado debe ser redondeado. Nota: el resultado debe estar redondeado
Este resultado nos dará la posición del candado (1, 2, 3 o 4)*/


select  round(Tapones_por_partido) from estadisticas e inner join jugadores j on e.jugador = j.codigo 
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