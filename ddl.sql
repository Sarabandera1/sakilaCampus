CREATE TABLE IF NOT EXISTS clientes(
	id  INT AUTO_INCREMENT PRIMARY KEY,

​	id_almacen TINYINT UNSIGNED,

​	nombre VARCHAR(45),

​	apellidos VARCHAR(45),

​	email VARCHAR(45), 

​	id_direcion SMALLINT UNSIGNED,

​	activo TINYIN(1),

​	fecha_creacion DATETIME,

​	ultima_actualizacion TIMESTAMP,

​	FOREING KEY (id_almacen) REFERENCES almacen (id_almacen)

);

CREATE TABLE IF NOT EXISTS almacen(

​	id  INT AUTO_INCREMENT PRIMARY KEY,

​	id_empleado_jefe INT,

​	id_direccion SMALLINT UNSIGNE,

​	ultima_actualizacion TIMESTAM,

​	FOREING KEY (id_empleado) REFERENCES empleado (id_empleado),

​	FOREING KEY (id_direccion) REFERENCES direccion (id_direccion)

);

CREATE TABLE IF NOT EXISTS empleado(

 id  INT AUTO_INCREMENT PRIMARY KEY,

nombre VARCHAR(45),

apellidos VARCHAR(45),

id_direccion INT,

imagen BLOB,

email  VARCHAR(50),

id_almacen INT,

activo TINYINT(1),

username VARCHAR(16),

pasword VARCHAR(40),

FOREING KEY (id_direccion) REFERENCES direccion (id_direccion),

FOREING KEY (id_almacen) REFERENCES almacen (id_almacen),

);

CREATE TABLE IF NOT EXISTS direccion(

​	id INT AUTO_INCREMENT PRIMARY KEY,

​	direccion VARCHAR(50),

​	direccion2 VARCHAR(50),

​	distrito VARCHAR(20),

​	id_ciudad INT,

​	codigo_postal VARCHAR(10),

​	telefono VARCHAR(20),

​	ultima_actualizacion TIMESTAMP,

​	FOREING KEY (id_ciudad) REFERENCES ciudad (id_ciudad)

);

CREATE TABLE IF NOT EXIST ciudad(

​	id INT AUTO_INCREMENT PRIMARY_KEY,

​	nombre VARCHAR(50),

​	id_pais INT,

​	ultima_actualizacion TIMERSTAMP

​	FOREING KEY (id_pais) REFERENCES pais (id_pais)

);

CREATE TABLE IF NOT EXISTS pais(

​	id INT AUTO_INCREMENT PRIMARY KEY,

​	nombre VARCHAR(50),

​	ultima_actualizacion TIMESTAMP

);

CREATE TABLE IF NOT EXISTS alquiler(

​	id INT AUTO_INCREMENT PRIMARY KEY,

​	fecha_alquiler DATATIME,

​	id_inventario MEDIUMINT UNSIGNED,

​	id_cliente SMALLINT UNSIGNED,

​	fecha_devolucion DATETIME,

​	id_empleado INT,

​	ultima_actualizacion TIMESTAMP,

​	FOREING KEY (id_cliente) REFERENCES cliente (id_cliente),

​	FOREING KEY (id_empleado) REFERENCES empleado (id_empleado),

​	FOREING KEY (id_inventario) REFERENCES inventario (id_inventario)

);

CREATE TABLE IF NOT EXISTS pago(

​	id_cliente SMALLINT UNSIGNED,

​	id_empleado TINYINT UNSIGNED,

​	id_alquiler INT,

​	total DECIMAL(5,2),

​	fecha_pago DATATIME,

​	ultima_actualizacion TIMESTAMP

​	FOREING KEY (id_empleado) REFERENCES empleado (id_empleado),

​	FOREING KEY (id_alquiler) REFERENCES alquiler (id_alquiler),

​	FOREING KEY (id_cliente) REFERENCES cliente (id_cliente)

); 

CREATE TABLE IF NOT EXISTS inventario(

​	id INT AUTO_INCREMENT PRIMARY_KEY,

​	id_pelicula SMALLINT UNSIGNED,

​	id_almacen TINYINT UNSIGNED,

​	ultima_actualizacion TIMESTAMP,

​	FOREING KEY (id_pelicula) REFERENCES pelicula (id_pelicula),

​	FOREING KEY (id_almacen) REFERENCES almacen (id_almacen)

);

CREATE TABLE IF NOT EXISTS pelicula_categoria(

​	id INT AUTO_INCREMENT PRYMARY KEY,

​	id_pelicula SMALLINT UNSIGNED,

​	id_categoria TINYINT UNSIGNED,

​	ultima_actualizacion TIMESTAMP,

​	FOREING KEY (id_pelicula) REFERENCES pelicula (id_pelicula),

​	FOREING KEY (id_categoria) REFERENCES categoria (id_categoria)

);

CREATE TABLE IF NOT EXISTS pelicula(

​	id INT AUTO_INCREMENT PRIMARY KEY,

​	titulo VARCHAR(255), 

​	descripcion TEXT,

​	anyo_lanzamiento YEAR,

​	id_idioma TINYINT UNSIGNED,

​	id_idioma_original TINYINT UNSIGNED,

​	duracion_alquiler TINYINT UNSIGNED,

​	rental_rate DECIMAL(5,2),

​	duracion SMALLINT UNSIGNED,

​	replacement _cost DECIMAL(5,2),

​	clasificacion ENUM('G', 'PG', 'PG-13', 'R', 'NC-17' ),

​	caracteristicas_especiales set('Trailers', 'Commentaries', 'Deleted Scenes', 'Behind the Scenes'),

​	ultima_actualizacion TIMESTAMP,

​	FOREING KEY (id_idioma_original) REFERENCES idioma_original (id_idioma_original),

​	FOREING KEY (id_idima) REFERENCES idioma (id_idioma)

);

CREATE TABLE IF NOT EXISTS idioma(

​	id INT AUTO_INCREMENT PRIMARY KEY,

​	nombre VARCHAR(20),

​	ultima_actualizacion TIMESTAMP

);

CREATE TABLE IF NOT EXISTS pelicula_actor(

​	id INT AUTO_INCREMENT PRIMARY KEY,

​	id_actor SMALLINT UNSIGNED,

​	ultima_actualizacion TIMESTAMP,

​	FOREING KEY (id_actor) REFERENCES actor (id_actor)

);

CREATE TABLE IF NOT EXISTS categoria(

​	id INT AUTO_INCREMENT PRIMARY KEY,

​	nombre VARCHAR(25),

​	ultima_actualizacion TIMESTAMP

);

CREATE TABLE IF NOT EXISTS film_text(

​	id INT AUTO_INCREMENT PRYMARY KEY,

​	film_id SMALLINT,

​	description TEXT

);
