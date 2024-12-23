-- ----------------------------------------------------------------
-- -   Author     : Nombre del estudiante                         -
-- -   Num.Est    : 841-00-0000                                   -
-- -   Curso      : SICI-4030                                     -
-- -   Sección    : XXX                                           -
-- -   Source     : ExamenPractico-1X-FORMATO-2023.sql            -
-- -   Comentario : Este script es para....(complete la oración)  -
-- ----------------------------------------------------------------
-- ----------------------------------------------------------------
-- -  EL SET ECHO ON permite ver la corrida en pantalla.         -
-- ----------------------------------------------------------------
SET ECHO ON
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Aquí se borran las tablas en caso de tener que volver a   -
-- -  crearlas, esta sub dividido por niveles.                    -
-- ----------------------------------------------------------------
DROP TABLE ATAQUE_FREAKYMON;
DROP TABLE FREAKYMON_TIPO;
DROP TABLE GYM_FREAKYMON;
DROP TABLE PELEA;
DROP TABLE GIRADA;


DROP TABLE INVENTARIO;
DROP TABLE FREAKYMON;
DROP TABLE FREAKYDEX;
DROP TABLE JUGADOR;


DROP TABLE CUENTA;
DROP TABLE ITEM;
DROP TABLE ATAQUE;
DROP TABLE FREAKYPARADA;
DROP TABLE GYM;
DROP TABLE TIPO;
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Creacion tabla TABLA-1 nivel-1 (Indicar el nivel SIEMPRE)  -
-- ----------------------------------------------------------------
CREATE TABLE CUENTA (
    celular_pk VARCHAR2(20) PRIMARY KEY,
    nombre VARCHAR2(50),
    password VARCHAR2(100),
    fecha_creacion DATE,
    ultimo_acceso DATE,
    intentos_fallidos NUMBER,
    fecha_expiracion DATE
);
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Creacion tabla TABLA-1 nivel-1 (Indicar el nivel SIEMPRE)  -
-- ----------------------------------------------------------------
CREATE TABLE ITEM (
    id_pk NUMBER PRIMARY KEY,
    nombre VARCHAR2(50),
    descripcion VARCHAR2(255)
);
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Creacion tabla TABLA-1 nivel-1 (Indicar el nivel SIEMPRE)  -
-- ----------------------------------------------------------------
CREATE TABLE TIPO (
    num_pk NUMBER PRIMARY KEY,
    nombre VARCHAR2(50),
    descripcion VARCHAR2(255)
);
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Creacion tabla TABLA-1 nivel-1 (Indicar el nivel SIEMPRE)  -
-- ----------------------------------------------------------------
CREATE TABLE ATAQUE (
    id_pk NUMBER PRIMARY KEY,
    num_tipo_fk NUMBER,
    nombre VARCHAR2(50),
    descripcion VARCHAR2(255),
    FOREIGN KEY (num_tipo_fk) REFERENCES TIPO(num_pk)
);
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Creacion tabla TABLA-1 nivel-1 (Indicar el nivel SIEMPRE)  -
-- ----------------------------------------------------------------
CREATE TABLE GYM (
    id_pk NUMBER PRIMARY KEY,
    nombre VARCHAR2(50),
    descripcion VARCHAR2(45),
    latitud NUMBER,
    longitud NUMBER
);
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Creacion tabla TABLA-1 nivel-1 (Indicar el nivel SIEMPRE)  -
-- ----------------------------------------------------------------
CREATE TABLE FREAKYPARADA (
    id_pk NUMBER PRIMARY KEY,
    nombre VARCHAR2(50),
    descripcion VARCHAR2(45),
    latitud NUMBER,
    longitud NUMBER,
    comentarios VARCHAR2(45)
);
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Creacion tabla TABLA-2 nivel-2(Indicar el nivel SIEMPRE)   -
-- ----------------------------------------------------------------
CREATE TABLE JUGADOR (
    celular_cuenta_pk_fk VARCHAR2(20),
    nombre VARCHAR2(50),
    inicial CHAR(1),
    apellido VARCHAR2(50),
    calle VARCHAR2(100),
    ciudad VARCHAR2(50),
    estado VARCHAR2(50),
    zip_code VARCHAR2(10),
    color VARCHAR2(20),
    fecha_nacimiento DATE,
    comentarios VARCHAR2(255),
    PRIMARY KEY (celular_cuenta_pk_fk),
    FOREIGN KEY (celular_cuenta_pk_fk) REFERENCES CUENTA(celular_pk)
);
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Creacion tabla TABLA-2 nivel-2(Indicar el nivel SIEMPRE)   -
-- ----------------------------------------------------------------
CREATE TABLE INVENTARIO (
    celular_cuenta_jugador_pk_fk VARCHAR2(20),
    id_item_pk_fk NUMBER,
    cantidad NUMBER,
    PRIMARY KEY (celular_cuenta_jugador_pk_fk, id_item_pk_fk),
    FOREIGN KEY (celular_cuenta_jugador_pk_fk) REFERENCES JUGADOR(celular_cuenta_pk_fk),
    FOREIGN KEY (id_item_pk_fk) REFERENCES ITEM(id_pk)
);
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Creacion tabla TABLA-2 nivel-2(Indicar el nivel SIEMPRE)   -
-- ----------------------------------------------------------------
CREATE TABLE FREAKYDEX (
    id_pk NUMBER PRIMARY KEY,
    celular_cuenta_jugador_pk_fk VARCHAR2(20),
    evolucion_fk NUMBER,
    nombre VARCHAR2(50),
    dulces NUMBER,
    dulcesxl NUMBER,
    cp NUMBER,
    FOREIGN KEY (celular_cuenta_jugador_pk_fk) REFERENCES JUGADOR(celular_cuenta_pk_fk)
);
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Creacion tabla TABLA-2 nivel-2(Indicar el nivel SIEMPRE)   -
-- ----------------------------------------------------------------
CREATE TABLE FREAKYMON (
    id_pk NUMBER PRIMARY KEY,
    id_freakydex_fk NUMBER,
    genero CHAR(1),
    hp NUMBER,
    calle VARCHAR2(25),
    ciudad VARCHAR2(50),
    estado VARCHAR2(25),
    pais VARCHAR2(25),
    fecha DATE,
    cp VARCHAR2(10),
    victorias NUMBER,
    estrella CHAR(1),
    altura NUMBER,
    peso NUMBER,
    FOREIGN KEY (id_freakydex_fk) REFERENCES FREAKYDEX(id_pk)
);
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Creacion tabla tabla-3    nivel-3(Indicar el nivel SIEMPRE)-
-- ----------------------------------------------------------------
CREATE TABLE GIRADA (
    celular_cuenta_jugador_pk_fk VARCHAR2(20),
    id_item_pk_fk NUMBER,
    id_gym_fk NUMBER,
    id_parada_fk NUMBER,
    fecha_hora DATE,
    cantidad_items NUMBER,
    PRIMARY KEY (celular_cuenta_jugador_pk_fk, id_item_pk_fk, id_gym_fk, id_parada_fk, fecha_hora),
    FOREIGN KEY (celular_cuenta_jugador_pk_fk) REFERENCES JUGADOR(celular_cuenta_pk_fk),
    FOREIGN KEY (id_item_pk_fk) REFERENCES ITEM(id_pk),
    FOREIGN KEY (id_gym_fk) REFERENCES GYM(id_pk),
    FOREIGN KEY (id_parada_fk) REFERENCES FREAKYPARADA(id_pk)
);
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Creacion tabla tabla-3    nivel-3(Indicar el nivel SIEMPRE)-
-- ----------------------------------------------------------------
CREATE TABLE PELEA (
    id_gym_pk_fk NUMBER,
    id_freakymon_pk_fk1 NUMBER,
    id_freakymon_pk_fk2 NUMBER,
    fecha_hora_pk DATE,
    PRIMARY KEY (id_gym_pk_fk, id_freakymon_pk_fk1, id_freakymon_pk_fk2, fecha_hora_pk),
    FOREIGN KEY (id_gym_pk_fk) REFERENCES GYM(id_pk),
    FOREIGN KEY (id_freakymon_pk_fk1) REFERENCES FREAKYMON(id_pk),
    FOREIGN KEY (id_freakymon_pk_fk2) REFERENCES FREAKYMON(id_pk)
);
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Creacion tabla tabla-3    nivel-3(Indicar el nivel SIEMPRE)-
-- ----------------------------------------------------------------
CREATE TABLE GYM_FREAKYMON (
    id_gym_pk_fk NUMBER,
    id_freakymon_pk_fk NUMBER,
    fecha_captura DATE,
    fecha_derrota DATE,
    PRIMARY KEY (id_gym_pk_fk, id_freakymon_pk_fk),
    FOREIGN KEY (id_gym_pk_fk) REFERENCES GYM(id_pk),
    FOREIGN KEY (id_freakymon_pk_fk) REFERENCES FREAKYMON(id_pk)
);
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Creacion tabla tabla-3    nivel-3(Indicar el nivel SIEMPRE)-
-- ----------------------------------------------------------------
CREATE TABLE FREAKYMON_TIPO (
    id_freakymon_pk_fk NUMBER,
    num_tipo_pk_fk NUMBER,
    PRIMARY KEY (id_freakymon_pk_fk, num_tipo_pk_fk),
    FOREIGN KEY (id_freakymon_pk_fk) REFERENCES FREAKYMON(id_pk),
    FOREIGN KEY (num_tipo_pk_fk) REFERENCES TIPO(num_pk)
);
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Creacion tabla tabla-3    nivel-3(Indicar el nivel SIEMPRE)-
-- ----------------------------------------------------------------
CREATE TABLE ATAQUE_FREAKYMON (
    id_freakymon_pk_fk NUMBER,
    id_ataque_pk_fk NUMBER,
    valor NUMBER,
    PRIMARY KEY (id_freakymon_pk_fk, id_ataque_pk_fk),
    FOREIGN KEY (id_freakymon_pk_fk) REFERENCES FREAKYMON(id_pk),
    FOREIGN KEY (id_ataque_pk_fk) REFERENCES ATAQUE(id_pk)
);
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Insertar datos tabla: TABLA-1                              -
-- ----------------------------------------------------------------
INSERT INTO CUENTA VALUES ('1234567890', 'Ash Ketchum', 'pikachu123', TO_DATE('01-Jan-2020', 'DD-MON-YYYY'), TO_DATE('01-Jan-2024', 'DD-MON-YYYY'), 0, TO_DATE('31-Dec-2025', 'DD-MON-YYYY'));
INSERT INTO CUENTA VALUES ('0987654321', 'Misty Waterflower', 'psyduck123', TO_DATE('01-Jan-2021', 'DD-MON-YYYY'), TO_DATE('01-Jan-2024', 'DD-MON-YYYY'), 1, TO_DATE('31-Dec-2025', 'DD-MON-YYYY'));
INSERT INTO CUENTA VALUES ('1122334455', 'Brock Slate', 'onix456', TO_DATE('01-Jan-2022', 'DD-MON-YYYY'), TO_DATE('01-Jan-2024', 'DD-MON-YYYY'), 0, TO_DATE('31-Dec-2025', 'DD-MON-YYYY'));
INSERT INTO CUENTA VALUES ('5566778899', 'Gary Oak', 'umbreon789', TO_DATE('01-Feb-2020', 'DD-MON-YYYY'), TO_DATE('01-Jan-2024', 'DD-MON-YYYY'), 2, TO_DATE('31-Dec-2025', 'DD-MON-YYYY'));
INSERT INTO CUENTA VALUES ('6677889900', 'Tracey Sketchit', 'scyther001', TO_DATE('01-Mar-2020', 'DD-MON-YYYY'), TO_DATE('01-Jan-2024', 'DD-MON-YYYY'), 0, TO_DATE('31-Dec-2025', 'DD-MON-YYYY'));
INSERT INTO CUENTA VALUES ('7788990011', 'May Maple', 'torchic123', TO_DATE('01-Apr-2020', 'DD-MON-YYYY'), TO_DATE('01-Jan-2024', 'DD-MON-YYYY'), 1, TO_DATE('31-Dec-2025', 'DD-MON-YYYY'));
INSERT INTO CUENTA VALUES ('8899001122', 'Dawn Berlitz', 'piplup234', TO_DATE('01-May-2020', 'DD-MON-YYYY'), TO_DATE('01-Jan-2024', 'DD-MON-YYYY'), 0, TO_DATE('31-Dec-2025', 'DD-MON-YYYY'));
INSERT INTO CUENTA VALUES ('9900112233', 'Serena Yvonne', 'fennekin345', TO_DATE('01-Jun-2020', 'DD-MON-YYYY'), TO_DATE('01-Jan-2024', 'DD-MON-YYYY'), 2, TO_DATE('31-Dec-2025', 'DD-MON-YYYY'));
INSERT INTO CUENTA VALUES ('1010101010', 'Clemont Eureka', 'heliolisk567', TO_DATE('01-Jul-2020', 'DD-MON-YYYY'), TO_DATE('01-Jan-2024', 'DD-MON-YYYY'), 0, TO_DATE('31-Dec-2025', 'DD-MON-YYYY'));
INSERT INTO CUENTA VALUES ('1111111111', 'Lillie Aether', 'vulpix678', TO_DATE('01-Aug-2020', 'DD-MON-YYYY'), TO_DATE('01-Jan-2024', 'DD-MON-YYYY'), 1, TO_DATE('31-Dec-2025', 'DD-MON-YYYY'));
INSERT INTO CUENTA VALUES ('1212121212', 'James Rocket', 'weezing123', TO_DATE('01-Sep-2020', 'DD-MON-YYYY'), TO_DATE('01-Jan-2024', 'DD-MON-YYYY'), 0, TO_DATE('31-Dec-2025', 'DD-MON-YYYY'));
INSERT INTO CUENTA VALUES ('1313131313', 'Jessie Rocket', 'arbok321', TO_DATE('01-Oct-2020', 'DD-MON-YYYY'), TO_DATE('01-Jan-2024', 'DD-MON-YYYY'), 1, TO_DATE('31-Dec-2025', 'DD-MON-YYYY'));
INSERT INTO CUENTA VALUES ('1414141414', 'Professor Oak', 'pokedex456', TO_DATE('01-Nov-2020', 'DD-MON-YYYY'), TO_DATE('01-Jan-2024', 'DD-MON-YYYY'), 0, TO_DATE('31-Dec-2025', 'DD-MON-YYYY'));
INSERT INTO CUENTA VALUES ('1515151515', 'Professor Elm', 'totodile789', TO_DATE('01-Dec-2020', 'DD-MON-YYYY'), TO_DATE('01-Jan-2024', 'DD-MON-YYYY'), 1, TO_DATE('31-Dec-2025', 'DD-MON-YYYY'));
INSERT INTO CUENTA VALUES ('1616161616', 'Professor Birch', 'treecko456', TO_DATE('01-Jan-2021', 'DD-MON-YYYY'), TO_DATE('01-Jan-2024', 'DD-MON-YYYY'), 0, TO_DATE('31-Dec-2025', 'DD-MON-YYYY'));
INSERT INTO CUENTA VALUES ('1717171717', 'Professor Rowan', 'turtwig654', TO_DATE('01-Feb-2021', 'DD-MON-YYYY'), TO_DATE('01-Jan-2024', 'DD-MON-YYYY'), 2, TO_DATE('31-Dec-2025', 'DD-MON-YYYY'));
INSERT INTO CUENTA VALUES ('1818181818', 'Professor Juniper', 'snivy123', TO_DATE('01-Mar-2021', 'DD-MON-YYYY'), TO_DATE('01-Jan-2024', 'DD-MON-YYYY'), 1, TO_DATE('31-Dec-2025', 'DD-MON-YYYY'));
INSERT INTO CUENTA VALUES ('1919191919', 'Professor Sycamore', 'chespin789', TO_DATE('01-Apr-2021', 'DD-MON-YYYY'), TO_DATE('01-Jan-2024', 'DD-MON-YYYY'), 0, TO_DATE('31-Dec-2025', 'DD-MON-YYYY'));
INSERT INTO CUENTA VALUES ('2020202020', 'Professor Kukui', 'rowlet123', TO_DATE('01-May-2021', 'DD-MON-YYYY'), TO_DATE('01-Jan-2024', 'DD-MON-YYYY'), 1, TO_DATE('31-Dec-2025', 'DD-MON-YYYY'));
INSERT INTO CUENTA VALUES ('2121212121', 'Professor Magnolia', 'grookey321', TO_DATE('01-Jun-2021', 'DD-MON-YYYY'), TO_DATE('01-Jan-2024', 'DD-MON-YYYY'), 2, TO_DATE('31-Dec-2025', 'DD-MON-YYYY'));

