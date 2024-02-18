RELEASE 1:

1) Insert
    1.a) Insert 3 product type.
insert into product_type (name)
values ('katun'),
('wol'),
('kapas')

    1.b, c, d) Insert 2 product dengan product type id = 1, id = 2, id = 3
insert into product (product_type_id, payment_method_id, product_name)
values ('1', '1', 'baju newbalances'),
('1', '2', 'baju adidas'),
('2', '3', 'celana olahraga'),
('2', '3', 'topi kecambah'),
('2', '3', 'baju eiger'),
('3', '1', 'celana dalam'),
('3', '2', 'singlet'),
('3', '2', 'celana levis')

    1.e) Insert product description pada setiap product.
insert into product_description (product_id, deskripsi)
values ('1', 'bagus sekali'),
('2', 'cantik sekali'),
('3', 'biasa aja'),
('4', 'indah'),
('5', 'buatan eropa'),
('6', 'bagus dan keren'),
('7', 'hebat'),
('8', 'oke deh')

    1.f) Insert 3 payment methods.
insert into payment_method (name)
values ('tunai'),
('cicilan'),
('kredit')

    1.g) Insert 5 user pada tabel user.
insert into pelanggan (nama, alamat,tanggal_lahir,status_user,gender, created_at, updated_at)
values ('ahmad', 'medan', '2002-10-10', 'True', 'L', '2024-01-01 00:00', '2024-01-01 00:00' ),
('fathoni', 'padang', '2002-01-10', 'True', 'L', '2024-01-02 00:00', '2024-01-02 00:00' ),
('lala', 'jakarta', '2002-09-10', 'True', 'P', '2024-01-03 00:00', '2024-01-03 00:00' ),
('yuyu', 'jambi', '2001-10-10', 'True', 'L', '2024-01-04 00:00', '2024-01-04 00:00' ),
('salsa', 'medan', '2002-10-10', 'True', 'P', '2024-01-01 00:00', '2024-01-01 00:00' )

    1.h) Insert 3 transaksi di masing-masing user (min 3 user). (soal berlanjut ke soal 1.j)
insert into transaksi (id_pelanggan,tanggal)
values ('1', '2024-01-01'),
('1', '2024-01-01'),
('1', '2024-01-01'),
('2', '2024-01-02'),
('2', '2024-01-02'),
('2', '2024-01-02'),
('3', '2024-01-03'),
('3', '2024-01-03'),
('3', '2024-01-03')

    1.i) Insert 3 product di masing-masing transaksi.
insert into detail_transaksi (id_transaksi,product_id,tanggal,harga,jumlah)
values ('1','1', '2024-01-01','2000', '1'),
('1','2', '2024-01-01','1000', '1'),
('1','3', '2024-01-01','3000', '1'),
('2','4', '2024-01-02','1000', '1'),
('2','5', '2024-01-02','2000', '3'),
('2','6', '2024-01-02','3000', '1'),
('3','1', '2024-01-03','4000', '2'),
('3','2', '2024-01-03','5000', '1'),
('3','3', '2024-01-03','6000', '1'),
('4','5', '2024-01-03','4000', '2'),
('4','6', '2024-01-03','5000', '1'),
('4','7', '2024-01-03','6000', '1'),
('5','1', '2024-01-03','4000', '2'),
('5','2', '2024-01-03','5000', '1'),
('5','3', '2024-01-03','6000', '1'),
('6','4', '2024-01-03','4000', '2'),
('6','5', '2024-01-03','5000', '1'),
('6','6', '2024-01-03','6000', '1'),
('7','1', '2024-01-01','2000', '1'),
('7','2', '2024-01-01','1000', '1'),
('7','3', '2024-01-01','3000', '1')

2) Select
    2.a) Tampilkan nama user / pelanggan dengan gender Laki-laki / M.
select nama from pelanggan where gender = 'L'

    2.b) Tampilkan product dengan id = 3.
select product_name from product where product_type_id = '3'

    2.c) Tampilkan data pelanggan yang created_at dalam range 7 hari kebelakang dan mempunyai nama mengandung kata ‘a’.
select * from pelanggan where created_at between '2024-01-01 00:00' and '2024-01-04 00:00' and nama like '%a%'

    2.d) Hitung jumlah user / pelanggan dengan status gender Perempuan.
select count (nama)
from pelanggan 
where gender = 'P'

    2.e) Tampilkan data pelanggan dengan urutan sesuai nama abjad
select * from pelanggan order by nama asc

    2.f) Tampilkan 5 data transaksi dengan product id = 3
select * from transaksi where product_id = '3'

3. Update
    3.a) Ubah data product id 1 dengan nama ‘product dummy’.
update product 
set product_name = 'product dummy'
where product_id = '3'

    3.b) Update qty = 3 pada transaction detail dengan product id 1.
update detail_transaksi
set jumlah = '3'
where product_id = '1'

4. Delete
    4.a) Delete data pada tabel product dengan id 1.
delete from product where product_id = '1'

    4.b) Delete pada tabel product dengan product-type id 1.
delete from product where product_type_id = '1'


RELEASE 2: Join, Union, Sub-query, Function

1. Gabungkan data transaksi dari user id 1 dan user id 2.
select * from transaksi where id_pelanggan = '1'
union
select * from transaksi where id_pelanggan = '2'
order by id_pelanggan asc

2. Tampilkan jumlah harga transaksi user id 1.
select harga
count (1)
from detail_transaksi
where id_transaksi in (select id_transaksi from transaksi where id_pelanggan = 1)
group by harga

3. Tampilkan total transaksi dengan product type 2.
select count (id_transaksi)
from detail_transaksi 
where product_id in
(select product_id from product where product_type_id = '2')

4. Tampilkan semua field table product dan field name table product type yang saling berhubungan.
select product.product_name, product_type.name
from product
inner join product_type
on product.product_type_id = product_type.product_type_id

5. Tampilkan semua field table transaction, field name table product dan field name table user.
select  transaksi.id_transaksi, product.product_name, pelanggan.nama
from transaksi 
inner join detail_transaksi
on transaksi.id_transaksi = detail_transaksi.id_transaksi
inner join product
on detail_transaksi.product_id = product.product_id
inner join pelanggan
on transaksi.id_transaksi = pelanggan.id_pelanggan;

6. Tampilkan data products yang tidak pernah ada di tabel transaction_details dengan sub-query.
select * from product where product_id not in
(select product_id from detail_transaksi)
