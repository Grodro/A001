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


