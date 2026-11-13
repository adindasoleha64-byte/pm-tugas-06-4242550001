import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import 'data.dart';
import 'halaman_daftar.dart';
import 'halaman_detail.dart';
import 'halaman_tentang.dart';

void main() => runApp(const WisataApp());

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, shell) => KerangkaNavigasi(shell: shell),
      branches: [
        // Cabang 0: daftar + detail (/destinasi/:id)
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => const HalamanDaftar(),
              routes: [
                GoRoute(
                  path: 'destinasi/:id',
                  builder: (context, state) {
                    // ID tidak valid -> null -> halaman "tidak ditemukan"
                    final id = int.tryParse(state.pathParameters['id'] ?? '');
                    return HalamanDetail(
                      destinasi: id == null ? null : cariDestinasi(id),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        // Cabang 1: tentang
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/tentang',
              builder: (context, state) => const HalamanTentang(),
            ),
          ],
        ),
      ],
    ),
  ],
);

class WisataApp extends StatelessWidget {
  const WisataApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Wisata Sumatera Utara',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF00695C)),
      ),
      routerConfig: _router,
    );
  }
}

/// Kerangka navigasi: keputusan tingkat aplikasi -> MediaQuery.
/// < 840 dp: NavigationBar (bawah); >= 840 dp: NavigationRail (samping).
class KerangkaNavigasi extends StatelessWidget {
  const KerangkaNavigasi({super.key, required this.shell});

  final StatefulNavigationShell shell;

  void _pilih(int i) =>
      shell.goBranch(i, initialLocation: i == shell.currentIndex);

  @override
  Widget build(BuildContext context) {
    final lebar = MediaQuery.sizeOf(context).width;

    if (lebar >= 840) {
      return Scaffold(
        body: Row(
          children: [
            NavigationRail(
              selectedIndex: shell.currentIndex,
              onDestinationSelected: _pilih,
              labelType: NavigationRailLabelType.all,
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.explore_outlined),
                  selectedIcon: Icon(Icons.explore),
                  label: Text('Destinasi'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.info_outline),
                  selectedIcon: Icon(Icons.info),
                  label: Text('Tentang'),
                ),
              ],
            ),
            const VerticalDivider(width: 1),
            Expanded(child: shell),
          ],
        ),
      );
    }

    return Scaffold(
      body: shell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: shell.currentIndex,
        onDestinationSelected: _pilih,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.explore_outlined),
            selectedIcon: Icon(Icons.explore),
            label: 'Destinasi',
          ),
          NavigationDestination(
            icon: Icon(Icons.info_outline),
            selectedIcon: Icon(Icons.info),
            label: 'Tentang',
          ),
        ],
      ),
    );
  }
}
