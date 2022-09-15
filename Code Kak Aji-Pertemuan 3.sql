
CREATE TABLE Products (
	Id int PRIMARY KEY NOT NULL identity (1 ,1),
	Name varchar (50) null,
	Stock int null,
	Price int null
)

 
CREATE TABLE Master(
	id int not null primary key identity (1 ,1),
	TransactionDate datetime null
)

create table Details (
	Id INT PRIMARY KEY  NOT NULL identity(1,1),
	ProductId int null,
	FOREIGN KEY (ProductId) REFERENCES Products(Id),
	MasterId int null,
	FOREIGN KEY (MasterId) REFERENCES Master(Id),
	Quantity int null

)


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE SP_PenjualanBarang 
	-- Add the parameters for the stored procedure here
	@productId int, @quantity int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @actualstock int
	declare @masterId int

    -- Insert ke table master
	INSERT INTO MASTER (TransactionDate) values (GETDATE());
	Select @masterId = Id from Master where TransactionDate= max(TransactionDate);
	-- Insert into detail 
	--INSERT INTO Details (ProductId, MasterId, Quantity) values (1, 1, 2);
	INSERT INTO Details (ProductId, MasterId, Quantity) values (@productId, @masterId, @quantity);
	-- Update stock product di table stock 
	Select @actualstock = Stock from Products where Id = @productId
	Update Products set Stock = @actualstock - @quantity where Id= @productId;

END
GO



select * from Products;
select * from Master;
select * from Details;