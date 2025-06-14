import 'package:flutter/material.dart';

import 'poke_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeMode mode = ThemeMode.system;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: mode,
      home: const TopPage(),
    );
  }
}

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
            label: 'home',
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

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(
          leading: Icon(Icons.lightbulb),
          title: Text('Dark/Light Mode'),
        )
      ],
    );
  }
}

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
