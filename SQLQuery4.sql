use neptuno;

-- Lista de los años de pedido
ALTER PROCEDURE Usp_fecha	 
@fec1 DateTime,
@fec2 DateTime
AS
SELECT * FROM Pedidos
WHERE FechaPedido between @fec1 AND @fec2

Usp_fecha '1994-09-01', '2018-08-16'

SELECT GETDATE ()

CREATE PROCEDURE Usp_detalle
@IdPedido INT
AS
SELECT detallesdepedidos.idpedido,NombreProducto,detallesdepedidos.preciounidad,Cantidad,detallesdepedidos.preciounidad*cantidad AS Monto
FROM detallesdepedidos INNER JOIN productos
ON detallesdepedidos.idProducto=Productos.idProducto
WHERE idPedido=@idpedido



CREATE PROCEDURE usp_Total
@IdPedido INT,
@Total MONEY OUTPUT
AS
BEGIN
SET @Total=( SELECT SUM(precioUnidad*cantidad) 
FROM detallesdepedidos
WHERE idpedido=@IdPedido)
END

DECLARE @Total Money
EXEC usp_Total 10248,@Total output
SELECT @Total

--Lista de los años de pedido
CREATE PROCEDURE Usp_listaAnioPedido 
AS
SELECT DISTINCT YEAR(fechapedido) AS Anios FROM Pedidos

Usp_listaAnioPedido

alter proc USP_InsCategoria
@idcategoria int,
@nombrecategoria varchar(100),
@descripcion text
as
begin
-- declare @idcategoria int
-- set @idcategoria = (select max(Idcategoria)+1 from categorias)
insert into categorias (idcategoria,nombrecategoria,descripcion)
values (@idcategoria, @nombrecategoria, @descripcion)
end

create proc USP_UpdCategoria
@idcategoria int,
@nombrecategoria varchar(100),
@descripcion text
as
begin
update categorias set nombrecategoria=@nombrecategoria, descripcion=@descripcion
where idcategoria=@idcategoria
end

create proc USP_DelCategoria
@idcategoria int
as
begin
delete from categorias where idcategoria=@idcategoria
end

create proc USP_GetCategoria
@idcategoria int=0
as
begin
select idcategoria,nombrecategoria,descripcion
from categorias
where idcategoria=@idcategoria or @idcategoria=0
end