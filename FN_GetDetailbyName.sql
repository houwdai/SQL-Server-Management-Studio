USE [MCC]
GO
/****** Object:  UserDefinedFunction [dbo].[FN_GetDetailbyName_Product]    Script Date: 16/09/2022 00:56:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER FUNCTION [dbo].[FN_GetDetailbyName_Product]
(
	@productname varchar(100)
)
returns table 
return ( 
select kodeUnik, namaProduk,  hargaProduct, stockProduct from Product where namaProduk = @productname
)