-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Datos de la tabla TABLA-2                                  -
-- ----------------------------------------------------------------
INSERT INTO ITEM VALUES (1, 'Potion', 'Restores 20 HP.');
INSERT INTO ITEM VALUES (2, 'Super Potion', 'Restores 50 HP.');
INSERT INTO ITEM VALUES (3, 'Hyper Potion', 'Restores 120 HP.');
INSERT INTO ITEM VALUES (4, 'Max Potion', 'Restores all HP.');
INSERT INTO ITEM VALUES (5, 'Revive', 'Revives a fainted Pokémon with half HP.');
INSERT INTO ITEM VALUES (6, 'Max Revive', 'Revives a fainted Pokémon with full HP.');
INSERT INTO ITEM VALUES (7, 'Antidote', 'Cures a poisoned Pokémon.');
INSERT INTO ITEM VALUES (8, 'Paralyze Heal', 'Cures a paralyzed Pokémon.');
INSERT INTO ITEM VALUES (9, 'Burn Heal', 'Cures a burned Pokémon.');
INSERT INTO ITEM VALUES (10, 'Ice Heal', 'Cures a frozen Pokémon.');
INSERT INTO ITEM VALUES (11, 'Full Restore', 'Restores all HP and cures all status conditions.');
INSERT INTO ITEM VALUES (12, 'Rare Candy', 'Increases a Pokémons level by 1');
INSERT INTO ITEM VALUES (13, 'PP Up', 'Increases the max PP of a selected move.');
INSERT INTO ITEM VALUES (14, 'PP Max', 'Maximizes the PP of a selected move.');
INSERT INTO ITEM VALUES (15, 'Escape Rope', 'Allows instant escape from caves and dungeons.');
INSERT INTO ITEM VALUES (16, 'Repel', 'Prevents weak wild Pokémon from appearing for 100 steps.');
INSERT INTO ITEM VALUES (17, 'Super Repel', 'Prevents weak wild Pokémon from appearing for 200 steps.');
INSERT INTO ITEM VALUES (18, 'Max Repel', 'Prevents weak wild Pokémon from appearing for 250 steps.');
INSERT INTO ITEM VALUES (19, 'Poké Ball', 'A device for catching wild Pokémon.');
INSERT INTO ITEM VALUES (20, 'Great Ball', 'A better ball for catching Pokémon than a Poké Ball.');

