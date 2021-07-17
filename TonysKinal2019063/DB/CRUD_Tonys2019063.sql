use dbtonyskinal2019063;

-- ===================== CRUD de las Tablas =====================

-- -------------- Tabla Tipo_Plato--------------
-- Agregar
DELIMITER $$
	create procedure sp_Agregar_Tipo_Plato(in descripcion varchar(100))
		BEGIN
			insert into Tipo_plato(DescripcionTipo) values(descripcion);
		END $$
DELIMITER ;

-- Listar
DELIMITER $$
	create procedure sp_Listar_Tipo_Plato()
		BEGIN
			Select * from Tipo_Plato;
		END $$
DELIMITER ;

-- Actualizar
DELIMITER $$
	create procedure sp_Actualizar_Tipo_Plato(in codtp int, descripcion varchar(100))
		BEGIN
			update Tipo_Plato set DescripcionTipo=descripcion where CodigoTipoPlato=codtp;
		END $$
DELIMITER ;

-- Eliminar
DELIMITER $$
	create procedure sp_Eliminar_Tipo_Plato(in codtp int)
		BEGIN
			delete from Tipo_Plato where CodigoTipoPlato=codtp;
		END $$
DELIMITER ;

-- Buscar
DELIMITER $$
	create procedure sp_Buscar_Tipo_Plato(in codtp int)
		BEGIN
			Select * from Tipo_Plato where CodigoTipoPlato=codtp;
		END $$
DELIMITER ;

-- -------------- Tabla Producto--------------
-- Agregar
DELIMITER $$
	create procedure sp_Agregar_Producto(in nombreP varchar(150), cant int)
		BEGIN
			insert into Producto(nombreProducto,Cantidad) values(nombreP,cant);
		END $$
DELIMITER ;

-- Listar
DELIMITER $$
	create procedure sp_Listar_Producto()
		BEGIN
			Select * from Producto;
		END $$
DELIMITER ;

-- Actualizar
DELIMITER $$
	create procedure sp_Actualizar_Producto(in codP int, nombreP varchar(150), cant int)
		BEGIN
			update Producto set NombreProducto=nombreP, Cantidad=cant where CodigoProducto=codP;
		END $$
DELIMITER ;

-- Eliminar
DELIMITER $$
	create procedure sp_Eliminar_Producto(in codP int)
		BEGIN
			delete from Producto where CodigoProducto=codP;
		END $$
DELIMITER ;

-- Buscar
DELIMITER $$
	create procedure sp_Buscar_Producto(in codP int)
		BEGIN
			Select * from Producto where CodigoProducto=codP;
		END $$
DELIMITER ;

-- -------------- Tabla TipoEmpleado--------------
-- Agregar
DELIMITER $$
	create procedure sp_Agregar_TipoEmpleado(in descripcion varchar(100))
		BEGIN
			insert into TipoEmpleado(Descripcion) values(descripcion);
		END $$
DELIMITER ;

-- Listar
DELIMITER $$
	create procedure sp_Listar_TipoEmpleado()
		BEGIN
			Select * from TipoEmpleado;
		END $$
DELIMITER ;

-- Actualizar
DELIMITER $$
	create procedure sp_Actualizar_TipoEmpleado(in codte int, descripcion varchar(100))
		BEGIN
			update TipoEmpleado set Descripcion=descripcion where CodigoTipoEmpleado=codte;
		END $$
DELIMITER ;

-- Eliminar
DELIMITER $$
	create procedure sp_Eliminar_TipoEmpleado(in codte int)
		BEGIN
			delete from TipoEmpleado where CodigoTipoEmpleado=codte;
		END $$
DELIMITER ;


-- Buscar
DELIMITER $$
	create procedure sp_Buscar_TipoEmpleado(in codte int)
		BEGIN
			Select * from TipoEmpleado where CodigoTipoEmpleado=codte;
		END $$
DELIMITER ;

-- -------------- Tabla Empleado--------------
-- Agregar
DELIMITER $$
	create procedure sp_Agregar_Empleado(in numE int, apellidoE varchar(150), nombreE varchar(150), direccionE varchar(150), telC varchar(10), grado varchar(50), CodTE int)
		BEGIN
			insert into Empleado(NumeroEmpleado,ApellidosEmpleado,NombreEmpleado,Direccion,TelefonoContacto,GradoCocinero,CodigoTipoEmpleado) 
			values(numE,apellidoE,nombreE,direccionE,telC,grado,CodTE);
		END $$
