import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import 'data.dart';

class HalamanDaftar extends StatelessWidget {
  const HalamanDaftar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wisata Sumatera Utara')),
      // Keputusan lokal (ruang yang tersedia untuk grid) -> LayoutBuilder
      body: LayoutBuilder(
        builder: (context, constraints) {
          final kolom = switch (constraints.maxWidth) {
            < 600 => 2, // ponsel
            < 900 => 3, // tablet
            _ => 4, // layar lebar
          };
          return GridView.builder(
            padding: const EdgeInsets.all(12),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: kolom,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.78,
            ),
            itemCount: daftarDestinasi.length,
            itemBuilder: (context, i) =>
                KartuDestinasi(destinasi: daftarDestinasi[i]),
          );
        },
      ),
    );
  }
}

class KartuDestinasi extends StatelessWidget {
  const KartuDestinasi({super.key, required this.destinasi});

  final Destinasi destinasi;

  @override
  Widget build(BuildContext context) {
    final teks = Theme.of(context).textTheme;
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.go('/destinasi/${destinasi.id}'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                color: destinasi.warna.withValues(alpha: 0.15),
                child: Icon(destinasi.ikon, size: 56, color: destinasi.warna),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    destinasi.nama,
                    style: teks.titleSmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    destinasi.kabupaten,
                    style: teks.bodySmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    destinasi.tiket,
                    style: teks.bodyMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
