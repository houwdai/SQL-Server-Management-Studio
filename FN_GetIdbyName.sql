--contoh penggunaan function pada pencarian product id jika hanya nama product yang diimput
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION FN_GetIdByName_Product
(
	@productname varchar(100)
)
returns int
as
begin

declare @id int;
select @id = kodeUnik from Product where namaProduk = @productname
return @id

end
go

select dbo.FN_GetIdByName_Product('Sendok') as id