-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Datos de la tabla TABLA-3                                 -
-- ----------------------------------------------------------------
INSERT INTO TIPO VALUES (1, 'Normal', 'No special abilities.');
INSERT INTO TIPO VALUES (2, 'Fire', 'Strong against Grass, weak to Water.');
INSERT INTO TIPO VALUES (3, 'Water', 'Strong against Fire, weak to Electric.');
INSERT INTO TIPO VALUES (4, 'Electric', 'Strong against Water, weak to Ground.');
INSERT INTO TIPO VALUES (5, 'Grass', 'Strong against Water, weak to Fire.');
INSERT INTO TIPO VALUES (6, 'Ice', 'Strong against Flying, weak to Fire.');
INSERT INTO TIPO VALUES (7, 'Fighting', 'Strong against Normal, weak to Psychic.');
INSERT INTO TIPO VALUES (8, 'Poison', 'Strong against Grass, weak to Ground.');
INSERT INTO TIPO VALUES (9, 'Ground', 'Strong against Electric, weak to Water.');
INSERT INTO TIPO VALUES (10, 'Flying', 'Strong against Fighting, weak to Electric.');
INSERT INTO TIPO VALUES (11, 'Psychic', 'Strong against Fighting, weak to Dark.');
INSERT INTO TIPO VALUES (12, 'Bug', 'Strong against Grass, weak to Fire.');
INSERT INTO TIPO VALUES (13, 'Rock', 'Strong against Flying, weak to Water.');
INSERT INTO TIPO VALUES (14, 'Ghost', 'Strong against Psychic, weak to Dark.');
INSERT INTO TIPO VALUES (15, 'Dragon', 'Strong against Dragon, weak to Fairy.');
INSERT INTO TIPO VALUES (16, 'Dark', 'Strong against Psychic, weak to Fighting.');
INSERT INTO TIPO VALUES (17, 'Steel', 'Strong against Rock, weak to Fire.');
INSERT INTO TIPO VALUES (18, 'Fairy', 'Strong against Dragon, weak to Poison.');
INSERT INTO TIPO VALUES (19, 'Shadow', 'Special type used in certain Pokémon games.');
INSERT INTO TIPO VALUES (20, 'Unknown', 'Used for placeholder or mystery Pokémon.');

-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Datos de la tabla TABLA-4                                  -
-- ----------------------------------------------------------------
INSERT INTO ATAQUE VALUES (1, 4, 'Thunderbolt', 'A strong Electric-type move.');
INSERT INTO ATAQUE VALUES (2, 2, 'Flamethrower', 'A strong Fire-type move.');
INSERT INTO ATAQUE VALUES (3, 3, 'Hydro Pump', 'A strong Water-type move.');
INSERT INTO ATAQUE VALUES (4, 5, 'Solar Beam', 'A powerful Grass-type move.');
INSERT INTO ATAQUE VALUES (5, 6, 'Ice Beam', 'A strong Ice-type move.');
INSERT INTO ATAQUE VALUES (6, 7, 'Close Combat', 'A powerful Fighting-type move.');
INSERT INTO ATAQUE VALUES (7, 8, 'Sludge Bomb', 'A strong Poison-type move.');
INSERT INTO ATAQUE VALUES (8, 9, 'Earthquake', 'A strong Ground-type move.');
INSERT INTO ATAQUE VALUES (9, 10, 'Air Slash', 'A Flying-type move that may cause flinching.');
INSERT INTO ATAQUE VALUES (10, 11, 'Psychic', 'A strong Psychic-type move.');
INSERT INTO ATAQUE VALUES (11, 12, 'Bug Buzz', 'A strong Bug-type move.');
INSERT INTO ATAQUE VALUES (12, 13, 'Stone Edge', 'A strong Rock-type move with a high critical hit rate.');
INSERT INTO ATAQUE VALUES (13, 14, 'Shadow Ball', 'A Ghost-type move that lowers Special Defense.');
INSERT INTO ATAQUE VALUES (14, 15, 'Dragon Claw', 'A Dragon-type move that deals high damage.');
INSERT INTO ATAQUE VALUES (15, 16, 'Dark Pulse', 'A Dark-type move that may cause flinching.');
INSERT INTO ATAQUE VALUES (16, 17, 'Flash Cannon', 'A Steel-type move that may lower Special Defense.');
INSERT INTO ATAQUE VALUES (17, 18, 'Moonblast', 'A Fairy-type move that lowers Special Attack.');
INSERT INTO ATAQUE VALUES (18, 2, 'Fire Blast', 'A powerful Fire-type move.');
INSERT INTO ATAQUE VALUES (19, 3, 'Surf', 'A strong Water-type move that hits all Pokémon in battle.');
INSERT INTO ATAQUE VALUES (20, 4, 'Volt Tackle', 'A powerful Electric-type move that causes recoil damage.');

