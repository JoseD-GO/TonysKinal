-- Drop database if exists  DBTonysKinal2019063;
create database DBTonysKinal2019063;

use DBTonysKinal2019063;

-- =========================== CREACION DE TABLAS ===========================

-- Creando tabla Tipo_Plato
DELIMITER $$
	create procedure sp_Crear_Tipo_Plato()
		BEGIN
			create table Tipo_Plato(codigoTipoPlato int auto_increment not null primary key NOT NULL, 
			descripcionTipo varchar(100) NOT NULL);
		END $$
DELIMITER ;

-- Creando tabla Producto
DELIMITER $$
	create procedure sp_Crear_Producto()
		BEGIN
			create table Producto(codigoProducto int auto_increment not null primary key, 
			nombreProducto varchar(150),
			cantidad int);
		END $$
DELIMITER ;

-- Creando tabla Tipo_Empleado
DELIMITER $$
	create procedure sp_Crear_Tipo_Empleado()
		BEGIN
			create table TipoEmpleado(codigoTipoEmpleado int auto_increment not null primary key, 
			descripcion varchar(100));
		END $$
DELIMITER ;

-- Creando tabla Empleado
DELIMITER $$
	create procedure sp_Crear_Empleado()
		BEGIN
			create table Empleado(codigoEmpleado int auto_increment not null primary key, 
			numeroEmpleado int,
			apellidosEmpleado varchar(150),
			nombreEmpleado varchar(150),
			direccion varchar(150),
			telefonoContacto varchar(10),
			gradoCocinero varchar(50),
			codigoTipoEmpleado int,
			foreign key(codigoTipoEmpleado) references TipoEmpleado(codigoTipoEmpleado) ON DELETE CASCADE);
		END $$
DELIMITER ;

-- Creando tabla Empresa
DELIMITER $$
	create procedure sp_Crear_Empresa()
		BEGIN
			create table Empresa(codigoEmpresa int auto_increment not null primary key, 
			nombreEmpresa varchar(150),
			direccion varchar(150),
			telefono varchar(10));
		END $$
DELIMITER ;

-- Creando tabla Presupuesto
DELIMITER $$
	create procedure sp_Crear_Presupuesto()
		BEGIN
			create table Presupuesto(codigoPresupuesto int auto_increment not null primary key, 
			fecha_Solicitud  date,
			cantidadPresupuesto decimal(10,2),
			codigoEmpresa int,
			foreign key(codigoEmpresa) references Empresa(codigoEmpresa) ON DELETE CASCADE);
		END $$
DELIMITER ;

-- Creando tabla Servicio
DELIMITER $$
	create procedure sp_Crear_Servicio()
		BEGIN
			create table Servicio(codigoServicio int auto_increment not null primary key, 
			fecha_Servicio  date,
			tipo_Servicio varchar(100),
			horaServicio time,
			lugarServicio varchar(100),
			telefonoContacto varchar(10),
			codigoEmpresa int,
			foreign key(codigoEmpresa) references Empresa(codigoEmpresa) ON DELETE CASCADE);
		END $$
DELIMITER ;

-- Creando tabla Servicio_has_Empleado
DELIMITER $$
	create procedure sp_Crear_Servicio_has_Empleado()
		BEGIN
			create table Servicio_Has_Empleado(
            Servicios_codigoServicio int not null auto_increment,
            codigoServicio int not null,
			codigoEmpleado int not null,
			fechaEvento date not null,
			horaEvento time,
			lugarEvento varchar(150) not null,
            primary key PK_Servicios_codigoServicio (Servicios_codigoServicio),
			foreign key(codigoServicio) references Servicio(codigoServicio) ON DELETE CASCADE,
			foreign key(codigoEmpleado) references Empleado(codigoEmpleado) ON DELETE CASCADE);
		END $$
DELIMITER ;

-- Creando tabla Plato
DELIMITER $$
	create procedure sp_Crear_Plato()
		BEGIN
			create table Plato(codigoPlato int auto_increment not null primary key, 
			cantidad int,
			nombrePlato varchar(50),
			descripcionPlato varchar(150),
			precioPlato decimal(10,2),
			codigoTipoPlato int,
			foreign key(codigoTipoPlato) references Tipo_Plato(codigoTipoPlato) ON DELETE CASCADE);
		END $$
DELIMITER ;

-- Creando tabla Producto_has_Plato
DELIMITER $$
	create procedure sp_Crear_Producto_has_Plato()
		BEGIN
			create table Producto_Has_Plato(
            Producto_codigoProducto int not null,
            codigoPlato int not null,
			codigoProducto int not null,
            primary key PK_Productos_codigoProducto (Producto_codigoProducto),
			foreign key(codigoProducto) references Producto(codigoProducto) ON DELETE CASCADE,
			foreign key(codigoPlato) references Plato(codigoPlato) ON DELETE CASCADE);
		END $$
DELIMITER ;

-- Creando tabla Servicio_has_Plato
DELIMITER $$
	create procedure sp_Crear_Servicio_has_Plato()
		BEGIN
			create table Servicio_Has_Plato(
            Servicios_codigoServicio int not null,
			codigoPlato int not null,
			codigoServicio int not null,
            primary key PK_Servicios_codigoServicio (Servicios_codigoServicio),
			foreign key(codigoServicio) references Servicio(codigoServicio) ON DELETE CASCADE,
			foreign key(codigoPlato) references Plato(codigoPlato) ON DELETE CASCADE);
		END $$
DELIMITER ;

-- Llamando a los "sp"
call sp_Crear_Tipo_Plato();
call sp_Crear_Producto();
call sp_Crear_Tipo_Empleado();
call sp_Crear_Empleado();
call sp_Crear_Empresa();
call sp_Crear_Presupuesto();
call sp_Crear_Servicio();
call sp_Crear_Servicio_has_Empleado();
call sp_Crear_Plato();
call sp_Crear_Producto_has_Plato();
call sp_Crear_Servicio_has_Plato();

-- ALTER USER 'root'@'localhost' identified WITH mysql_native_password BY 'root';

