1) Create database alta_online_shop.
Sulisi SQL:


2) Dari schema Olshop yang telah kamu kerjakan di, Implementasikanlah menjadi table pada MySQL.
    Sulisi SQL:
2.a Create table user
    CREATE TABLE pelanggan (
    id_pelanggan SERIAL,
    nama VARCHAR(50),
    alamat VARCHAR(50),
    tanggal_lahir DATE,
    status_user BOOLEAN,
    gender CHAR(1),
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    PRIMARY KEY (id_pelanggan)
);

    2.b Create table product, product_type, product_description, payment_method.
    Sulisi SQL:
-- 2b. create table product
CREATE TABLE product (
    product_id SERIAL,
	product_type_id INTEGER,
	payment_method_id INTEGER,
    product_name VARCHAR(50),
    PRIMARY KEY (product_id)
);
	
-- 2b. create table product_type
CREATE TABLE product_type (
    product_type_id SERIAL,
    name VARCHAR(50),
    PRIMARY KEY (product_type_id)
);

-- 2b. create table product_description
CREATE TABLE product_description (
    product_id INTEGER,
	deskripsi VARCHAR(50),
	PRIMARY KEY (product_id)
);

-- 2b. create table payment_method
CREATE TABLE payment_method (
	payment_method_id SERIAL,
	name VARCHAR(50),
	PRIMARY KEY (payment_method_id)
);

    2.c Create table transaction, transaction detail.
    Sulisi SQL:
-- 2c. create table transaksi
CREATE TABLE transaksi (
	id_transaksi SERIAL,
	id_pelanggan INTEGER,
	tanggal DATE,
	PRIMARY KEY (id_transaksi)
);

-- 2c. create table detail transaksi
CREATE TABLE detail_transaksi (
	id_transaksi INTEGER,
	product_id INTEGER,	
	tanggal DATE,
	harga NUMERIC,
	jumlah INTEGER,
	PRIMARY KEY (id_transaksi, product_id)
);

3) Create table kurir dengan field id, name, created_at, updated_at.
Sulisi SQL:
-- 3. create table kurir
CREATE TABLE kurir (
	id_kurir SERIAL,
	nama VARCHAR(50),
	created_at TIMESTAMP,
	updated_at TIMESTAMP, 
	PRIMARY KEY (id_kurir)
);

4) Tambahkan ongkos_dasar column di tabel kurir.
Sulisi SQL:
ALTER TABLE kurir ADD COLUMN ongkos_dasar NUMERIC;

5) Rename tabel kurir menjadi shipping.
Sulisi SQL:
ALTER TABLE kurir RENAME TO shipping;

6) Hapus / Drop tabel shipping karena ternyata tidak dibutuhkan.
Sulisi SQL:
DROP TABLE shipping;

7) Silahkan menambahkan entity baru dengan relation 1-to-1, 1-to-many, many-to-many. Seperti:
    7.a) 1-to-1: payment_method dengan description.
    Sulisi SQL:
    CREATE TABLE deskripsi (
	payment_method_id INTEGER,
	deskripsi VARCHAR(50),
	PRIMARY KEY (payment_method_id)
);

    7.b) 1-to-many: user dengan alamat.
    Sulisi SQL:
CREATE TABLE alamat (
	id_alamat SERIAL,
	id_pelanggan INTEGER,
	kelurahan VARCHAR(50),
	kota VARCHAR(50),
	provinsi VARCHAR(50),
	PRIMARY KEY (id_alamat)
);

    7.c) many-to-many: user dengan payment_method menjadi user_payment_method_detail.
    Sulisi SQL:
CREATE TABLE user_payment_method_detail (
	id_pelanggan INTEGER,
	payment_method_id INTEGER,
	PRIMARY KEY (id_pelanggan, payment_method_id)																					
);