-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Datos de la tabla TABLA-4                                  -
-- ----------------------------------------------------------------
INSERT INTO GYM VALUES (1, 'Pewter Gym', 'Rock-type Gym led by Brock.', 35.012, -118.493);
INSERT INTO GYM VALUES (2, 'Cerulean Gym', 'Water-type Gym led by Misty.', 34.013, -118.494);
INSERT INTO GYM VALUES (3, 'Vermilion Gym', 'Electric-type Gym led by Lt. Surge.', 34.014, -118.495);
INSERT INTO GYM VALUES (4, 'Celadon Gym', 'Grass-type Gym led by Erika.', 34.015, -118.496);
INSERT INTO GYM VALUES (5, 'Fuchsia Gym', 'Poison-type Gym led by Koga.', 34.016, -118.497);
INSERT INTO GYM VALUES (6, 'Cinnabar Gym', 'Fire-type Gym led by Blaine.', 34.017, -118.498);
INSERT INTO GYM VALUES (7, 'Saffron Gym', 'Psychic-type Gym led by Sabrina.', 34.018, -118.499);
INSERT INTO GYM VALUES (8, 'Viridian Gym', 'Ground-type Gym led by Giovanni.', 34.019, -118.500);
INSERT INTO GYM VALUES (9, 'Ecruteak Gym', 'Ghost-type Gym led by Morty.', 34.020, -118.501);
INSERT INTO GYM VALUES (10, 'Goldenrod Gym', 'Normal-type Gym led by Whitney.', 34.021, -118.502);
INSERT INTO GYM VALUES (11, 'Mauville Gym', 'Electric-type Gym led by Wattson.', 34.022, -118.503);
INSERT INTO GYM VALUES (12, 'Lavaridge Gym', 'Fire-type Gym led by Flannery.', 34.023, -118.504);
INSERT INTO GYM VALUES (13, 'Fortree Gym', 'Flying-type Gym led by Winona.', 34.024, -118.505);
INSERT INTO GYM VALUES (14, 'Mossdeep Gym', 'Psychic-type Gym led by Tate and Liza.', 34.025, -118.506);
INSERT INTO GYM VALUES (15, 'Snowpoint Gym', 'Ice-type Gym led by Candice.', 34.026, -118.507);
INSERT INTO GYM VALUES (16, 'Sunyshore Gym', 'Electric-type Gym led by Volkner.', 34.027, -118.508);
INSERT INTO GYM VALUES (17, 'Opelucid Gym', 'Dragon-type Gym led by Iris.', 34.028, -118.509);
INSERT INTO GYM VALUES (18, 'Hammerlocke Gym', 'Dragon-type Gym led by Raihan.', 34.029, -118.510);
INSERT INTO GYM VALUES (19, 'Stow-on-Side Gym', 'Fighting-type Gym led by Bea.', 34.030, -118.511);
INSERT INTO GYM VALUES (20, 'Spikemuth Gym', 'Dark-type Gym led by Piers.', 34.031, -118.512);

-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Datos de la tabla TABLA-4                                  -
-- ----------------------------------------------------------------
INSERT INTO FREAKYPARADA VALUES (1, 'Viridian Park', 'A peaceful park with many Pokémon.', 37.7749, -122.4194, 'Located near the Pokémon Center.');
INSERT INTO FREAKYPARADA VALUES (2, 'Pallet Fountain', 'A beautiful fountain in the town square.', 37.8044, -122.2712, 'Great spot for finding Water-types.');
INSERT INTO FREAKYPARADA VALUES (3, 'Cerulean Pier', 'A bustling pier by the ocean.', 37.3382, -121.8863, 'Home to many Water-type Pokémon.');
INSERT INTO FREAKYPARADA VALUES (4, 'Pewter Statue', 'A statue of a famous Rock-type Pokémon.', 34.0522, -118.2437, 'Located near Pewter Gym.');
INSERT INTO FREAKYPARADA VALUES (5, 'Celadon Gardens', 'A lush garden with Grass-type Pokémon.', 36.7783, -119.4179, 'Popular among Grass-type trainers.');
INSERT INTO FREAKYPARADA VALUES (6, 'Fuchsia Reserve', 'A protected area for rare Pokémon.', 32.7157, -117.1611, 'Home to many Poison-types.');
INSERT INTO FREAKYPARADA VALUES (7, 'Cinnabar Volcano', 'A volcanic area with Fire-types.', 40.7128, -74.0060, 'Popular among Fire-type trainers.');
INSERT INTO FREAKYPARADA VALUES (8, 'Saffron Plaza', 'A central plaza in the city.', 34.0522, -118.2437, 'Busy and full of Psychic-types.');
INSERT INTO FREAKYPARADA VALUES (9, 'Goldenrod Station', 'A historic train station.', 42.3601, -71.0589, 'Frequented by Normal-types.');
INSERT INTO FREAKYPARADA VALUES (10, 'Ecruteak Tower', 'An ancient tower.', 34.0522, -118.2437, 'Rumored to host Ghost-types.');
INSERT INTO FREAKYPARADA VALUES (11, 'Mauville Center', 'A bustling commercial hub.', 37.7749, -122.4194, 'Electric-types love this place.');
INSERT INTO FREAKYPARADA VALUES (12, 'Fortree Canopy', 'A treehouse area in the forest.', 34.0522, -118.2437, 'Home to many Flying-types.');
INSERT INTO FREAKYPARADA VALUES (13, 'Snowpoint Glade', 'A snowy glade with Ice-types.', 36.7783, -119.4179, 'Great for Ice-type trainers.');
INSERT INTO FREAKYPARADA VALUES (14, 'Sunyshore Market', 'A coastal market.', 34.0522, -118.2437, 'Electric-types are abundant here.');
INSERT INTO FREAKYPARADA VALUES (15, 'Hammerlocke Archway', 'A grand archway in the city.', 34.0522, -118.2437, 'Dragon-types often appear here.');
INSERT INTO FREAKYPARADA VALUES (16, 'Stow-on-Side Bazaar', 'A busy outdoor market.', 34.0522, -118.2437, 'Popular among Fighting-type trainers.');
INSERT INTO FREAKYPARADA VALUES (17, 'Spikemuth Alley', 'A shadowy alley.', 34.0522, -118.2437, 'Dark-types can be found here.');
INSERT INTO FREAKYPARADA VALUES (18, 'Opelucid Square', 'A central square in the city.', 34.0522, -118.2437, 'Frequented by Dragon-types.');
INSERT INTO FREAKYPARADA VALUES (19, 'Lavender Tower', 'A tower dedicated to departed Pokémon.', 34.0522, -118.2437, 'A haven for Ghost-types.');
INSERT INTO FREAKYPARADA VALUES (20, 'Rustboro Pathway', 'A scenic pathway in the city.', 37.7749, -122.4194, 'Rock-types are commonly seen here.');

