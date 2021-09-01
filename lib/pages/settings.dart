import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ios_tabs/main.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        const CupertinoSliverNavigationBar(
          largeTitle: Text('Settings'),
        ),
        SliverFillRemaining(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text(
                    'One last example, head back to the home page.'),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  child: const Text('Go Home'),
                  onPressed: () {
                    tabState.currentState?.onItemTapped(0);
                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
