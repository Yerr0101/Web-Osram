-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 08 Jun 2025 pada 11.28
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `osram`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `created_at`) VALUES
(1, 'admin1', '$2y$10$xO67vndvELgv0Hom90wRDuBEnWUH5DQk/h7jGsKRHjWQxvktkcIJW', '2025-05-30 14:21:25'),
(2, 'adminosram', '$2y$10$ozV8nQIZFolsA8YqOJGNgOhJj1Wb5J77yf2pCthGuOT9MLIa2Tq.G', '2025-06-02 12:11:59');

-- --------------------------------------------------------

--
-- Struktur dari tabel `keranjang`
--

CREATE TABLE `keranjang` (
  `id_keranjang` int(11) NOT NULL,
  `id_users` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL DEFAULT 1,
  `total_harga` int(11) NOT NULL,
  `selected` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `keranjang`
--

INSERT INTO `keranjang` (`id_keranjang`, `id_users`, `id_produk`, `jumlah`, `total_harga`, `selected`) VALUES
(7, 5, 4, 3, 135000, 0),
(8, 5, 6, 1, 21000, 0),
(54, 1, 1, 2, 0, 0),
(72, 10, 3, 3, 99000, 0),
(74, 9, 3, 2, 66000, 0),
(75, 8, 8, 1, 21000, 0),
(76, 8, 4, 1, 45000, 0),
(77, 8, 11, 2, 12000, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id_order` int(11) NOT NULL,
  `id_users` int(11) NOT NULL,
  `total_harga` int(11) NOT NULL,
  `metode_pembayaran` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `tanggal_pesanan` datetime NOT NULL,
  `status` varchar(50) DEFAULT 'Menunggu Konfirmasi'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`id_order`, `id_users`, `total_harga`, `metode_pembayaran`, `alamat`, `tanggal_pesanan`, `status`) VALUES
(1, 8, 66000, 'COD', 'Jalan Raden Patah 39', '2025-05-30 13:21:57', 'Menunggu Pengiriman'),
(2, 8, 90000, 'COD', 'Jalan Raden Patah 39', '2025-05-30 13:31:15', 'Menunggu Pengiriman'),
(3, 8, 90000, 'COD', 'Jalan Raden Patah 39', '2025-05-30 13:32:15', 'Menunggu Pengiriman'),
(4, 8, 90000, 'COD', 'Jalan Raden Patah 39', '2025-05-30 14:41:53', 'Menunggu Pengiriman'),
(5, 9, 75000, 'Transfer', 'asa', '2025-05-30 14:46:35', 'Menunggu Pengiriman'),
(6, 9, 42000, 'COD', 'asa', '2025-05-30 14:47:11', 'Menunggu Pengiriman'),
(7, 9, 68000, 'Transfer', 'asa', '2025-05-30 14:47:25', 'Menunggu Konfirmasi'),
(8, 8, 38000, 'COD', 'Jalan Raden Patah 39', '2025-05-30 14:50:06', 'Menunggu Pengiriman'),
(9, 8, 68000, 'Transfer', 'Jalan Raden Patah 39', '2025-05-30 14:50:24', 'Menunggu Pengiriman'),
(10, 8, 42000, 'Transfer', 'Jalan Raden Patah 39', '2025-05-30 14:51:01', 'Menunggu Konfirmasi'),
(11, 8, 76000, 'COD', 'Jalan Raden Patah 39', '2025-05-30 14:52:39', 'Menunggu Pengiriman'),
(12, 8, 90000, 'COD', 'Jalan Raden Patah 39', '2025-05-30 14:53:33', 'Selesai'),
(13, 9, 211000, 'QRIS', 'raden patah 39', '2025-05-30 22:03:15', 'Menunggu Konfirmasi'),
(14, 9, 68000, 'QRIS', 'raden patah 39', '2025-05-30 22:23:11', 'Menunggu Pengiriman');

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_details`
--

CREATE TABLE `order_details` (
  `id_detail` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(255) NOT NULL,
  `harga` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `order_details`
--

INSERT INTO `order_details` (`id_detail`, `id_order`, `id_produk`, `nama_produk`, `harga`, `jumlah`) VALUES
(1, 3, 4, 'Buku Sidu', 45000, 2),
(2, 4, 4, 'Buku Sidu', 45000, 2),
(3, 5, 3, 'Minyak Bimoli', 33000, 1),
(4, 5, 34, 'Tissue Nice', 42000, 1),
(5, 6, 8, 'Aqua Galon', 21000, 2),
(6, 7, 2, 'Betadine', 34000, 2),
(7, 8, 12, 'Gula Gulaku', 19000, 1),
(8, 8, 9, 'Gas Elpiji', 19000, 1),
(9, 9, 2, 'Betadine', 34000, 2),
(10, 10, 8, 'Aqua Galon', 21000, 2),
(11, 11, 1, 'Beras Sania', 76000, 1),
(12, 12, 4, 'Buku Sidu', 45000, 2),
(13, 13, 8, 'Aqua Galon', 21000, 1),
(14, 13, 12, 'Gula Gulaku', 19000, 2),
(15, 13, 9, 'Gas Elpiji', 19000, 4),
(16, 13, 23, 'LA ICE', 34000, 1),
(17, 13, 34, 'Tissue Nice', 42000, 1),
(18, 14, 2, 'Betadine', 34000, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `deskripsi` text NOT NULL,
  `stok` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id_produk`, `nama`, `harga`, `gambar`, `deskripsi`, `stok`) VALUES
(1, 'Beras Sania', 76000, 'beras sania 76k.png', 'Beras Sania adalah beras premium yang dihasilkan dari padi berkualitas tinggi. Beras ini diproduksi oleh perusahaan lokal di Indonesia. \r\n\r\nCiri khas : Pulen, bersih, tidak berbau, dan bebas dari pemutih atau pengawet.\r\nKandungan : Karbohidrat kompleks, protein, serat, vitamin B, magnesium, dan fosfor.\r\nPengolahan : Menggunakan teknologi pengolahan pascapanen modern, termasuk pengeringan dan penggilingan yang cermat.\r\nKeunggulan : Aman dikonsumsi sehari-hari, cocok untuk berbagai masakan, dan mendukung fungsi metabolisme yang sehat.\r\n\r\nVarian : Premium, 5Kg.', 12),
(2, 'Betadine', 34000, 'betadine 34k.png', 'Betadine adalah produk antiseptik yang bermanfaat untuk mencegah pertumbuhan dan membunuh kuman penyebab infeksi. Obat antiseptik ini tersedia dalam bentuk cairan, salep, semprot, dan stik. Betadine mengandung povidone iodine sebagai bahan aktif utama.\r\n\r\nMembunuh kuman penyebab infeksi dan profilaksis infeksi mata setelah prosedur bedah.\r\n\r\nKondisi : Baru\r\nUkuran : 30 ml', 20),
(3, 'Minyak Bimoli', 33000, 'bimoli 33k.png', 'Untuk mendapatkan hidangan yang lezat dan enak tentu dibutuhkan minyak goreng dengan kualitas baik. Bimoli adalah minyak goreng yang dibuat dari biji kelapa sawit pilihan dan diproses secara sempurna melalui tahap Pemurnian Multi Proses (PMP). Minyak Bimoli mampu mempertahankan kandungan zat-zat yang bermanfaat bagi kesehatan terutama Omega 9. Selain itu, minyak ini juga dapat berfungsi untuk menaikan dan menurunkan kolesterol HDL. Untuk pilihan produknya, Bimoli menyediakan berbagai macam bentuk kemasan, seperi botol, Jerigen, dan Pouch dengan ukuran yang bervariasi.\r\n\r\nKategori : Minyak masakan\r\nUkuran : 1 Liter', 20),
(4, 'Buku Sidu', 45000, 'buku sidu 45k.png', 'Buku SiDU adalah merek buku tulis populer di Indonesia, terutama di kalangan pelajar. Buku SiDU dikenal karena kualitas kertasnya yang baik, tidak kasar, dan tidak mudah robek, serta sampulnya yang menarik dengan berbagai desain. SiDU juga menawarkan berbagai macam jenis buku, seperti buku tulis dengan berbagai jumlah lembar.\r\n\r\nKualitas : Buku tulis SiDU dikenal karena kualitas kertasnya yang baik dan tebal, sehingga nyaman untuk menulis dan tidak mudah robek. \r\nDesain : Buku SiDU memiliki berbagai desain sampul yang menarik, seperti tema langit dan angkasa, teknologi, alam, olahraga, dan petualangan, sehingga cocok untuk pelajar. \r\n\r\nJumlah lembar : 58 lembar', 2),
(5, 'Pasta gigi Closeup', 8000, 'closeup 8k.png', 'Closeup Mentol Fresh, pasta gigi dengan gel hijau menthol untuk nafas lebih segar sepanjang hari. Mengandung formula Zinc-Antibakteri yang telah teruji dapat memberikan nafas segar hingga 18 jam*. Kini tersedia dalam kemasan ramah lingkungan yang bisa didaur ulang.\r\nDengan busa lebih lembut, Closeup Mentol Fresh efektif membersihkan lebih bersih hingga ke bagian mulut yang terdalam dan membersihkan kuman penyebab bau mulut.\r\nMengandung formula antibacterial mouthwash yang membersihkan setiap sudut mulut.\r\nMengandung micro-shine crystals yang memcerahkan gigi di setiap pemakaian.\r\n\r\nUkuran : 65 G', 10),
(6, 'Ember plastik', 21000, 'ember 21k.png', 'Ember Cor Hitam 18/ Ember Hitam Cor Gagang Kawat.\r\n\r\nVolume: 2.5 galon 8 Liter\r\nDiameter : 30 CM\r\nTinggi : 23 CM', 10),
(7, 'Sikat gigi Formula', 12000, 'formula 12k.png', 'Sikat gigi Formula tersedia dalam berbagai kombinasi bulu dan bentuk kepala sikat yang bervariasi, didesain berdasarkan kontur gigi dengan bulu lembut, dan menyediakan sikat gigi bagi yang membutuhkan solusi khusus untuk kesehatan mulut.\r\nSikat gigi dengan perpaduan inovasi 85 bulu sikat yang ekstra halus yang mampu membersihkan plak dan sisa makanan di kantong gusi secara efektif\r\n85 Lubang Bulu\r\nInovasi pertama di dunia dengan 85 lubang bulu. Bulu 2x lebih rapat sehingga 2x lebih efektif membersihkan plak.\r\nBulu 0.01 Mm\r\nUjung bulu halus 0.01 mm lebih efektif membersihkan sisa makanan di kantong gusi.\r\nGagang Karet\r\nGagang sikat gigi dilapisi karet sehingga mantap dipegang dan tidak licin.\r\n\r\nIsi : 3 pcs', 10),
(8, 'Aqua Galon', 21000, 'galon aqua 21k.png', 'Sebagai salah satu kebutuhan rumah tangga setiap harinya, AQUA berupaya untuk menghadirkan air mineral berkualitas di sekitar Anda. AQUA, sebagai pionir kemasan guna ulang, menyediakan kemasan galon guna ulang agar cocok memenuhi kebutuhan rumah tangga tanpa menambah sampah plastik.\r\nAQUA berasal dari sumber air pegunungan terpilih di Indonesia. Secara alami, air telah melewati proses penyaringan oleh lapisan batuan vulkanis sehingga AQUA tentu penuh dengan kebaikan alam. Ekosistem di sekitar sumber air nya pun terlindungi.\r\n\r\nUkuran : 19 Liter', 10),
(9, 'Gas Elpiji', 19000, 'gas elpiji 19k.png', 'Gas elpiji 3 kg, atau sering disebut gas melon, adalah Liquefied Petroleum Gas (LPG) bersubsidi yang dikemas dalam tabung berukuran 3 kg. Tabung ini berwarna hijau muda dan menjadi bahan bakar rumah tangga yang banyak digunakan di Indonesia. Tabung gas 3 kg memiliki berat kosong 5 kg dan berat isi 8 kg. \r\nPemerintah memberikan subsidi pada gas elpiji 3 kg untuk menjangkau masyarakat berpenghasilan rendah dan usaha mikro. \r\nGas elpiji 3 kg digunakan untuk memasak dan keperluan rumah tangga lainnya.\r\n\r\nUkuran : 3 Kg', 10),
(10, 'Kopi Golda', 3000, 'golda 3k.png', 'Golda Coffee adalah minuman kopi latte siap minum dari Wings Food, yang dibuat dengan perpaduan biji kopi Brazil berstandar tertinggi dan susu Belgia. Minuman ini memiliki rasa manis yang pas, aroma kopi Brazil yang kuat, tekstur lembut, dan kadar keasaman yang rendah. Kemasan Golda Coffee praktis dan higienis, serta tidak mengandung pengawet, sehingga aman untuk dikonsumsi. \r\n\r\nKemasan : Kemasan yang praktis membuat minuman ini mudah dinikmati kapan saja dan di mana saja.\r\nRasa : Golda Coffee menawarkan rasa yang kaya dan nikmat, dengan aroma biji kopi Brazil yang kuat dan tekstur susu Belgia yang lembut.\r\n\r\nUkuran : 200 ml', 10),
(11, 'Kopi Good Day', 6000, 'good day 6k.png', 'Kopi Good Day adalah merek kopi instan yang populer di Indonesia, dikenal dengan berbagai varian rasa dan kemasan praktis. Kopi ini ditargetkan untuk anak muda dan menawarkan rasa kopi yang enak tanpa perlu menyeduh secara manual.\r\nKopi Good Day memiliki kandungan seperti gula, krimmer nabati, protein, lemak, protein, dan vitamin.\r\nKopi Good Day punya energi total 110 kkal hingga 160 kkal.\r\n\r\nVarian : Cappucino\r\nUkuran : 250 ml', 5),
(12, 'Gula Gulaku', 19000, 'gulaku 19k.png', 'GULA PASIR GULAKU-KUNING KEMASAN 1KG\r\nGulaku gula pasir putih, di produksi dari 100% tebu segar pilihan dengan mutu terbaik dan melalu proses penyaringan yang higenis, tanpa bahan pengawet, cocok untuk membuat kue, memasak dan kegunaan sehari - hari.\r\nGulaku merupakan produk gula pasir pertama yang diberi merek dan diiklankan. Gulaku diproduksi dari tebu segar bermutu baik dari perkebunan tebu di Lampung dengan menggunakan proses produksi yang memenuhi standar mutu untuk menghasilkan gula yang manis, alami, murni dan bersih agar menjadi baik untuk dikonsumsi.\r\n\r\nUkuran : 1 kg', 15),
(13, 'Sabun Lifebuoy Batang', 5000, 'lifebuoy batang 5k.png', 'Sabun batang Lifebuoy adalah sabun mandi padat yang diformulasikan untuk membersihkan dan melindungi kulit dari kuman penyebab penyakit. Sabun ini tersedia dalam berbagai varian, seperti Total 10, Cool Fresh, Lemon Fresh, dan Mild Care, masing-masing dengan formula dan manfaat khusus.\r\nLifebuoy dikenal karena kemampuannya melindungi dari kuman penyebab penyakit, dengan beberapa varian mengandung formula seperti Activ Silver Formula atau Multivitamin untuk meningkatkan daya tahan terhadap kuman.\r\nBeberapa varian Lifebuoy, seperti Mild Care, mengandung bahan-bahan yang dapat merawat kulit, seperti krim susu atau ekstrak alami, untuk memberikan kelembutan dan kehalusan pada kulit. \r\n\r\nVarian : Total 10', 12),
(14, 'Milo', 11000, 'milo 11k.png', 'Minuman Serbuk Cokelat Paduan dengan Malt.\r\n\r\nDengan 6 Vitamin & 3 Mineral.\r\n\r\nNestle MILO ActivGo merupakan minuman serbuk cokelat paduan dan ekstrak malt (barli) yang unik dengan komposisi Vitamin B12, B3, B6, B2, C dan D serta Kalsium, Fosfor dan Zat Besi untuk mendukung aktivitas sepanjang hari.\r\n\r\nUkuran : 22 g', 15),
(15, 'Minyak Kayu Putih', 26000, 'minyak kayu putih 26k.png', 'Minyak kayu putih dihasilkan dari hasil penyulingan daun dan ranting kayu putih (M. leucadendra) yang merupakan metabolit sekunder yang dihasilkan oleh pohon tersebut. Minyak asiri ini dipakai sebagai minyak pengobatan, dapat dikonsumsi per oral (diminum) atau, lebih umum, dibalurkan ke bagian tubuh. Khasiatnya adalah sebagai penghangat tubuh, pelemas otot, dan mencegah perut kembung.\r\nMinyak ini mengandung terutama eukaliptol (1,8-cineol) (komponen paling banyak, sekitar 60%), α-terpineol dan ester asetatnya, α-pinen, dan limonen.\r\n\r\nUkuran : 60 ml', 12),
(16, 'Panadol', 11000, 'panadol 11k.png', 'Panadol Biru bermanfaat untuk meredakan nyeri, seperti sakit kepala, sakit gigi, dan nyeri otot, serta menurunkan demam. Tiap kaplet Panadol Biru mengandung 500 mg paracetamol.\r\nObat ini digunakan untuk meringankan sakit kepala dan sakit gigi. Tiap kaplet mengandung Paracetamol 500 mg dan Caffeine 65 mg.\r\nTersertifikasi Halal. Dengan formula Extra, efektif meredakan sakit kepala tak tertahankan, sakit gigi, dan nyeri yang mengganggu. Tidak menyebabkan kantuk.\r\n\r\nIsi : 10 pcs', 10),
(17, 'Alat Pel', 30000, 'pel 30k.png', 'Alat pel adalah alat yang digunakan untuk membersihkan lantai dengan menyeka kotoran dan cairan. Alat ini terdiri dari kepala pel (yang terbuat dari bahan seperti kain, spons, atau serat) dan gagang atau tongkat untuk memudahkan pengguna dalam mengepel. \r\nAlat pel dapat membantu membersihkan lantai dengan lebih efisien dan hemat tenaga. \r\nMengepel secara rutin dapat membantu menjaga lantai bersih dari debu, kotoran, dan kuman. \r\n', 22),
(18, 'Pulpen AE7', 18000, 'pena AE7 18k.png', 'Pulpen Standard AE7 adalah pulpen dengan kualitas yang baik dan terjangkau, sering disebut sebagai pulpen terlaris sepanjang masa. Pulpen ini menggunakan teknologi orbit cut dan space ball pada mata pena, sehingga memberikan tulisan yang pekat, bebas noda, dan smooth. Pegangannya juga dirancang anti slip dan nyaman digunakan. \r\nMata pena dengan teknologi orbit cut dan space ball untuk hasil tulisan yang lebih baik.\r\nPegangan anti slip dan nyaman. Tinta yang dapat melekat sempurna pada bola mata pena, menghasilkan tulisan yang pekat, bebas noda, dan smooth. Dapat diisi ulang (refillable) \r\n\r\nMerk : Standar\r\nTipe : AE7\r\nUkuran : 0.5 mm\r\nIsi : 12 pcs\r\n', 31),
(19, 'Penggaris Butterfly', 5000, 'penggaris butterfly 5k.png', 'Penggaris Butterfly adalah penggaris yang umum digunakan untuk mengukur dan menggambar garis lurus. Terbuat dari bahan plastik atau akrilik, penggaris ini memiliki desain yang ringan dan tahan lama, dengan lapisan transparan untuk memudahkan pengukuran. Penggaris ini sering kali memiliki desain unik dengan gambar kupu-kupu di bagian atasnya.\r\nPenggaris ini digunakan untuk mengukur jarak, menggambar garis lurus, dan bahkan sebagai alat bantu untuk memotong kertas. \r\nDesain penggaris ini sering kali memiliki gambar kupu-kupu, menambah sentuhan estetika. \r\n\r\nBahan : Plastik atau akrilik\r\nUkuran : 30 cm\r\n', 13),
(20, 'Pensil Faber Castell', 16000, 'pensil 16k.png', 'Pensil Faber Castell dikenal sebagai pensil berkualitas tinggi, baik untuk seni, menulis, maupun untuk ujian. Pensil ini memiliki berbagai jenis, seperti pensil 2B untuk ujian yang menghasilkan arsiran gelap, pensil warna (watercolour pencils) yang aman untuk anak-anak, dan pensil klasik untuk seniman.\r\n\r\nDirancang khusus untuk ujian dengan arsiran gelap yang sempurna dan tidak mudah patah. \r\nLulus uji scanner OMR dan DMR. \r\nMenggunakan teknologi SV Bonding untuk mencegah patah dan memudahkan meraut.\r\n\r\nIsi : 12 pcs\r\n', 25),
(21, 'Pop Ice Choco Cream', 13000, 'pop ice 13k.png', 'Pop Ice Choco Cream adalah minuman serbuk milkshake dengan rasa cokelat creamy yang lezat dan menyegarkan. Minuman ini biasanya disajikan dengan es dan dicampur dengan blender untuk menghasilkan tekstur yang lembut dan creamy, mirip dengan milkshake. \r\n\r\nSelain diminum, Pop Ice Choco Cream juga dapat digunakan sebagai toping tambahan atau bahan dasar untuk membuat minuman dan makanan lain. \r\n\r\nMengandung pemanis buatan, disarankan tidak dikonsumsi oleh anak di bawah 5 tahun, ibu hamil, dan ibu menyusui. \r\nMengandung fenilalanin, tidak cocok untuk penderita fenilketonurik. \r\n\r\nIsi : 10 pcs', 2),
(22, 'Qtela', 5000, 'qtela 18k.png', 'Qtela adalah merek keripik singkong yang diproduksi oleh PT Indofood Fritolay Makmur. Qtela merupakan camilan ringan khas Indonesia yang terbuat dari singkong pilihan. \r\n\r\nDiproduksi secara modern dan higienis, sehingga aman dikonsumsi\r\n\r\nVarian : Keripik Singkong\r\nRasa : Balado\r\nUkuran : 60 g', 20),
(23, 'LA ICE', 34000, 'rokok la ice 34k.png', 'LA Ice adalah rokok kretek (rokok dengan cengkeh) yang diproduksi oleh PT Djarum, dikenal dengan sensasi dingin dan rasa ringan. Rokok ini memiliki filter berwarna biru sebagai ciri khasnya dan diposisikan sebagai rokok mild (rendah nikotin dan tar). LA Ice menawarkan rasa kretek yang khas dengan sentuhan cengkeh, serta sensasi dingin yang ditimbulkan dari hisapan. \r\n\r\nJenis : Rokok kretek (rokok dengan cengkeh).\r\nCiri Khas : Filter biru, sensasi dingin, dan rasa ringan.\r\nIsi : 16 batang', 20),
(24, 'Magnum Filter', 28000, 'rokok magnum 28k.png', 'Magnum Filter adalah rokok kretek dari Dji Sam Soe yang dikenal dengan cita rasa full flavor dan aroma khasnya. Rokok ini menggunakan tembakau dan cengkeh pilihan yang diracik dengan saus khas Dji Sam Soe, menciptakan pengalaman rokok kretek yang unik. Magnum Filter juga dilengkapi dengan filter khusus yang menghaluskan asap. \r\n\r\nMagnum Filter menawarkan paduan sempurna antara cengkeh alami dan tembakau aromatik Jawa, menghasilkan rasa yang kuat dan aroma yang khas. \r\n\r\nFilter khusus pada Magnum Filter membantu menghaluskan asap, sehingga memberikan pengalaman menghisap yang lebih nyaman.\r\n\r\nIsi : 12 batang', 6),
(25, 'Sampoerna Mild', 35000, 'rokok sampoerna 35k.png', 'Sampoerna Mild adalah rokok kretek mesin (SKM) yang dikenal dengan rasa ringan dan nikotin rendah. Rokok ini memiliki kadar tar 14 mg dan nikotin 1 mg, lebih rendah dibandingkan rokok kretek pada umumnya. Sampoerna Mild menggunakan perpaduan cengkeh dan tembakau pilihan yang menghasilkan rasa khas dan smooth. \r\n\r\nJenis : Rokok kretek mesin (SKM).\r\nKadar Tar : 14 mg.\r\nKadar Nikotin : 1 mg.\r\nRasa : Ringan, smooth, dan memiliki rasa khas dari perpaduan cengkeh dan tembakau.\r\nIsi : 16 batang', 20),
(26, 'Surya Gudang Garam', 26000, 'rokok surya 26k.png', 'Surya Professional adalah rokok yang dibuat dari racikan tembakau dan cengkeh berkualitas, serta dibekali dengan saus ciri khas Gudang Garam.\r\n\r\nTergolong dalam sigaret kretek linting mesin, kiprah rokok Surya dalam dunia tembakau memiliki peminat yang tidak sedikit.\r\n\r\nAroma Surya Nusantara terasa sangat kuat. Aroma rempahnya cukup dominan dan terasa fresh. Jika kita bakar rokoknya, suara kretek,kretek,kretek nya terdengar keras, menandakan bahwa komposisi cengkehnya cukup dominan.\r\n\r\nIsi : 12 batang', 25),
(27, 'Sabun Lifebuoy Cair', 28000, 'sabun lifebuoy 28k.png', 'Lifebuoy sabun mandi cair adalah sabun antibakteri yang dirancang untuk melindungi kulit dari kuman penyebab penyakit. Sabun ini mengandung formula ActivSilver yang membantu membunuh kuman. Tersedia dalam berbagai varian seperti Lemon Fresh, Mild Care, dan Total 10. \r\n\r\nLifebuoy sabun mandi cair diformulasikan dengan ActivSilver, sebuah formula yang efektif melawan kuman penyebab penyakit. \r\n\r\nVarian : total 10\r\nJenis : isi ulang\r\nUkuran : 800 ml\r\n', 10),
(28, 'Sampo Sunsilk Black Shine', 22000, 'sampo sunsilk 22k.png', 'Sunsilk adalah merek sampo perawatan rambut yang diproduksi oleh Unilever Indonesia sejak tahun 1952. Sunsilk dikenal dengan varian Black Shine yang mengandung bahan-bahan alami seperti urang aring, ginseng, dan mint, serta varian lain seperti Soft & Smooth dengan argan oil dan soy milk protein. Sunsilk juga memiliki varian untuk hijab, seperti Hijab Refresh & Volume, yang mengandung bahan-bahan seperti pomegranate dan mint untuk menjaga rambut tetap segar dan bervolume saat berhijab. \r\n\r\nUkuran : 160 ml', 15),
(29, 'Sapu', 22000, 'sapu 22k.png', 'Sapu adalah alat rumah tangga yang digunakan untuk membersihkan debu, sampah, dan kotoran lainnya dari permukaan lantai atau tanah. Sapu biasanya memiliki pegangan dan bagian yang terbuat dari serat-serat alami seperti ijuk (dari pohon aren), lidi (dari pelepah kelapa atau aren), atau jerami. \r\n\r\nSapu berfungsi untuk menyapu debu, kotoran, sampah, dan benda-benda kecil lainnya dari permukaan lantai atau tanah. \r\n\r\nMenyapu dapat membantu mengurangi alergen di udara dengan membuang partikel seperti tungau debu, bulu hewan peliharaan, dan serbuk sari. \r\nMenyapu dapat membuat rumah lebih bersih dan rapi. \r\n\r\njenis : Sapu ijuk', 11),
(30, 'Tango', 4000, 'tango 4k.png', 'Tango dengan ukuran 4K (4000 x 2000 piksel). Tango adalah merek wafer yang diproduksi oleh PT. Ultra Prima Abadi, sebuah perusahaan yang dikenal dengan berbagai varian wafer dan produk lainnya. Wafer Tango dikenal dengan lapisan wafer renyah dan krim di tengahnya. \r\n\r\nWafer Tango dikenal karena lapisan wafernya yang renyah dan tipis.\r\n\r\nWafer ini memiliki lapisan krim di tengahnya yang memberikan rasa manis dan gurih.\r\n\r\nVarian : Coklat\r\n', 14),
(31, 'Taro', 7000, 'taro 7k.png', 'Taro adalah merek makanan ringan yang sangat populer di Indonesia, diproduksi oleh FKS Food Sejahtera. Salah satu produk populer Taro adalah Taro Net, yang memiliki bentuk jaring-jaring kotak dan tersedia dalam berbagai rasa seperti seaweed (rumput laut) atau potato barbeque (kentang barbekyu). Taro dikenal dengan rasa dan teksturnya yang renyah, serta tema petualangan yang khas. \r\n\r\nTaro Net Seaweed mengandung tepung terigu, minyak nabati, tapioka, bumbu rasa rumput laut, dan bahan-bahan lainnya. \r\n\r\nRasa : Rumput laut\r\nUkuran : 32 g', 16),
(32, 'Telur Ayam Kampung', 33000, 'telur 33k.png', 'Telur ayam kampung asli memiliki ciri-ciri fisik seperti cangkang berwarna terang atau putih kecoklatan, tekstur cangkang lebih halus dan mulus, serta ukuran yang lebih kecil dibandingkan telur ayam ras. Telur ayam kampung juga dikenal memiliki rasa yang lebih lezat dan kaya nutrisi seperti omega-3 dan antioksidan. \r\n\r\nTelur ayam kampung cenderung lebih kecil, sekitar 27-56 gram per butir.\r\n\r\nTelur ayam kampung mengandung lebih banyak nutrisi seperti omega-3, antioksidan, vitamin A, dan berbagai mineral. \r\n\r\nIsi : 16 butir\r\nUkuran : 1 kg', 10),
(33, 'Tissue Basah Cussons Baby', 19000, 'tissue basah cussons baby 19k.png', 'Tisu basah Cussons Baby menawarkan berbagai jenis dengan formula yang disesuaikan untuk memenuhi kebutuhan bayi dan kulit sensitif mereka, seperti Mild & Gentle, Naturally Refreshing, Pure & Gentle, dan Fresh & Nourish. Produk ini umumnya bebas alkohol, mengandung bahan lembut dan alami, serta telah diuji secara dermatologi untuk memastikan keamanan dan efektivitasnya. \r\n\r\nTisu basah Cussons Baby umumnya efektif untuk membersihkan kotoran pada kulit bayi, memberikan kesegaran, dan menjaga kelembapan kulit. Beberapa produk juga mengandung bahan tambahan seperti ekstrak buah, vitamin E, dan antioksidan untuk memberikan manfaat tambahan bagi kulit bayi. ', 25),
(34, 'Tissue Nice', 42000, 'tissue nice 42k.png', 'Tisu Nice adalah tisu yang dikenal karena kualitasnya yang lembut, kuat, dan terbuat dari 100% serat alami. Tisu ini cocok untuk berbagai kebutuhan, mulai dari pembersih wajah hingga membersihkan berbagai permukaan. Nice Facial merupakan tisu wajah yang lembut dan aman untuk kulit, sedangkan Nice Multipurpose Towel cocok untuk membersihkan berbagai keperluan. \r\n\r\nDibuat dari 100% serat alami (Virgin Plantation Pulp) yang diproses secara higienis. \r\n\r\nIsi : 2000 lembar', 21);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id_users` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id_users`, `username`, `password`, `nama`, `created_at`, `alamat`) VALUES
(1, 'Pierre', '$2y$10$FxKHiKS0ASRTY6raZOQhIe0m8r3CA4OnjG2WPrsVLlKN3bzOahqeG', 'Lawrence Pierre Yosefa', '2025-04-05 08:00:58', ''),
(3, 'Alvaro', '$2y$10$KDQ9zTvkBUhWJNINpB6nDuKLAmEy8E8fDKW3rl.eQZ4Mp26IW/VMi', 'Alvaro Morata', '2025-04-08 07:44:46', ''),
(5, 'nando', '$2y$10$mX71saZnS0iBCLP73dFvcOrE7VfBJem3qhkvqmAHJakkYlWgh3fZW', 'Vernando', '2025-04-12 20:11:09', ''),
(6, 'Chris', '$2y$10$MIHiMu5lfviUyZRJ2QLiQu9yyDqEFxwHtxrSIml3QsYj9AdH/WhJ2', 'Chriszega', '2025-05-28 14:37:18', ''),
(7, 'zega', '$2y$10$ftLmqm2dxKb7cVrZcNd7/OxmZOMuxblrcNAMzWEfVc1LvIEh3M9Ie', 'zega', '2025-05-28 15:43:46', ''),
(8, 'Yerr', '$2y$10$2asRgxA.UXhJUW4XO2eVt.a4.UGk7uiK8RJYLb6vXP.WTD5/S7Swe', 'Pierre Yosefa', '2025-05-29 19:06:40', 'Jalan Raden Patah 39'),
(9, 'Kustin', '$2y$10$PEuMhnLwwoK9m4mmX13lBON.G.vj2tSZMbZoOdbHgYy1ioHenSwKO', 'Justin Benedeta', '2025-05-29 22:20:34', 'raden patah 39'),
(10, 'aa123', '$2y$10$GibtCwtwRC4tnyBx3SBemOWFuFyr68gcdv74Q.TU344jls.QIijyu', 'Alvaro 1', '2025-05-31 06:20:54', 'Jalan Raden Patah21');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indeks untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`id_keranjang`),
  ADD KEY `id_users` (`id_users`),
  ADD KEY `id_produk` (`id_produk`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `id_users` (`id_users`);

--
-- Indeks untuk tabel `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `id_order` (`id_order`),
  ADD KEY `id_produk` (`id_produk`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_users`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  MODIFY `id_keranjang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id_users` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  ADD CONSTRAINT `keranjang_ibfk_1` FOREIGN KEY (`id_users`) REFERENCES `users` (`id_users`),
  ADD CONSTRAINT `keranjang_ibfk_2` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`);

--
-- Ketidakleluasaan untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`id_users`) REFERENCES `users` (`id_users`);

--
-- Ketidakleluasaan untuk tabel `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id_order`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
