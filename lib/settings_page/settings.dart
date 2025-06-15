import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../shared/enum/provider/theme_mode_notifier.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModeNotifier>(
      builder: (context, mode, child) => ListView(children: [
        ListTile(
          leading: Icon(Icons.lightbulb),
          title: Text('Dark/Light Mode'),
          trailing: Text((mode.mode == ThemeMode.system)
              ? 'System'
              : (mode.mode == ThemeMode.dark)
                  ? 'Dark'
                  : 'Light'),
          onTap: () async {
            var ret = await Navigator.of(context).push<ThemeMode>(
              MaterialPageRoute(
                builder: (context) => ThemeModeSelectionPage(mode: mode.mode),
              ),
            );
            if (ret != null) {
              mode.update(ret);
            }
          },
        ),
      ]),
    );
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