DELIMITER ;

-- Listar
DELIMITER $$
	create procedure sp_Listar_Empleado()
		BEGIN
			Select * from Empleado;
		END $$
DELIMITER ;

-- Actualizar
DELIMITER $$
	create procedure sp_Actualizar_Empleado(in codiE int, numE int, apellidoE varchar(150), nombreE varchar(150), direccionE varchar(150), telC varchar(10), grado varchar(50))
		BEGIN
			update Empleado set NumeroEmpleado=numE, ApellidosEmpleado=apellidoE, NombreEmpleado=nombreE, Direccion=direccionE, TelefonoContacto=telC, 
			GradoCocinero=grado where CodigoEmpleado=codiE;
		END $$
DELIMITER ;

-- Eliminar
DELIMITER $$
	create procedure sp_Eliminar_Empleado(in codiE int)
		BEGIN
			delete from Empleado where CodigoEmpleado=codiE;
		END $$
DELIMITER ;

-- Buscar
DELIMITER $$
	create procedure sp_Buscar_Empleado(in codiE int)
		BEGIN
			Select * from Empleado where CodigoEmpleado=codiE;
		END $$
DELIMITER ;

-- -------------- Tabla Empresa--------------
-- Agregar
DELIMITER $$
	create procedure sp_Agregar_Empresa(in nombreE varchar(150), direccionE varchar(150), telefonoE varchar(10))
		BEGIN
			insert into Empresa(NombreEmpresa,Direccion,Telefono) values(nombreE,direccionE,telefonoE);
		END $$
DELIMITER ;

-- Listar
DELIMITER $$
	create procedure sp_Listar_Empresa()
		BEGIN
			Select * from Empresa;
		END $$
DELIMITER ;

-- Actualizar
DELIMITER $$
	create procedure sp_Actualizar_Empresa(in codigoE int, nombreE varchar(150), direccionE varchar(150), telefonoE varchar(10))
		BEGIN
			update Empresa set NombreEmpresa=nombreE, Direccion=direccionE, Telefono=telefonoE where CodigoEmpresa=codigoE;
		END $$
DELIMITER ;

-- Eliminar
DELIMITER $$
	create procedure sp_Eliminar_Empresa(in codigoE int)
		BEGIN
			delete from Empresa where CodigoEmpresa=codigoE;
		END $$
DELIMITER ;

-- Buscar
DELIMITER $$
	create procedure sp_Buscar_Empresa(in codigoE int)
		BEGIN
			Select * from Empresa where CodigoEmpresa=codigoE;
		END $$
DELIMITER ;

-- Buscar por nombre
/*DELIMITER $$
	create procedure sp_Buscar_Empresa_Nombre(in nombreE varchar(150))
		BEGIN
			Select * from Empresa e where (e.codigoEmpresa LIKE concat(nombreE,'%') OR e.nombreEmpresa LIKE concat(nombreE,'%'));
		END $$
DELIMITER ;*/

-- -------------- Tabla Presupuesto--------------
-- Agregar
DELIMITER $$
	create procedure sp_Agregar_Presupuesto(in fechaS date, cantidadP decimal(10,2), codigoE int)
		BEGIN
			insert into Presupuesto(Fecha_Solicitud,CantidadPresupuesto,CodigoEmpresa) values(fechaS,cantidadP,codigoE);
		END $$
DELIMITER ;

-- Listar
DELIMITER $$
	create procedure sp_Listar_Presupuesto()
		BEGIN
			Select * from Presupuesto;
		END $$
DELIMITER ;

-- Actualizar
DELIMITER $$
	create procedure sp_Actualizar_Presupuesto(in codP int, fechaS date, cantidadP decimal(10,2))
		BEGIN
			update Presupuesto set Fecha_Solicitud=fechaS, CantidadPresupuesto=cantidadP where CodigoPresupuesto=codP;
		END $$
DELIMITER ;

-- Eliminar
DELIMITER $$
	create procedure sp_Eliminar_Presupuesto(in codP int)
		BEGIN
			delete from Presupuesto where CodigoPresupuesto=codP;
		END $$
DELIMITER ;

