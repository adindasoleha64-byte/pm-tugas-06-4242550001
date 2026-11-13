import 'package:material_ui/material_ui.dart';

class HalamanTentang extends StatelessWidget {
  const HalamanTentang({super.key});

  @override
  Widget build(BuildContext context) {
    final skema = Theme.of(context).colorScheme;
    final teks = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Tentang Aplikasi')),
      body: ListView(
        children: [
          SizedBox(
            height: 180,
            child: Stack(
              clipBehavior: Clip.hardEdge,
              children: [
                Positioned.fill(
                  child: ColoredBox(color: skema.primaryContainer),
                ),
                Positioned(
                  right: -20,
                  bottom: -24,
                  child: Icon(
                    Icons.landscape,
                    size: 160,
                    color: skema.primary.withValues(alpha: 0.2),
                  ),
                ),
                Positioned(
                  left: 20,
                  bottom: 20,
                  right: 20,
                  child: Text(
                    'Wisata Sumatera Utara',
                    style: teks.headlineSmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          const ListTile(
            leading: Icon(Icons.map_outlined),
            title: Text('Panduan destinasi wisata'),
            subtitle: Text('Danau Toba, Bukit Lawang, Berastagi, dan lainnya'),
          ),
          const ListTile(
            leading: Icon(Icons.devices),
            title: Text('Responsif'),
            subtitle: Text('Ponsel, tablet, dan layar lebar'),
          ),
        ],
      ),
    );
  }
}
