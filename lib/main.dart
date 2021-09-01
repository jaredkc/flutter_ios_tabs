import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'pages/browse.dart';
import 'pages/home.dart';
import 'pages/settings.dart';

final tabState = GlobalKey<TabState>();
final homeTabKey = GlobalKey<NavigatorState>();
final browseTabKey = GlobalKey<NavigatorState>();
final settingsTabKey = GlobalKey<NavigatorState>();

void main() {
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoPageScaffold(
        child: BottomTabs(key: tabState),
      ),
    );
  }
}

class BottomTabs extends StatefulWidget {
  const BottomTabs({Key? key}) : super(key: key);

  @override
  TabState createState() => TabState();
}

class TabState extends State<BottomTabs> {
  final CupertinoTabController _controller = CupertinoTabController();
  int _previousIndex = 0;

  void onItemTapped(int index) {
    // Return to first screen if not switching tabs.
    if (_previousIndex == index) {
      switch (index) {
        case 0:
          homeTabKey.currentState?.popUntil((r) => r.isFirst);
          break;
        case 1:
          browseTabKey.currentState?.popUntil((r) => r.isFirst);
          break;
        case 2:
          settingsTabKey.currentState?.popUntil((r) => r.isFirst);
          break;
      }
    }

    setState(() {
      _controller.index = index;
      _previousIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      controller: _controller,
      tabBar: CupertinoTabBar(
        onTap: onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Browse',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        late final CupertinoTabView tabView;
        switch (index) {
          case 0:
            tabView = CupertinoTabView(
              navigatorKey: homeTabKey,
              builder: (context) {
                return const CupertinoPageScaffold(child: HomePage());
              },
            );
            break;
          case 1:
            tabView = CupertinoTabView(
              navigatorKey: browseTabKey,
              builder: (context) {
                return const CupertinoPageScaffold(child: BrowsePage());
              },
            );
            break;
          case 2:
            tabView = CupertinoTabView(
              navigatorKey: settingsTabKey,
              builder: (context) {
                return const CupertinoPageScaffold(child: SettingsPage());
              },
            );
            break;
        }
        return tabView;
      },
    );
  }
}