-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Datos de la tabla TABLA-4                                  -
-- ----------------------------------------------------------------
INSERT INTO JUGADOR VALUES ('1234567890', 'Ash', 'K', 'Ketchum', 'Pallet Town', 'Kanto', 'Active', '12345', 'Red', TO_DATE('15-May-1997', 'DD-MON-YYYY'), 'A determined Pokémon Trainer.');
INSERT INTO JUGADOR VALUES ('0987654321', 'Misty', 'W', 'Waterflower', 'Cerulean City', 'Kanto', 'Active', '12346', 'Blue', TO_DATE('23-Jul-1998', 'DD-MON-YYYY'), 'A Gym Leader specializing in Water-types.');
INSERT INTO JUGADOR VALUES ('1122334455', 'Brock', 'S', 'Slate', 'Pewter City', 'Kanto', 'Active', '12347', 'Brown', TO_DATE('12-Feb-1995', 'DD-MON-YYYY'), 'A Gym Leader specializing in Rock-types.');
INSERT INTO JUGADOR VALUES ('5566778899', 'Gary', 'O', 'Oak', 'Pallet Town', 'Kanto', 'Active', '12348', 'Green', TO_DATE('24-Mar-1996', 'DD-MON-YYYY'), 'Ashs rival and a strong trainer.');
INSERT INTO JUGADOR VALUES ('6677889900', 'Tracey', 'S', 'Sketchit', 'Pallet Town', 'Kanto', 'Active', '12349', 'White', TO_DATE('30-Apr-1995', 'DD-MON-YYYY'), 'A Pokémon Watcher.');
INSERT INTO JUGADOR VALUES ('7788990011', 'May', 'M', 'Maple', 'Littleroot Town', 'Hoenn', 'Active', '12350', 'Yellow', TO_DATE('21-Jun-1997', 'DD-MON-YYYY'), 'A skilled Pokémon Coordinator.');
INSERT INTO JUGADOR VALUES ('8899001122', 'Dawn', 'B', 'Berlitz', 'Twinleaf Town', 'Sinnoh', 'Active', '12351', 'Blue', TO_DATE('10-Oct-1998', 'DD-MON-YYYY'), 'A talented Pokémon Coordinator.');
INSERT INTO JUGADOR VALUES ('9900112233', 'Serena', 'Y', 'Yvonne', 'Vaniville Town', 'Kalos', 'Active', '12352', 'Pink', TO_DATE('19-Jan-1999', 'DD-MON-YYYY'), 'A skilled Pokémon Performer.');
INSERT INTO JUGADOR VALUES ('1010101010', 'Clemont', 'E', 'Eureka', 'Lumiose City', 'Kalos', 'Active', '12353', 'Yellow', TO_DATE('07-Sep-2000', 'DD-MON-YYYY'), 'An Electric-type Gym Leader.');
INSERT INTO JUGADOR VALUES ('1111111111', 'Lillie', 'A', 'Aether', 'Hauoli City', 'Alola', 'Active', '12354', 'Green', TO_DATE('18-Nov-2000', 'DD-MON-YYYY'), 'A kind-hearted Pokémon Trainer.');
INSERT INTO JUGADOR VALUES ('1212121212', 'James', 'R', 'Rocket', 'Unknown', 'Kanto', 'Active', '12355', 'Purple', TO_DATE('05-Mar-1989', 'DD-MON-YYYY'), 'Member of Team Rocket.');
INSERT INTO JUGADOR VALUES ('1313131313', 'Jessie', 'R', 'Rocket', 'Unknown', 'Kanto', 'Active', '12356', 'Pink', TO_DATE('14-Apr-1988', 'DD-MON-YYYY'), 'Member of Team Rocket.');
INSERT INTO JUGADOR VALUES ('1414141414', 'Professor', 'S', 'Oak', 'Pallet Town', 'Kanto', 'Active', '12357', 'Gray', TO_DATE('05-Sep-1960', 'DD-MON-YYYY'), 'A world-renowned Pokémon Professor.');
INSERT INTO JUGADOR VALUES ('1515151515', 'Professor', 'E', 'Elm', 'New Bark Town', 'Johto', 'Active', '12358', 'Brown', TO_DATE('17-Jan-1965', 'DD-MON-YYYY'), 'An expert on Pokémon breeding.');
INSERT INTO JUGADOR VALUES ('1616161616', 'Professor', 'B', 'Birch', 'Littleroot Town', 'Hoenn', 'Active', '12359', 'Green', TO_DATE('11-Mar-1972', 'DD-MON-YYYY'), 'A field researcher studying Pokémon habitats.');
INSERT INTO JUGADOR VALUES ('1717171717', 'Professor', 'R', 'Rowan', 'Sandgem Town', 'Sinnoh', 'Active', '12360', 'White', TO_DATE('02-Jul-1950', 'DD-MON-YYYY'), 'An expert in Pokémon evolution.');
INSERT INTO JUGADOR VALUES ('1818181818', 'Professor', 'J', 'Juniper', 'Nuvema Town', 'Unova', 'Active', '12361', 'Brown', TO_DATE('23-Aug-1978', 'DD-MON-YYYY'), 'A researcher specializing in Pokémon origins.');
INSERT INTO JUGADOR VALUES ('1919191919', 'Professor', 'S', 'Sycamore', 'Lumiose City', 'Kalos', 'Active', '12362', 'Blue', TO_DATE('15-Nov-1980', 'DD-MON-YYYY'), 'An expert in Mega Evolution.');
INSERT INTO JUGADOR VALUES ('2020202020', 'Professor', 'K', 'Kukui', 'Iki Town', 'Alola', 'Active', '12363', 'Yellow', TO_DATE('04-Feb-1985', 'DD-MON-YYYY'), 'A specialist in Pokémon moves.');
INSERT INTO JUGADOR VALUES ('2121212121', 'Professor', 'M', 'Magnolia', 'Postwick', 'Galar', 'Active', '12364', 'White', TO_DATE('12-Dec-1945', 'DD-MON-YYYY'), 'An expert in Dynamax energy.');

-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Datos de la tabla TABLA-4                                  -
-- ----------------------------------------------------------------
INSERT INTO INVENTARIO VALUES ('1234567890', 1, 10);
INSERT INTO INVENTARIO VALUES ('0987654321', 2, 5);
INSERT INTO INVENTARIO VALUES ('1122334455', 3, 2);
INSERT INTO INVENTARIO VALUES ('5566778899', 4, 1);
INSERT INTO INVENTARIO VALUES ('6677889900', 5, 3);
INSERT INTO INVENTARIO VALUES ('7788990011', 6, 1);
INSERT INTO INVENTARIO VALUES ('8899001122', 7, 15);
INSERT INTO INVENTARIO VALUES ('9900112233', 8, 10);
INSERT INTO INVENTARIO VALUES ('1010101010', 9, 5);
INSERT INTO INVENTARIO VALUES ('1111111111', 10, 4);
INSERT INTO INVENTARIO VALUES ('1212121212', 11, 2);
INSERT INTO INVENTARIO VALUES ('1313131313', 12, 8);
INSERT INTO INVENTARIO VALUES ('1414141414', 13, 3);
INSERT INTO INVENTARIO VALUES ('1515151515', 14, 1);
INSERT INTO INVENTARIO VALUES ('1616161616', 15, 6);
INSERT INTO INVENTARIO VALUES ('1717171717', 16, 20);
INSERT INTO INVENTARIO VALUES ('1818181818', 17, 10);
INSERT INTO INVENTARIO VALUES ('1919191919', 18, 5);
INSERT INTO INVENTARIO VALUES ('2020202020', 19, 50);
INSERT INTO INVENTARIO VALUES ('2121212121', 20, 25);

