
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE dbo.SP_MasukkanDataKeranjang
	-- Add the parameters for the stored procedure here
		@kodeKeranjang varchar,@idPelanggan varchar, @kodeProduk int,@kuantitas int, @jasaPengiriman varchar

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO keranjang VALUES (@kodeKeranjang, @idPelanggan, @kodeProduk, @kuantitas, @jasaPengiriman) 
END
GO

USE [MCC]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[SP_MasukkanDataKeranjang]
		@kodeKeranjang = 'c21',
		@idPelanggan = '0001',
		@kodeProduk = 9,
		@kuantitas = 1,
		@jasaPengiriman = 'p001'

SELECT	'Return Value' = @return_value

GO
select * from keranjang

insert into keranjang values ('C21', '001', 9, 1, 'p001')