-- Buscar
DELIMITER $$
	create procedure sp_Buscar_Presupuesto(in codP int)
		BEGIN
			Select * from Presupuesto where CodigoPresupuesto=codP;
		END $$
DELIMITER ;

-- -------------- Tabla Servicio--------------
-- Agregar
DELIMITER $$
	create procedure sp_Agregar_Servicio(in fechaS date, tipoS varchar(100), horaS time, lugarS varchar(100), telefonoC varchar(10), codiE int)
		BEGIN
			insert into Servicio(Fecha_Servicio,Tipo_Servicio,HoraServicio,LugarServicio,TelefonoContacto,CodigoEmpresa) values(fechaS,tipoS,horaS,lugarS,telefonoC,codiE);
		END $$
DELIMITER ;

-- Listar
DELIMITER $$
	create procedure sp_Listar_Servicio()
		BEGIN
			Select * from Servicio;
		END $$
DELIMITER ;

-- Actualizar
DELIMITER $$
	create procedure sp_Actualizar_Servicio(in codS int, fechaS date, tipoS varchar(100), horaS time, lugarS varchar(100), telefonoC varchar(10))
		BEGIN
			update Servicio set Fecha_Servicio=fechaS, Tipo_Servicio=tipoS, HoraServicio=horaS, LugarServicio=lugarS, TelefonoContacto=telefonoC
			where CodigoServicio=codS;
		END $$
DELIMITER ;

-- Eliminar
DELIMITER $$
	create procedure sp_Eliminar_Servicio(in codS int)
		BEGIN
			delete from Servicio where CodigoServicio=codS;
		END $$
DELIMITER ;

-- Buscar
DELIMITER $$
	create procedure sp_Buscar_Servicio(in codS int)
		BEGIN
			Select * from Servicio where CodigoServicio=codS;
		END $$
DELIMITER ;

-- -------------- Tabla Servicio_Has_Empleado--------------
-- Agregar
DELIMITER $$
	create procedure sp_Agregar_ServicioHasEmpleado( in codigoServicioP int, in codigoEmpleadoP int, in fechaP date, in horaP time, in lugarP varchar(150) )
		BEGIN
			insert into servicio_has_empleado(codigoServicio, codigoEmpleado, fechaEvento, horaEvento, lugarEvento) values (codigoServicioP, codigoEmpleadoP, fechaP, horaP, lugarP);
        END $$
DELIMITER ;

-- Listar
DELIMITER $$
	create procedure sp_Listar_Servicio_has_Empleado()
		BEGIN
			Select * from Servicio_Has_Empleado;
		END $$
DELIMITER ;

-- Actualizar
DELIMITER $$
	create procedure sp_Actualizar_ServicioHasEmpleado(in servicios_codigoP int, in fechaP date, in horaP time, in lugarP varchar(50))
		BEGIN
			update servicio_has_empleado set fechaEvento=fechaP, horaEvento=horaP, lugarEvento=lugarP where Servicios_codigoServicio=servicios_codigoP;
        END $$
DELIMITER ;

-- Eliminar
DELIMITER $$
	create procedure sp_Eliminar_ServicioHasEmpleado(in codP int)
		BEGIN
			delete from servicio_has_empleado where Servicios_codigoServicio=codP;
        END $$
DELIMITER ;

-- Buscar
DELIMITER $$
	create procedure sp_Buscar_ServicioHasEmpleado(in codP int)
		BEGIN
			select * from servicio_has_empleado where Servicios_codigoServicio=codP;
        END $$
DELIMITER ;

-- -------------- Tabla Plato--------------
-- Agregar
DELIMITER $$
	create procedure sp_Agregar_Plato(in cantidadP int, nombreP varchar(50), descripcionP varchar(150), precipP decimal(10,2), codTP int)
		BEGIN
			insert into Plato(Cantidad,NombrePlato,DescripcionPlato,PrecioPlato,CodigoTipoPlato) values(cantidadP,nombreP,descripcionP,precipP,codTP);
		END $$
DELIMITER ;

-- Listar
DELIMITER $$
	create procedure sp_Listar_Plato()
		BEGIN
			Select * from Plato;
		END $$
DELIMITER ;

-- Actualizar
DELIMITER $$
	create procedure sp_Actualizar_Plato(in codP int, cantidadP int, nombreP varchar(50), descripcionP varchar(150), precioP decimal(10,2))
		BEGIN
			update Plato set Cantidad=cantidadP, NombrePlato=nombreP, DescripcionPlato=descripcionP, PrecioPlato=precioP
			where  CodigoPlato=codP;
		END $$