-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Datos de la tabla TABLA-4                                  -
-- ----------------------------------------------------------------
INSERT INTO FREAKYDEX VALUES (1, '1234567890', NULL, 'Pikachu', 50, 5, 600);
INSERT INTO FREAKYDEX VALUES (2, '0987654321', 1, 'Raichu', 100, 10, 800);
INSERT INTO FREAKYDEX VALUES (3, '1122334455', NULL, 'Geodude', 30, 3, 400);
INSERT INTO FREAKYDEX VALUES (4, '5566778899', 3, 'Graveler', 80, 8, 700);
INSERT INTO FREAKYDEX VALUES (5, '6677889900', 4, 'Golem', 150, 15, 1100);
INSERT INTO FREAKYDEX VALUES (6, '7788990011', NULL, 'Torchic', 20, 2, 300);
INSERT INTO FREAKYDEX VALUES (7, '8899001122', 6, 'Combusken', 50, 5, 500);
INSERT INTO FREAKYDEX VALUES (8, '9900112233', 7, 'Blaziken', 120, 12, 900);
INSERT INTO FREAKYDEX VALUES (9, '1010101010', NULL, 'Magnemite', 40, 4, 450);
INSERT INTO FREAKYDEX VALUES (10, '1111111111', 9, 'Magneton', 90, 9, 750);
INSERT INTO FREAKYDEX VALUES (11, '1212121212', NULL, 'Ekans', 30, 3, 350);
INSERT INTO FREAKYDEX VALUES (12, '1313131313', 11, 'Arbok', 80, 8, 700);
INSERT INTO FREAKYDEX VALUES (13, '1414141414', NULL, 'Bulbasaur', 50, 5, 600);
INSERT INTO FREAKYDEX VALUES (14, '1515151515', 13, 'Ivysaur', 100, 10, 850);
INSERT INTO FREAKYDEX VALUES (15, '1616161616', 14, 'Venusaur', 200, 20, 1200);
INSERT INTO FREAKYDEX VALUES (16, '1717171717', NULL, 'Charmander', 40, 4, 550);
INSERT INTO FREAKYDEX VALUES (17, '1818181818', 16, 'Charmeleon', 90, 9, 800);
INSERT INTO FREAKYDEX VALUES (18, '1919191919', 17, 'Charizard', 150, 15, 1100);
INSERT INTO FREAKYDEX VALUES (19, '2020202020', NULL, 'Squirtle', 50, 5, 600);
INSERT INTO FREAKYDEX VALUES (20, '2121212121', 19, 'Wartortle', 100, 10, 850);

-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Datos de la tabla TABLA-4                                  -
-- ----------------------------------------------------------------
INSERT INTO FREAKYMON VALUES (1, 1, 'M', 35, 'Pallet Street', 'Pallet Town', 'Kanto', 'Japan', TO_DATE('01-Jan-2023', 'DD-MON-YYYY'), '600', 10, 'Y', 0.4, 6.0);
INSERT INTO FREAKYMON VALUES (2, 2, 'M', 60, 'Route 24', 'Cerulean City', 'Kanto', 'Japan', TO_DATE('15-Feb-2023', 'DD-MON-YYYY'), '800', 15, 'N', 0.8, 30.0);
INSERT INTO FREAKYMON VALUES (3, 3, 'F', 40, 'Pewter Path', 'Pewter City', 'Kanto', 'Japan', TO_DATE('10-Mar-2023', 'DD-MON-YYYY'), '400', 5, 'Y', 0.4, 20.0);
INSERT INTO FREAKYMON VALUES (4, 4, 'F', 70, 'Victory Road', 'Viridian City', 'Kanto', 'Japan', TO_DATE('22-Mar-2023', 'DD-MON-YYYY'), '700', 20, 'N', 1.0, 60.0);
INSERT INTO FREAKYMON VALUES (5, 5, 'M', 100, 'Cinnabar Island', 'Cinnabar', 'Kanto', 'Japan', TO_DATE('05-Apr-2023', 'DD-MON-YYYY'), '1100', 25, 'N', 1.4, 80.0);
INSERT INTO FREAKYMON VALUES (6, 6, 'F', 20, 'Route 101', 'Littleroot', 'Hoenn', 'Japan', TO_DATE('12-Apr-2023', 'DD-MON-YYYY'), '300', 8, 'Y', 0.4, 2.5);
INSERT INTO FREAKYMON VALUES (7, 7, 'M', 45, 'Slateport Harbor', 'Slateport', 'Hoenn', 'Japan', TO_DATE('18-Apr-2023', 'DD-MON-YYYY'), '500', 10, 'Y', 0.9, 19.5);
INSERT INTO FREAKYMON VALUES (8, 8, 'M', 90, 'Mauville Plaza', 'Mauville', 'Hoenn', 'Japan', TO_DATE('25-Apr-2023', 'DD-MON-YYYY'), '900', 18, 'N', 1.9, 52.0);
INSERT INTO FREAKYMON VALUES (9, 9, 'F', 35, 'Power Plant', 'Lavender', 'Kanto', 'Japan', TO_DATE('30-Apr-2023', 'DD-MON-YYYY'), '450', 12, 'N', 0.3, 6.0);
INSERT INTO FREAKYMON VALUES (10, 10, 'F', 80, 'Route 12', 'Fuchsia', 'Kanto', 'Japan', TO_DATE('10-May-2023', 'DD-MON-YYYY'), '750', 20, 'N', 1.0, 60.0);
INSERT INTO FREAKYMON VALUES (11, 11, 'M', 25, 'Route 116', 'Rustboro', 'Hoenn', 'Japan', TO_DATE('18-May-2023', 'DD-MON-YYYY'), '350', 8, 'N', 2.0, 35.0);
INSERT INTO FREAKYMON VALUES (12, 12, 'M', 75, 'Meteor Falls', 'Fallabor', 'Hoenn', 'Japan', TO_DATE('25-May-2023', 'DD-MON-YYYY'), '700', 22, 'Y', 3.5, 65.0);
INSERT INTO FREAKYMON VALUES (13, 13, 'F', 50, 'Viridian Forest', 'Pewter', 'Kanto', 'Japan', TO_DATE('01-Jun-2023', 'DD-MON-YYYY'), '600', 14, 'N', 0.7, 15.2);
INSERT INTO FREAKYMON VALUES (14, 14, 'M', 110, 'Safari Zone', 'Fuchsia', 'Kanto', 'Japan', TO_DATE('10-Jun-2023', 'DD-MON-YYYY'), '850', 18, 'Y', 1.0, 70.0);
INSERT INTO FREAKYMON VALUES (15, 15, 'F', 200, 'Route 112', 'Lavaridge', 'Hoenn', 'Japan', TO_DATE('20-Jun-2023', 'DD-MON-YYYY'), '1200', 28, 'N', 2.0, 100.0);
INSERT INTO FREAKYMON VALUES (16, 16, 'M', 40, 'Route 4', 'Cerulean', 'Kanto', 'Japan', TO_DATE('30-Jun-2023', 'DD-MON-YYYY'), '550', 8, 'Y', 0.6, 8.5);
INSERT INTO FREAKYMON VALUES (17, 17, 'F', 85, 'Mt. Moon', 'Pewter', 'Kanto', 'Japan', TO_DATE('10-Jul-2023', 'DD-MON-YYYY'), '800', 18, 'Y', 1.0, 22.0);
INSERT INTO FREAKYMON VALUES (18, 18, 'M', 150, 'Victory Road', 'Viridian', 'Kanto', 'Japan', TO_DATE('20-Jul-2023', 'DD-MON-YYYY'), '1100', 30, 'N', 1.7, 90.5);
INSERT INTO FREAKYMON VALUES (19, 19, 'M', 50, 'Seafoam Islands', 'Cinnabar', 'Kanto', 'Japan', TO_DATE('30-Jul-2023', 'DD-MON-YYYY'), '600', 12, 'N', 0.5, 9.0);
INSERT INTO FREAKYMON VALUES (20, 20, 'F', 100, 'Route 20', 'Seafoam', 'Kanto', 'Japan', TO_DATE('10-Aug-2023', 'DD-MON-YYYY'), '850', 20, 'Y', 1.0, 22.5);

