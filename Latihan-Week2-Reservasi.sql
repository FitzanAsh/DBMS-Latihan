-- Struktur tabel tb_reservasi_hotel
DESCRIBE 
	tb_reservasi_hotel;
+-------------------+---------+------+-----+---------+----------------+
| Field             | Type    | Null | Key | Default | Extra          |
+-------------------+---------+------+-----+---------+----------------+
| reservasi_id      | int(11) | NO   | PRI | NULL    | auto_increment |
| pelanggan_id      | int(11) | YES  | MUL | NULL    |                |
| kamar_id          | int(11) | YES  | MUL | NULL    |                |
| tanggal_check_in  | date    | YES  |     | NULL    |                |
| tanggal_check_out | date    | YES  |     | NULL    |                |
| jumlah_kamar      | int(11) | YES  |     | NULL    |                |
| total_biaya       | float   | YES  |     | NULL    |                |
+-------------------+---------+------+-----+---------+----------------+

-- Mencari kamar kapasitas = 4
SELECT *
FROM
	tb_kamar
WHERE
	kapasitas = 4;
	+----------+-------------+-----------+-----------------+
| kamar_id | jenis_kamar | kapasitas | harga_per_malam |
+----------+-------------+-----------+-----------------+
|        3 | Suite       |         4 |         1500000 |
|        7 | Suite       |         4 |         1500000 |
|       11 | Suite       |         4 |         1500000 |
|       15 | Suite       |         4 |         1500000 |
|       19 | Suite       |         4 |         1500000 |
+----------+-------------+-----------+-----------------+
	
-- Menampilkan jenis kamar dan harga permalam pada tb_kamar dengan kapasitas = 2
SELECT
	jenis_kamar,
	harga_per_malam
FROM
	tb_kamar
WHERE
	kapasitas = 2;
	+-------------+-----------------+
| jenis_kamar | harga_per_malam |
+-------------+-----------------+
| Deluxe      |          750000 |
| Superior    |          500000 |
| Standard    |          300000 |
| Deluxe      |          750000 |
| Superior    |          500000 |
| Standard    |          300000 |
| Deluxe      |          750000 |
| Superior    |          500000 |
| Standard    |          300000 |
| Deluxe      |          750000 |
| Superior    |          500000 |
| Standard    |          300000 |
| Deluxe      |          750000 |
| Superior    |          500000 |
| Standard    |          300000 |
+-------------+-----------------+
	
-- Mencari nama pelanggan Kevin Sanjaya dengan hanya menampilkan nama, tanggal lahir dan alamat
select
	nama,
	tanggal_lahir,
	alamat
FROM 
	tb_pelanggan
WHERE
	nama = 'Kevin Sanjaya';
+---------------+---------------+--------------------------------+
| nama          | tanggal_lahir | alamat                         |
+---------------+---------------+--------------------------------+
| Kevin Sanjaya | 1994-01-01    | Jl. Majapahit No.14, Pontianak |
+---------------+---------------+--------------------------------+

-- Mencari id pelanggan yang check in pada tanggal 2024-10-01
SELECT
	pelanggan_id,
	tanggal_check_in
FROM
	tb_reservasi_hotel
WHERE
	tanggal_check_in = '2024-10-01';
+--------------+------------------+
| pelanggan_id | tanggal_check_in |
+--------------+------------------+
|            7 | 2024-10-01       |
+--------------+------------------+

-- Menampilkan nama, jenis_kamar, tanggal_check_in, tanggal_check_out dengan nama pelanggan atas nama Budi Raharjo

SELECT 
	tb_pelanggan.nama,
	tb_kamar.jenis_kamar,
	tb_reservasi_hotel.tanggal_check_in,
	tb_reservasi_hotel.tanggal_check_out
FROM 
	 tb_pelanggan
INNER JOIN
	tb_reservasi_hotel 
	ON tb_pelanggan.pelanggan_id = tb_reservasi_hotel.pelanggan_id
INNER JOIN
	tb_kamar 
	ON tb_kamar.kamar_id = tb_reservasi_hotel.kamar_id
WHERE tb_pelanggan.nama = 'Budi Raharjo';