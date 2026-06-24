import 'package:flutter/material.dart';

// ── Sonic Fandom Color Palette ──────────────────────────
class SonicColors {
  static const background = Color(0xFF1A1A1A);
  static const surface = Color(0xFF2B2B2B);
  static const primary = Color(0xFF0066CC);
  static const accent = Color(0xFF3B9EFF);
  static const headerBg = Color(0xFF003F7F);
  static const divider = Color(0xFF444444);
  static const textPrimary = Color(0xFFFFFFFF);
  static const textSecondary = Color(0xFFAAAAAA);
  static const border = Color(0xFF3B9EFF);
}

class MylistPage extends StatelessWidget {
  const MylistPage({super.key});

  final List<Map<String, dynamic>> items = const [
    {
      'title': 'Sonic',
      'subtitle': 'Blue Hedgehog • Speed',
      'image': 'assets/images/Sonic.jpg',
      'tag': 'Hero',
      'tagColor': Color(0xFF0066CC),
    },
    {
      'title': 'Infinite',
      'subtitle': 'The Jackal • Power',
      'image': 'assets/images/Infinite.jpg',
      'tag': 'Villain',
      'tagColor': Color(0xFFCC0000),
    },
    {
      'title': 'Shadow',
      'subtitle': 'Ultimate Life Form • Power',
      'image': 'assets/images/Shadow.jpg',
      'tag': 'Neutral',
      'tagColor': Color(0xFF888888),
    },
    {
      'title': 'Silver',
      'subtitle': 'Silver Hedgehog • Time',
      'image': 'assets/images/Silver.jpg',
      'tag': 'Hero',
      'tagColor': Color(0xFFCECECF),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SonicColors.background,
      appBar: AppBar(
        backgroundColor: SonicColors.primary,
        foregroundColor: SonicColors.textPrimary,
        title: const Row(
          children: [
            Icon(Icons.bolt, color: Colors.yellow, size: 20),
            SizedBox(width: 6),
            Text(
              'Sonic Wiki Zone',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          // ── Section Header: GridView ──
          SliverToBoxAdapter(child: _buildSectionHeader('CHARACTER ROSTER')),

          // ── GridView ──
          SliverPadding(
            padding: const EdgeInsets.all(10),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) => _buildGridItem(context, items[index]),
                childCount: items.length,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75,
              ),
            ),
          ),

          // ── Section Header: ListView ──
          SliverToBoxAdapter(child: _buildSectionHeader('CHARACTER LIST')),

          // ── ListView ──
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _buildListItem(context, items[index]),
              childCount: items.length,
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 20)),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      color: SonicColors.headerBg,
      child: Text(
        title,
        style: const TextStyle(
          color: SonicColors.textPrimary,
          fontSize: 14,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _buildGridItem(BuildContext context, Map<String, dynamic> item) {
    return GestureDetector(
      onTap: () => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: SonicColors.primary,
          content: Text('Selected: ${item['title']}'),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: SonicColors.surface,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: SonicColors.border.withOpacity(0.4),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(8),
                ),
                child: Image.asset(
                  item['image'],
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const Center(
                    child: Icon(
                      Icons.image_not_supported,
                      color: SonicColors.textSecondary,
                      size: 40,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['title'],
                    style: const TextStyle(
                      color: SonicColors.accent,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  _buildTag(item, fontSize: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, Map<String, dynamic> item) {
    return Column(
      children: [
        InkWell(
          onTap: () => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: SonicColors.primary,
              content: Text('Selected: ${item['title']}'),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.asset(
                    item['image'],
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      width: 70,
                      height: 70,
                      color: SonicColors.surface,
                      child: const Icon(
                        Icons.image_not_supported,
                        color: SonicColors.textSecondary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['title'],
                        style: const TextStyle(
                          color: SonicColors.accent,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item['subtitle'],
                        style: const TextStyle(
                          color: SonicColors.textSecondary,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 6),
                      _buildTag(item, fontSize: 11),
                    ],
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: SonicColors.textSecondary,
                ),
              ],
            ),
          ),
        ),
        const Divider(
          height: 1,
          color: SonicColors.divider,
          indent: 12,
          endIndent: 12,
        ),
      ],
    );
  }

  Widget _buildTag(Map<String, dynamic> item, {required double fontSize}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: (item['tagColor'] as Color).withOpacity(0.2),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: item['tagColor'] as Color, width: 1),
      ),
      child: Text(
        item['tag'],
        style: TextStyle(
          color: item['tagColor'] as Color,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