-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Datos de la tabla TABLA-4                                  -
-- ----------------------------------------------------------------
INSERT INTO GIRADA VALUES ('1234567890', 1, 1, 1, TO_DATE('01-Jan-2023 10:00:00', 'DD-MON-YYYY HH24:MI:SS'), 3);
INSERT INTO GIRADA VALUES ('1234567890', 2, 2, 2, TO_DATE('02-Jan-2023 11:00:00', 'DD-MON-YYYY HH24:MI:SS'), 5);
INSERT INTO GIRADA VALUES ('0987654321', 3, 3, 3, TO_DATE('03-Jan-2023 09:00:00', 'DD-MON-YYYY HH24:MI:SS'), 1);
INSERT INTO GIRADA VALUES ('0987654321', 4, 4, 4, TO_DATE('04-Jan-2023 12:00:00', 'DD-MON-YYYY HH24:MI:SS'), 2);
INSERT INTO GIRADA VALUES ('1122334455', 5, 5, 5, TO_DATE('05-Jan-2023 14:00:00', 'DD-MON-YYYY HH24:MI:SS'), 4);
INSERT INTO GIRADA VALUES ('1122334455', 6, 6, 6, TO_DATE('06-Jan-2023 15:00:00', 'DD-MON-YYYY HH24:MI:SS'), 3);
INSERT INTO GIRADA VALUES ('5566778899', 7, 7, 7, TO_DATE('07-Jan-2023 16:00:00', 'DD-MON-YYYY HH24:MI:SS'), 5);
INSERT INTO GIRADA VALUES ('5566778899', 8, 8, 8, TO_DATE('08-Jan-2023 17:00:00', 'DD-MON-YYYY HH24:MI:SS'), 1);
INSERT INTO GIRADA VALUES ('6677889900', 9, 9, 9, TO_DATE('09-Jan-2023 18:00:00', 'DD-MON-YYYY HH24:MI:SS'), 2);
INSERT INTO GIRADA VALUES ('6677889900', 10, 10, 10, TO_DATE('10-Jan-2023 19:00:00', 'DD-MON-YYYY HH24:MI:SS'), 4);
INSERT INTO GIRADA VALUES ('7788990011', 11, 11, 11, TO_DATE('11-Jan-2023 08:00:00', 'DD-MON-YYYY HH24:MI:SS'), 3);
INSERT INTO GIRADA VALUES ('7788990011', 12, 12, 12, TO_DATE('12-Jan-2023 09:00:00', 'DD-MON-YYYY HH24:MI:SS'), 2);
INSERT INTO GIRADA VALUES ('8899001122', 13, 13, 13, TO_DATE('13-Jan-2023 10:00:00', 'DD-MON-YYYY HH24:MI:SS'), 1);
INSERT INTO GIRADA VALUES ('8899001122', 14, 14, 14, TO_DATE('14-Jan-2023 11:00:00', 'DD-MON-YYYY HH24:MI:SS'), 5);
INSERT INTO GIRADA VALUES ('9900112233', 15, 15, 15, TO_DATE('15-Jan-2023 12:00:00', 'DD-MON-YYYY HH24:MI:SS'), 4);
INSERT INTO GIRADA VALUES ('9900112233', 16, 16, 16, TO_DATE('16-Jan-2023 13:00:00', 'DD-MON-YYYY HH24:MI:SS'), 2);
INSERT INTO GIRADA VALUES ('1010101010', 17, 17, 17, TO_DATE('17-Jan-2023 14:00:00', 'DD-MON-YYYY HH24:MI:SS'), 1);
INSERT INTO GIRADA VALUES ('1010101010', 18, 18, 18, TO_DATE('18-Jan-2023 15:00:00', 'DD-MON-YYYY HH24:MI:SS'), 3);
INSERT INTO GIRADA VALUES ('1111111111', 19, 19, 19, TO_DATE('19-Jan-2023 16:00:00', 'DD-MON-YYYY HH24:MI:SS'), 2);
INSERT INTO GIRADA VALUES ('1111111111', 20, 20, 20, TO_DATE('20-Jan-2023 17:00:00', 'DD-MON-YYYY HH24:MI:SS'), 4);

-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Datos de la tabla TABLA-4                                  -
-- ----------------------------------------------------------------
INSERT INTO PELEA VALUES (1, 1, 1, TO_DATE('01-Jan-2023 10:00:00', 'DD-MON-YYYY HH24:MI:SS'));
INSERT INTO PELEA VALUES (2, 2, 3, TO_DATE('02-Jan-2023 12:00:00', 'DD-MON-YYYY HH24:MI:SS'));
INSERT INTO PELEA VALUES (3, 3, 4, TO_DATE('03-Jan-2023 14:00:00', 'DD-MON-YYYY HH24:MI:SS'));
INSERT INTO PELEA VALUES (4, 4, 5, TO_DATE('04-Jan-2023 16:00:00', 'DD-MON-YYYY HH24:MI:SS'));
INSERT INTO PELEA VALUES (5, 5, 6, TO_DATE('05-Jan-2023 18:00:00', 'DD-MON-YYYY HH24:MI:SS'));
INSERT INTO PELEA VALUES (6, 6, 7, TO_DATE('06-Jan-2023 20:00:00', 'DD-MON-YYYY HH24:MI:SS'));
INSERT INTO PELEA VALUES (7, 7, 8, TO_DATE('07-Jan-2023 09:00:00', 'DD-MON-YYYY HH24:MI:SS'));
INSERT INTO PELEA VALUES (8, 8, 9, TO_DATE('08-Jan-2023 11:00:00', 'DD-MON-YYYY HH24:MI:SS'));
INSERT INTO PELEA VALUES (9, 9, 10, TO_DATE('09-Jan-2023 13:00:00', 'DD-MON-YYYY HH24:MI:SS'));
INSERT INTO PELEA VALUES (10, 10, 11, TO_DATE('10-Jan-2023 15:00:00', 'DD-MON-YYYY HH24:MI:SS'));
INSERT INTO PELEA VALUES (11, 11, 12, TO_DATE('11-Jan-2023 17:00:00', 'DD-MON-YYYY HH24:MI:SS'));
INSERT INTO PELEA VALUES (12, 12, 13, TO_DATE('12-Jan-2023 19:00:00', 'DD-MON-YYYY HH24:MI:SS'));
INSERT INTO PELEA VALUES (13, 13, 14, TO_DATE('13-Jan-2023 21:00:00', 'DD-MON-YYYY HH24:MI:SS'));
INSERT INTO PELEA VALUES (14, 14, 15, TO_DATE('14-Jan-2023 08:00:00', 'DD-MON-YYYY HH24:MI:SS'));
INSERT INTO PELEA VALUES (15, 15, 16, TO_DATE('15-Jan-2023 10:00:00', 'DD-MON-YYYY HH24:MI:SS'));
INSERT INTO PELEA VALUES (16, 16, 17, TO_DATE('16-Jan-2023 12:00:00', 'DD-MON-YYYY HH24:MI:SS'));
INSERT INTO PELEA VALUES (17, 17, 18, TO_DATE('17-Jan-2023 14:00:00', 'DD-MON-YYYY HH24:MI:SS'));
INSERT INTO PELEA VALUES (18, 18, 19, TO_DATE('18-Jan-2023 16:00:00', 'DD-MON-YYYY HH24:MI:SS'));
INSERT INTO PELEA VALUES (19, 19, 20, TO_DATE('19-Jan-2023 18:00:00', 'DD-MON-YYYY HH24:MI:SS'));
INSERT INTO PELEA VALUES (20, 20, 1, TO_DATE('20-Jan-2023 20:00:00', 'DD-MON-YYYY HH24:MI:SS'));

