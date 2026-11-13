import 'package:material_ui/material_ui.dart';

/// Model destinasi wisata. harga == 0 berarti gratis.
class Destinasi {
  const Destinasi({
    required this.id,
    required this.nama,
    required this.kabupaten,
    required this.kategori,
    required this.deskripsi,
    required this.harga,
    required this.ikon,
    required this.warna,
  });

  final int id;
  final String nama;
  final String kabupaten; // kabupaten/kota
  final String kategori;
  final String deskripsi;
  final int harga; // harga tiket (Rp), 0 = gratis
  final IconData ikon;
  final Color warna;
}

// CATATAN: harga tiket hanya contoh; sesuaikan dengan data terbaru.
const daftarDestinasi = <Destinasi>[
  Destinasi(
    id: 1,
    nama: 'Danau Toba',
    kabupaten: 'Kab. Samosir',
    kategori: 'Wisata Alam',
    deskripsi:
        'Danau vulkanik terbesar di Asia Tenggara dengan Pulau Samosir di '
        'tengahnya. Cocok untuk menikmati pemandangan, budaya Batak, dan '
        'kuliner lokal.',
    harga: 0,
    ikon: Icons.water,
    warna: Color(0xFF0277BD),
  ),
  Destinasi(
    id: 2,
    nama: 'Bukit Lawang',
    kabupaten: 'Kab. Langkat',
    kategori: 'Wisata Alam',
    deskripsi:
        'Gerbang Taman Nasional Gunung Leuser, terkenal dengan konservasi '
        'orangutan Sumatera, trekking hutan hujan, dan tubing di sungai.',
    harga: 50000,
    ikon: Icons.forest,
    warna: Color(0xFF2E7D32),
  ),
  Destinasi(
    id: 3,
    nama: 'Berastagi',
    kabupaten: 'Kab. Karo',
    kategori: 'Dataran Tinggi',
    deskripsi:
        'Kota sejuk di kaki Gunung Sibayak dan Sinabung, terkenal dengan '
        'pasar buah, sayur, dan bunga serta jalur pendakian.',
    harga: 15000,
    ikon: Icons.terrain,
    warna: Color(0xFFEF6C00),
  ),
  Destinasi(
    id: 4,
    nama: 'Istana Maimun',
    kabupaten: 'Kota Medan',
    kategori: 'Sejarah & Budaya',
    deskripsi:
        'Istana peninggalan Kesultanan Deli dengan perpaduan arsitektur '
        'Melayu, Eropa, dan India. Ikon wisata sejarah Kota Medan.',
    harga: 10000,
    ikon: Icons.account_balance,
    warna: Color(0xFFF9A825),
  ),
  Destinasi(
    id: 5,
    nama: 'Air Terjun Sipiso-piso',
    kabupaten: 'Kab. Karo',
    kategori: 'Wisata Alam',
    deskripsi:
        'Air terjun setinggi sekitar 120 meter yang jatuh ke lembah di '
        'tepi Danau Toba, dengan titik pandang yang mudah dijangkau.',
    harga: 10000,
    ikon: Icons.waterfall_chart,
    warna: Color(0xFF00838F),
  ),
  Destinasi(
    id: 6,
    nama: 'Masjid Raya Al-Mashun',
    kabupaten: 'Kota Medan',
    kategori: 'Sejarah & Budaya',
    deskripsi:
        'Masjid bersejarah peninggalan Kesultanan Deli dengan arsitektur '
        'megah bergaya Timur Tengah, India, dan Eropa.',
    harga: 0,
    ikon: Icons.mosque,
    warna: Color(0xFF6A1B9A),
  ),
];

/// Mengembalikan null bila ID tidak ditemukan.
Destinasi? cariDestinasi(int id) {
  for (final d in daftarDestinasi) {
    if (d.id == id) return d;
  }
  return null;
}

extension Rupiah on int {
  /// 45000 -> Rp45.000
  String get rupiah {
    final pola = RegExp(r'\B(?=(\d{3})+(?!\d))');
    return 'Rp${toString().replaceAllMapped(pola, (m) => '.')}';
  }
}

extension TiketLabel on Destinasi {
  String get tiket => harga == 0 ? 'Gratis' : harga.rupiah;
}
