import 'package:flutter/material.dart';

import '../../poke_detail.dart';

class PokeListItem extends StatelessWidget {
  const PokeListItem({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 80,
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(10),
          image: const DecorationImage(
            fit: BoxFit.fitWidth,
            image: NetworkImage(
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png',
            ),
          ),
        ),
      ),
      title: const Text(
        'Pikachu',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: const Text(
        '⚡️Electric',
      ),
      trailing: const Icon(
        Icons.navigate_next,
      ),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const DetailPage(),
        ),
      ),
    );
  }
}
