alter trigger TG_ReduceStock 
on dbo.Keranjang
	after insert

as
begin
	declare @productid int, @quantity int, @actualsctock int;
	set nocount on;

	select @productid = kodeProduk , @quantity = kuantitas  from inserted
	select @actualsctock = stockProduct from Product where kodeUnik = @productid;

	update Product
	set stockProduct = @actualsctock - @quantity where kodeUnik= @productid;

end
go

select * from product;
select * from keranjang;

insert into keranjang values('C19', '0008', 9, 2, 'P001')