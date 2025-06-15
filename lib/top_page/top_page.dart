import 'package:flutter/material.dart';

import '../settings/settings.dart';
import 'application/poke_list_item.dart';

class TopPage extends StatefulWidget {
  const TopPage({super.key});

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  int currentBtn = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: currentBtn == 0 ? const PokeList() : const Settings(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => {
          setState(
            () => currentBtn = index,
          ),
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'poke list',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'settings',
          ),
        ],
      ),
    );
  }
}

class PokeList extends StatelessWidget {
  const PokeList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 16,
      ),
      itemCount: 1010,
      itemBuilder: (context, index) => PokeListItem(index: index),
    );
  }
}