DELIMITER ;

-- Eliminar
DELIMITER $$
	create procedure sp_Eliminar_Plato(in codP int)
		BEGIN
			delete from Plato where CodigoPlato=codP;
		END $$
DELIMITER ;

-- Buscar
DELIMITER $$
	create procedure sp_Buscar_Plato(in codP int)
		BEGIN
			Select * from Plato where CodigoPlato=codP;
		END $$
DELIMITER ;

-- -------------- Tabla Producto_Has_Plato--------------
/*
-- Agregar
DELIMITER $$
	create procedure sp_Agregar_Producto_has_Plato(in Producto_codP int, platos_codP int)
		BEGIN
			insert into producto_has_plato(Producto_codigoProducto,Platos_codigoPlato) values(Producto_codP,platos_codP);
		END $$
DELIMITER ;*/

-- Listar
DELIMITER $$
	create procedure sp_Listar_Producto_has_Plato()
		BEGIN
			Select P.codigoProducto, pL.codigoPlato from Producto P inner join Plato pL;
		END $$
DELIMITER ;

-- -------------- Tabla Servicio_Has_Plato--------------
/*
-- Agregar
DELIMITER $$
	create procedure sp_Agregar_Servicio_has_Plato(in serv_codP int, platos_codP int)
		BEGIN
			insert into servicio_has_Plato(Servicios_codigoServicio,Platos_codigoPlato) values(serv_codP,platos_codP);
		END $$
DELIMITER ;*/

-- Listar
DELIMITER $$
	create procedure sp_Listar_Servicio_has_Plato()
		BEGIN
			select S.codigoServicio as codigoServicio, P.codigoPlato as codigoPlato from Servicio S inner join Plato P; 
		END $$
DELIMITER ;

-- Insertando datos a tabla Empresa
call sp_Listar_Empresa();

call sp_Agregar_Empresa('Diana','Direccion 1','12345678');
call sp_Agregar_Empresa('mytec','Direccion 2','87456321');
call sp_Agregar_Empresa('Imeqmo','Direccion 3','11111111');
call sp_Agregar_Empresa('LuzGO','Direccion 4','52525252');
call sp_Agregar_Empresa('MaxE','Direccion 5','66998877');
call sp_Agregar_Empresa('LeoPR','Direccion 6','11445566');
call sp_Agregar_Empresa('FireX','Direccion 7','77888552');
call sp_Agregar_Empresa('Xinx','Direccion 8','24589874');
call sp_Agregar_Empresa('JD','Direccion 9','45674844');
call sp_Agregar_Empresa('HELE','Direccion 10','25415455');
call sp_Agregar_Empresa('MRLO','Direccion 11','24574875');

-- Insertando datos a tabla TipoEmpleado
call sp_Listar_TipoEmpleado();

call sp_Agregar_TipoEmpleado('Mesero');
call sp_Agregar_TipoEmpleado('Chef');
call sp_Agregar_TipoEmpleado('Catador');
call sp_Agregar_TipoEmpleado('Ayudante de camarero');
call sp_Agregar_TipoEmpleado('Maitre');
call sp_Agregar_TipoEmpleado('Gourmet');
call sp_Agregar_TipoEmpleado('Hostess');
call sp_Agregar_TipoEmpleado('Cocinero');


-- Insertando datos a tabla Presupuesto
call sp_Listar_Presupuesto();

call sp_Agregar_Presupuesto('2020-02-10',15000,2);
call sp_Agregar_Presupuesto('2020-01-02',2050,1);
call sp_Agregar_Presupuesto('2018-02-18',10000,6);
call sp_Agregar_Presupuesto('2019-08-28',6085.75,8);
call sp_Agregar_Presupuesto('2020-05-05',12000,9);
call sp_Agregar_Presupuesto('2020-06-20',11100,10);
call sp_Agregar_Presupuesto('2020-02-15',15900,3);
call sp_Agregar_Presupuesto('2019-12-29',7800,2);
call sp_Agregar_Presupuesto('2015-07-13',13042,7);
call sp_Agregar_Presupuesto('2019-09-08',14245.80,4);
call sp_Agregar_Presupuesto('2017-12-26',1508.50,11);


