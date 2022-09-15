
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Alter PROCEDURE SP_SelectProductbyCustomer
	-- Add the parameters for the stored procedure here
	@customer varchar
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @pelangganId varchar
	declare @kodeProduk int
	declare @namaproduk varchar

	--select @pelangganId = idPelanggan from pelanggan where namaPelanggan = @customer
	--select @kodeProduk = kodeProduk from keranjang where idPelanggan = @pelangganId
	--select @namaproduk = namaProduk from Product where kodeUnik= @kodeProduk
	select product.namaProduk from 
	(select keranjang.*, pelanggan.namaPelanggan
		from keranjang 
		inner join pelanggan 
		on keranjang.idPelanggan = pelanggan.idPelanggan ) as mytable
		join product on mytable.kodeProduk = product.kodeUnik
	where namaPelanggan = 'Aldo Wijanarko' ;
END
GO

EXEC SP_SelectProductbyCustomer @customer  = 'Anna Kreshnia';
