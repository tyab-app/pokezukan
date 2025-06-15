import 'package:flutter/material.dart';

import '../shared/enum/theme_mode.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  ThemeMode _themeMode = ThemeMode.system;

  @override
  void initState() {
    super.initState();
    loadThemeMode().then(
      (val) => setState(
        () => _themeMode = val,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      ListTile(
        leading: Icon(Icons.lightbulb),
        title: Text('Dark/Light Mode'),
        trailing: Text((_themeMode == ThemeMode.system)
            ? 'System'
            : (_themeMode == ThemeMode.dark)
                ? 'Dark'
                : 'Light'),
        onTap: () async {
          var ret = await Navigator.of(context).push<ThemeMode>(
            MaterialPageRoute(
              builder: (context) => ThemeModeSelectionPage(mode: _themeMode),
            ),
          );
          setState(() => _themeMode = ret!);
          await saveThemeModel(_themeMode);
        },
      ),
    ]);
  }
}

class ThemeModeSelectionPage extends StatefulWidget {
  const ThemeModeSelectionPage({
    super.key,
    required this.mode,
  });

  final ThemeMode mode;

  @override
  State<ThemeModeSelectionPage> createState() => _ThemeModeSelectionPageState();
}

class _ThemeModeSelectionPageState extends State<ThemeModeSelectionPage> {
  late ThemeMode _current;
  @override
  void initState() {
    super.initState();
    _current = widget.mode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            /// 戻るボタン
            ListTile(
              leading: IconButton(
                onPressed: () => Navigator.pop<ThemeMode>(context, _current),
                icon: const Icon(Icons.arrow_back),
              ),
            ),

            /// システム設定
            RadioListTile<ThemeMode>(
              value: ThemeMode.system,
              groupValue: _current,
              title: const Text('System'),
              onChanged: (val) => {
                setState(
                  () => _current = val!,
                ),
              },
            ),

            /// ダークモード
            RadioListTile<ThemeMode>(
              value: ThemeMode.dark,
              groupValue: _current,
              title: const Text('Dark'),
              onChanged: (val) => {
                setState(
                  () => _current = val!,
                ),
              },
            ),

            /// ライトモード
            RadioListTile<ThemeMode>(
              value: ThemeMode.light,
              groupValue: _current,
              title: const Text('Light'),
              onChanged: (val) => {
                setState(
                  () => _current = val!,
                ),
              },
            ),
          ],
        ),
      ),
    );
  }
}