-- Insertando datos a  tabla Empleado
call sp_Listar_Empleado();

call sp_Agregar_Empleado(01,'Perez','Juan','zona 12','12345678',1,2);
call sp_Agregar_Empleado(02,'Lopez','Leonel','zona 8','78964565',4,4);
call sp_Agregar_Empleado(03,'Hernandez','Javier','zona 1','41567896',6,7);
call sp_Agregar_Empleado(04,'Herrarte','Angel','zona 2','23569878',9,8);
call sp_Agregar_Empleado(05,'Jose','Gongora','zona 6','45789632',10,5);


-- Insertando datos a tabla Servicio
call sp_Listar_Servicio();

call sp_Agregar_Servicio('2020-06-16','Completo','12:00:00','Zona 4','45674899',9);
call sp_Agregar_Servicio('2020-01-10','Bufette','15:30:00','Zona 10','52525200',4);
call sp_Agregar_Servicio('2019-05-14','Completo','11:00:00','Zona 15','25415455',10);
call sp_Agregar_Servicio('2018-08-28','Completo','16:45:00','Zona 11','24574875',11);
call sp_Agregar_Servicio('2020-02-6','Banquete','21:05:00','Zona 6','24589878',8);
call sp_Agregar_Servicio('2017-08-6','Cena','18:30:00','Zona 15','12345678',2);
call sp_Agregar_Servicio('2020-03-14','Buffete','12:30:00','Ciudad de Guatemala','41167854',2);

-- Insertando datos a tabla Tipo_Plato
call sp_Listar_Tipo_Plato();

call sp_Agregar_Tipo_Plato('Italiano');
call sp_Agregar_Tipo_Plato('Mexicano');
call sp_Agregar_Tipo_Plato('Mediterraneo');
call sp_Agregar_Tipo_Plato('Francesa');
call sp_Agregar_Tipo_Plato('Postre');
call sp_Agregar_Tipo_Plato("Tipico");
call sp_Agregar_Tipo_Plato("Entrada");
call sp_Agregar_Tipo_Plato("Oriental");


-- Insertando datos a tabla Producto
call sp_Listar_Producto();

call sp_Agregar_Producto('Huevo',300);
call sp_Agregar_Producto('Filete',200);
call sp_Agregar_Producto('Pasta',150);
call sp_Agregar_Producto('Albondigas',258);
call sp_Agregar_Producto('Lechuga',500);
call sp_Agregar_Producto('Pan',550);
call sp_Agregar_Producto('Leche',150);
call sp_Agregar_Producto('Harina',250);
call sp_Agregar_Producto('Zanahorias',400);
call sp_Agregar_Producto('Tostadas',500);

-- Insertando datos a tabla Plato
call sp_Listar_Plato();

call sp_Agregar_Plato(100,'Sabrons','Rico plato de sopa',50.50,2);
call sp_Agregar_Plato(180,'Pastel Tres Leches','Rico postre muy jugoso',75.75,6);
call sp_Agregar_Plato(50,'Hilachas','Receta de Baja Verapaz',45.75,7);
call sp_Agregar_Plato(250,'Pastel de zanahorias','Esponjosos y repletos de aromáticos sabores de cardamomo y canela',84,6);
call sp_Agregar_Plato(152,'Rollitos de primavera ligeros','Sin frituras que están igual de buenos que los fritos',50,8);
call sp_Agregar_Plato(500,'Espagueti negro con langostinos','Servimos los espaguetis negros con langostinos, bien calientes y recién hechos',60.25,2);
call sp_Agregar_Plato(150,'Enchiladas de carne','Ricas enchiladas con tortillas de trigo',39.99,3);

-- Insertando datos a tabla Servicios_Has_Empleados
call sp_Listar_Servicio_has_Empleado();

call sp_Agregar_ServiciohasEmpleado(1,1,'2020-02-22','10:55:00','Zona 10');
call sp_Agregar_ServiciohasEmpleado(2,2,'2020-04-02','14:30:00','Zona 2');
call sp_Agregar_ServiciohasEmpleado(3,4,'2010-02-12','15:00:00','Zona 15');
call sp_Agregar_ServiciohasEmpleado(4,4,'2018-07-25','16:25:00','Zona 6');
call sp_Agregar_ServiciohasEmpleado(5,5,'2019-08-28','12:00:00','Zona 1');