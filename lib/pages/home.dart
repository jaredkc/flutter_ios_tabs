import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ios_tabs/main.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        const CupertinoSliverNavigationBar(
          largeTitle: Text('Home'),
        ),
        SliverFillRemaining(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                const Text('Example of navigating between the bottom tabs, outside of the tab bar.'),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  child: const Text('Go to Browse'),
                  onPressed: () {
                    tabState.currentState?.onItemTapped(1);
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
