-- ----------------------------------------------------------------
-- -   Dame una descripción de la tabla freakymon.                -
-- ----------------------------------------------------------------
SET LINESIZE 300
SELECT * FROM FREAKYMON;


-- ----------------------------------------------------------------
-- -	Muéstrame todos los datos de la tabla gimnasio            -
-- ----------------------------------------------------------------
SET LINESIZE 250
SELECT * FROM GYM;


-- ----------------------------------------------------------------
-- -	Mostrar el nombre del freackymon, su género, hp_maximo,   -
-- -    cp, altura y peso.                                        -
-- ----------------------------------------------------------------
SET LINESIZE 100
SELECT 
    FD.nombre AS nombre_freakymon,
    FM.genero,
    FM.hp AS hp_maximo,
    FM.cp,
    FM.altura,
    FM.peso
FROM 
    FREAKYMON FM
JOIN 
    FREAKYDEX FD ON FM.id_freakydex_fk = FD.id_pk;


-- ----------------------------------------------------------------
-- -    Mostrar el freakydex (freakymones encontrados) de un      -
-- -    jugador en particular. Mostrar todos los atributos del    -
-- -    freackydex.                                               -
-- ----------------------------------------------------------------
SET LINESIZE 150
SELECT *
FROM FREAKYDEX
WHERE celular_cuenta_jugador_pk_fk = '1234567890';


-- ----------------------------------------------------------------
-- -  Muestra el inventario de un jugador en particular           -
-- -  (nombre del item, fecha en que lo obtuvo y la cantidad que  -
-- -  obtuvo en ese momento). Incluye el Nombre del jugador.      -
-- ----------------------------------------------------------------
SELECT 
    J.nombre AS jugador, 
    I.nombre AS item, 
    G.fecha_hora, 
    G.cantidad_items
FROM 
    GIRADA G
JOIN 
    ITEM I ON G.id_item_pk_fk = I.id_pk
JOIN 
    JUGADOR J ON G.celular_cuenta_jugador_pk_fk = J.celular_cuenta_pk_fk;


-- ----------------------------------------------------------------
-- -  Muestra los freakymones con el nombre del ataque y la       -
-- -  cantidad de cada ataque.                                    -
-- ----------------------------------------------------------------
SET LINESIZE 150
SELECT 
    FD.nombre AS freakymon, 
    A.nombre AS ataque, 
    AM.valor AS cantidad
FROM 
    ATAQUE_FREAKYMON AM
JOIN 
    FREAKYMON FM ON AM.id_freakymon_pk_fk = FM.id_pk
JOIN 
    FREAKYDEX FD ON FM.id_freakydex_fk = FD.id_pk
JOIN 
    ATAQUE A ON AM.id_ataque_pk_fk = A.id_pk;


-- ----------------------------------------------------------------
-- -  Muestra pk del freakymon que más días ha estado en el       -
-- -  Gimnasio defendiéndolo.                                     -
-- ----------------------------------------------------------------
SET LINESIZE 100
SELECT 
    id_freakymon_pk_fk AS freakymon_pk,
    MAX(SYSDATE - fecha_captura) AS dias_en_gym
FROM 
    GYM_FREAKYMON
WHERE 
    fecha_derrota IS NULL
GROUP BY 
    id_freakymon_pk_fk
ORDER BY 
    dias_en_gym DESC
FETCH FIRST 1 ROW ONLY;


-- ----------------------------------------------------------------
-- -  Mostrar los pokemones que todavía están defendiendo un      -
-- -  Gimnasio (NULL).                                            -
-- ----------------------------------------------------------------
SELECT 
    id_freakymon_pk_fk AS freakymon_pk, 
    fecha_captura
FROM 
    GYM_FREAKYMON
WHERE 
    fecha_derrota IS NULL;

-- ----------------------------------------------------------------
-- -  Mostrar del freakydesk el nombre del pokemon y su evolución.-
-- -  Recuerden que tiene que haber pokemones que evolucionen una -
-- -  ves y que evolucionen dos veces. (Self-Join)                -
-- ----------------------------------------------------------------
SET LINESIZE 150
SELECT 
    F1.nombre AS pokemon, 
    F2.nombre AS evolucion