-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Datos de la tabla TABLA-4                                  -
-- ----------------------------------------------------------------
INSERT INTO GYM_FREAKYMON VALUES (1, 1, TO_DATE('01-Jan-2023', 'DD-MON-YYYY'), NULL);
INSERT INTO GYM_FREAKYMON VALUES (1, 2, TO_DATE('02-Jan-2023', 'DD-MON-YYYY'), NULL);
INSERT INTO GYM_FREAKYMON VALUES (2, 3, TO_DATE('03-Jan-2023', 'DD-MON-YYYY'), TO_DATE('10-Jan-2023', 'DD-MON-YYYY'));
INSERT INTO GYM_FREAKYMON VALUES (2, 4, TO_DATE('04-Jan-2023', 'DD-MON-YYYY'), NULL);
INSERT INTO GYM_FREAKYMON VALUES (3, 5, TO_DATE('05-Jan-2023', 'DD-MON-YYYY'), TO_DATE('12-Jan-2023', 'DD-MON-YYYY'));
INSERT INTO GYM_FREAKYMON VALUES (3, 6, TO_DATE('06-Jan-2023', 'DD-MON-YYYY'), NULL);
INSERT INTO GYM_FREAKYMON VALUES (4, 7, TO_DATE('07-Jan-2023', 'DD-MON-YYYY'), TO_DATE('15-Jan-2023', 'DD-MON-YYYY'));
INSERT INTO GYM_FREAKYMON VALUES (4, 8, TO_DATE('08-Jan-2023', 'DD-MON-YYYY'), NULL);
INSERT INTO GYM_FREAKYMON VALUES (5, 9, TO_DATE('09-Jan-2023', 'DD-MON-YYYY'), TO_DATE('17-Jan-2023', 'DD-MON-YYYY'));
INSERT INTO GYM_FREAKYMON VALUES (5, 10, TO_DATE('10-Jan-2023', 'DD-MON-YYYY'), NULL);
INSERT INTO GYM_FREAKYMON VALUES (6, 11, TO_DATE('11-Jan-2023', 'DD-MON-YYYY'), NULL);
INSERT INTO GYM_FREAKYMON VALUES (6, 12, TO_DATE('12-Jan-2023', 'DD-MON-YYYY'), TO_DATE('18-Jan-2023', 'DD-MON-YYYY'));
INSERT INTO GYM_FREAKYMON VALUES (7, 13, TO_DATE('13-Jan-2023', 'DD-MON-YYYY'), NULL);
INSERT INTO GYM_FREAKYMON VALUES (7, 14, TO_DATE('14-Jan-2023', 'DD-MON-YYYY'), TO_DATE('20-Jan-2023', 'DD-MON-YYYY'));
INSERT INTO GYM_FREAKYMON VALUES (8, 15, TO_DATE('15-Jan-2023', 'DD-MON-YYYY'), NULL);
INSERT INTO GYM_FREAKYMON VALUES (8, 16, TO_DATE('16-Jan-2023', 'DD-MON-YYYY'), NULL);
INSERT INTO GYM_FREAKYMON VALUES (9, 17, TO_DATE('17-Jan-2023', 'DD-MON-YYYY'), TO_DATE('25-Jan-2023', 'DD-MON-YYYY'));
INSERT INTO GYM_FREAKYMON VALUES (9, 18, TO_DATE('18-Jan-2023', 'DD-MON-YYYY'), NULL);
INSERT INTO GYM_FREAKYMON VALUES (10, 19, TO_DATE('19-Jan-2023', 'DD-MON-YYYY'), NULL);
INSERT INTO GYM_FREAKYMON VALUES (10, 20, TO_DATE('20-Jan-2023', 'DD-MON-YYYY'), TO_DATE('30-Jan-2023', 'DD-MON-YYYY'));

-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Datos de la tabla TABLA-4                                  -
-- ----------------------------------------------------------------
INSERT INTO FREAKYMON_TIPO VALUES (1, 4);
INSERT INTO FREAKYMON_TIPO VALUES (2, 4);
INSERT INTO FREAKYMON_TIPO VALUES (3, 9);
INSERT INTO FREAKYMON_TIPO VALUES (4, 9);
INSERT INTO FREAKYMON_TIPO VALUES (5, 9);
INSERT INTO FREAKYMON_TIPO VALUES (6, 2);
INSERT INTO FREAKYMON_TIPO VALUES (7, 2);
INSERT INTO FREAKYMON_TIPO VALUES (8, 2);
INSERT INTO FREAKYMON_TIPO VALUES (9, 4);
INSERT INTO FREAKYMON_TIPO VALUES (10, 4);
INSERT INTO FREAKYMON_TIPO VALUES (11, 8);
INSERT INTO FREAKYMON_TIPO VALUES (12, 8);
INSERT INTO FREAKYMON_TIPO VALUES (13, 5);
INSERT INTO FREAKYMON_TIPO VALUES (14, 5);
INSERT INTO FREAKYMON_TIPO VALUES (15, 5);
INSERT INTO FREAKYMON_TIPO VALUES (16, 2);
INSERT INTO FREAKYMON_TIPO VALUES (17, 2);
INSERT INTO FREAKYMON_TIPO VALUES (18, 2);
INSERT INTO FREAKYMON_TIPO VALUES (19, 3);
INSERT INTO FREAKYMON_TIPO VALUES (20, 3);


-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Datos de la tabla TABLA-4                                  -
-- ----------------------------------------------------------------
INSERT INTO ATAQUE_FREAKYMON VALUES (1, 1, 50);
INSERT INTO ATAQUE_FREAKYMON VALUES (1, 2, 60);
INSERT INTO ATAQUE_FREAKYMON VALUES (2, 3, 40);
INSERT INTO ATAQUE_FREAKYMON VALUES (2, 4, 70);
INSERT INTO ATAQUE_FREAKYMON VALUES (3, 5, 55);
INSERT INTO ATAQUE_FREAKYMON VALUES (3, 6, 65);
INSERT INTO ATAQUE_FREAKYMON VALUES (4, 7, 45);
INSERT INTO ATAQUE_FREAKYMON VALUES (4, 8, 75);
INSERT INTO ATAQUE_FREAKYMON VALUES (5, 9, 50);
INSERT INTO ATAQUE_FREAKYMON VALUES (5, 10, 80);
INSERT INTO ATAQUE_FREAKYMON VALUES (6, 11, 60);
INSERT INTO ATAQUE_FREAKYMON VALUES (6, 12, 70);
INSERT INTO ATAQUE_FREAKYMON VALUES (7, 13, 40);
INSERT INTO ATAQUE_FREAKYMON VALUES (7, 14, 90);
INSERT INTO ATAQUE_FREAKYMON VALUES (8, 15, 55);
INSERT INTO ATAQUE_FREAKYMON VALUES (8, 16, 85);
INSERT INTO ATAQUE_FREAKYMON VALUES (9, 17, 65);
INSERT INTO ATAQUE_FREAKYMON VALUES (9, 18, 75);
INSERT INTO ATAQUE_FREAKYMON VALUES (10, 19, 95);
INSERT INTO ATAQUE_FREAKYMON VALUES (10, 20, 100);

-- ----------------------------------------------------------------
-- -   Guarda los datos. De no ponerse, como quiera los guarda   -
-- - en una corrida.  Se deja para explicar su uso.             -
-- ----------------------------------------------------------------
COMMIT;


