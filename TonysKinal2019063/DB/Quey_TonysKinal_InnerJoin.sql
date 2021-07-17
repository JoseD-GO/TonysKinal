use DBTonysKinal2019063;

DELIMITER $$
	Create procedure sp_Listar_Reporte(in codEmpresa int)
		Begin
			select * from empresa E inner join presupuesto P on 
				E.codigoEmpresa=P.codigoEmpresa
					inner join servicio S on 
						P.codigoEmpresa=S.codigoEmpresa
							where E.codigoEmpresa=codEmpresa group by S.tipo_Servicio  HAVING  COUNT(*) > 1;
		END $$;
DELIMITER ;

call sp_Listar_Reporte(2);

select S.codigoServicio, P.codigoPlato from servicio S inner join plato P where S.codigoServicio=1 and P.codigoPlato=3;

Select * from Servicio S inner join servicio_has_plato sP on 
	S.codigoServicio=sP.codigoServicio inner join Plato P 
		on P.codigoPlato= sP.codigoPlato 
			where S.codigoServicio=2