FROM 
    FREAKYDEX F1
LEFT JOIN 
    FREAKYDEX F2 ON F1.id_pk = F2.evolucion_fk;


-- ----------------------------------------------------------------
-- -  Haz un left outher Join entre el freackydex y el freackymon -
-- -  (usando solamente el pk)                                    -
-- ----------------------------------------------------------------
SELECT 
    FD.id_pk AS freakydex_pk, 
    FD.nombre AS freakymon, 
    FM.id_pk AS freakymon_pk
FROM 
    FREAKYDEX FD
LEFT JOIN 
    FREAKYMON FM ON FD.id_pk = FM.id_freakydex_fk;


-- ----------------------------------------------------------------
-- -  Crea un CROSS JOIN entre el pk de freackymon y los ataques  -
-- -  (pk) e incluye el nombre del ataque.                        -
-- ----------------------------------------------------------------
SELECT 
    FD.id_pk AS freakymon_pk, 
    A.id_pk AS ataque_pk, 
    A.nombre AS nombre_ataque
FROM 
    FREAKYDEX FD
CROSS JOIN 
    ATAQUE A;



-- ----------------------------------------------------------------
-- -  Muestra el pk, nombre, descripción y latitud y longitud de  -
-- -  todas las paradas (freakystop) y de todos los gimnasios.    -
-- -  (todos juntos) (UNION)                                      -
-- ----------------------------------------------------------------
SET LINESIZE 150
SELECT 
    id_pk AS id, 
    nombre, 
    descripcion, 
    latitud, 
    longitud
FROM 
    FREAKYPARADA
UNION
SELECT 
    id_pk AS id, 
    nombre, 
    descripcion, 
    latitud, 
    longitud
FROM 
    GYM;



-- ----------------------------------------------------------------
-- -  Mostrar el nombre del jugador en Initcap y los nombres de   -
-- -  los freakymones que ha capturado(freakydesk) en mayúsculas. -
-- -  (solamente indicar un jugador que tenga muchos freakymones) -
-- ----------------------------------------------------------------
SET LINESIZE 150
SELECT 
    INITCAP(J.nombre) AS jugador, 
    UPPER(F.nombre) AS freakymon
FROM 
    JUGADOR J
JOIN 
    FREAKYDEX F ON J.celular_cuenta_pk_fk = F.celular_cuenta_jugador_pk_fk
WHERE 
    J.celular_cuenta_pk_fk = '1234567890'; 


-- ----------------------------------------------------------------
-- -  Mostrar de cuantos caracteres se componen los nombres de los-
-- -  freakymones (no incluir repetidos) y organizar el resultado -
-- -  en orden descendente.                                       -
-- ----------------------------------------------------------------
SELECT 
    DISTINCT nombre, 
    LENGTH(nombre) AS cantidad_caracteres
FROM 
    FREAKYDEX
ORDER BY 
    cantidad_caracteres DESC;


-- ----------------------------------------------------------------
-- -  Calcular la cantidad de días que han transcurrido entre la  -
-- -  fecha en la que se agarra un pokemon y la fecha actual del  -
-- -  sistema (sysdate).                                          -
-- ----------------------------------------------------------------
SET LINESIZE 200
SELECT 
    fecha AS fecha_captura, 
    TRUNC(SYSDATE - fecha) AS dias_transcurridos
FROM 
    FREAKYMON;


-- ----------------------------------------------------------------
-- -  Calcula los meses transcurridos entre la fecha de creación  -
-- -  de la cuenta del usuario y la fecha de nacimiento del       -
-- -  jugador .                                                   -
-- ----------------------------------------------------------------
SET LINESIZE 150
SELECT 
    C.fecha_creacion, 
    J.fecha_nacimiento AS fecha_nacimiento, 
    MONTHS_BETWEEN(C.fecha_creacion, J.fecha_nacimiento) AS meses
FROM 
    CUENTA C
JOIN 
    JUGADOR J ON C.celular_pk = J.celular_cuenta_pk_fk;


-- ----------------------------------------------------------------
-- -  Añade 25 meses a la fecha de captura de los freakymones y   -
-- -  muestrala, además incluye el nombre del frekymon.           -
-- ----------------------------------------------------------------
SELECT 
    F.nombre AS freakymon, 
    ADD_MONTHS(FM.fecha, 25) AS fecha_modificada
FROM 
    FREAKYMON FM
JOIN 
    FREAKYDEX F ON FM.id_freakydex_fk = F.id_pk;


-- ----------------------------------------------------------------
-- -  Muestra la suma de CP de un tipo de freakymon (selecciona   -
-- -  el que mas tenga de unmismo tipo, debe haber más de tres    -
-- -  instancias).                                                -
-- ----------------------------------------------------------------
SELECT 
    T.nombre AS tipo, 
    SUM(FM.cp) AS suma_cp
FROM 
    TIPO T
JOIN 
    FREAKYMON_TIPO FMT ON T.num_pk = FMT.num_tipo_pk_fk
JOIN 
    FREAKYMON FM ON FMT.id_freakymon_pk_fk = FM.id_pk
WHERE 
    T.nombre = 'Fire' 
GROUP BY 
    T.nombre;




-- ----------------------------------------------------------------
-- -  Mostrar el promedio de CP por grupo de freakymones (ejemplo -
-- -  todos los picachus) Deben haber al menos 2 grupo de 6       -
-- -  freakymones del mismo tipo.                                 -
-- ----------------------------------------------------------------
SELECT 
    T.nombre AS tipo, 
    AVG(FM.cp) AS promedio_cp
FROM 
    TIPO T
JOIN 
    FREAKYMON_TIPO FMT ON T.num_pk = FMT.num_tipo_pk_fk
JOIN 
    FREAKYMON FM ON FMT.id_freakymon_pk_fk = FM.id_pk
GROUP BY 
    T.nombre;



-- ----------------------------------------------------------------
-- -  Cuenta cuantas instancias hay en la tabla jugador.          -
-- ----------------------------------------------------------------
SELECT 
    COUNT(*) AS total_jugadores
FROM 
    JUGADOR;


-- ----------------------------------------------------------------
-- -  Muestra el nombre del freakymon que tiene el CP más alto.   -
-- ----------------------------------------------------------------
SELECT 
    F.nombre AS freakymon, 
    FM.cp AS cp_maximo
FROM 
    FREAKYMON FM
JOIN 
    FREAKYDEX F ON FM.id_freakydex_fk = F.id_pk
ORDER BY 
    FM.cp DESC
FETCH FIRST 1 ROW ONLY;


22

-- ----------------------------------------------------------------
-- -  Muestra el promedio de CP por tipo de frekymon. (freakydex  -
-- -  y freakymon)                                                -
-- ----------------------------------------------------------------
SELECT 
    T.nombre AS tipo, 
    ROUND(AVG(FM.cp), 2) AS promedio_cp
FROM 
    TIPO T
JOIN 
    FREAKYMON_TIPO FMT ON T.num_pk = FMT.num_tipo_pk_fk
JOIN 
    FREAKYMON FM ON FMT.id_freakymon_pk_fk = FM.id_pk
GROUP BY 
    T.nombre
ORDER BY 
    promedio_cp DESC;




-- ----------------------------------------------------------------
-- -  Muestra el total frekymone por categoria. (freakydex y      -
-- -  freakymon)                                                  -
-- ----------------------------------------------------------------
SELECT 
    T.nombre AS categoria, 
    COUNT(*) AS total_freakymones
FROM 
    TIPO T
JOIN 
    FREAKYMON_TIPO FMT ON T.num_pk = FMT.num_tipo_pk_fk
JOIN 
    FREAKYMON FM ON FMT.id_freakymon_pk_fk = FM.id_pk
GROUP BY 
    T.nombre
ORDER BY 
    total_freakymones DESC;






-- ----------------------------------------------------------------
-- -  Muestra el CP mayor por cada categoría que tenga el         -
-- -  freakydex.                                                  -
-- ----------------------------------------------------------------
SELECT 
    T.nombre AS categoria, 
    MAX(FM.cp) AS cp_maximo
FROM 
    TIPO T
JOIN 
    FREAKYMON_TIPO FMT ON T.num_pk = FMT.num_tipo_pk_fk
JOIN 
    FREAKYMON FM ON FMT.id_freakymon_pk_fk = FM.id_pk
GROUP BY 
    T.nombre
ORDER BY 
    cp_maximo DESC;



-- ----------------------------------------------------------------
-- -  Muestra todos los freakymones de una sola categoría cuyo    -
-- -  cp es mayor que el promedio de cp de ese mismo grupo.       -
-- ----------------------------------------------------------------
SELECT
    F.nombre AS freakymon,
    FM.cp AS cp
FROM
    TIPO T
JOIN
    FREAKYMON_TIPO FMT ON T.num_pk = FMT.num_tipo_pk_fk
JOIN
    FREAKYMON FM ON FMT.id_freakymon_pk_fk = FM.id_pk
JOIN
    FREAKYDEX F ON FM.id_freakydex_fk = F.id_pk
WHERE
    T.nombre = 'Fire'
    AND FM.cp > (
        SELECT
            AVG(FM2.cp)
        FROM
            FREAKYMON_TIPO FMT2
        JOIN
            FREAKYMON FM2 ON FMT2.id_freakymon_pk_fk = FM2.id_pk
        JOIN
            TIPO T2 ON FMT2.num_tipo_pk_fk = T2.num_pk
        WHERE
            T2.nombre = 'Fire'
    );



-- ----------------------------------------------------------------
-- -  Crea un View que tenga aquellos frekymones cuyo cp sea mayor-
-- -  del promedio general de todos.                              -
-- ----------------------------------------------------------------
CREATE OR REPLACE VIEW freakymon_cp_mayor_prom AS
SELECT 
    F.nombre AS freakymon, 
    FM.cp AS cp
FROM 
    FREAKYDEX F
JOIN 
    FREAKYMON FM ON F.id_pk = FM.id_freakydex_fk
WHERE 
    FM.cp > (SELECT AVG(cp) FROM FREAKYMON);


-- ----------------------------------------------------------------
-- -  Dar un SELECT * a ese view y ver que en efecto tienen un    -
-- -  CP sobre el promedio.                                       -
-- ----------------------------------------------------------------
SELECT * FROM freakymon_cp_mayor_prom;


-- ----------------------------------------------------------------
-- -  Muestra una descripción de los user_views que tienes        -
-- -  creados en la cuenta.                                       -
-- ----------------------------------------------------------------
DESC freakymon_cp_mayor_prom;

DESC user_views;


-- ----------------------------------------------------------------
-- -  Ejecuta un enunciado similar, pero utilizando la claúsula   -
-- -  SELECT.                                                     -
-- ----------------------------------------------------------------

SELECT view_name
FROM user_views;


-- ----------------------------------------------------------------
-- -  Crea un reporte (SQLPLUS) que muestre el nombre del         -
-- -  freakymon, su género, su cp, si tiene una estrella, su      -
-- -  altura y su peso. Debe romper control por el tipo de        -
-- -  freakymon. Debe mostrar totales por cada tipo de freakymon  -
-- -  y un gran total al final. Cada pagina debe tener 30 líneas  - 
-- -  y usted determina el ancho de la línea que sea más apropiado-
-- -  (TRABAJO PROFESIONAL) (10 pts)                              -
-- ----------------------------------------------------------------
SET LINESIZE 150

TTITLE 'Reporte de Freakymones por Tipo' SKIP 2

BREAK ON tipo SKIP 1 ON REPORT
COMPUTE SUM LABEL 'Subtotal:' OF cp ON tipo
COMPUTE SUM LABEL 'Gran Total:' OF cp ON REPORT

SELECT 
    T.nombre AS tipo, 
    F.nombre AS freakymon, 
    FM.genero, 
    FM.cp, 
    FM.estrella AS estrella, 
    FM.altura, 
    FM.peso
FROM 
    TIPO T
JOIN 
    FREAKYMON_TIPO FMT ON T.num_pk = FMT.num_tipo_pk_fk
JOIN 
    FREAKYMON FM ON FMT.id_freakymon_pk_fk = FM.id_pk
JOIN 
    FREAKYDEX F ON FM.id_freakydex_fk = F.id_pk
ORDER BY 
    tipo, cp DESC;

TTITLE OFF