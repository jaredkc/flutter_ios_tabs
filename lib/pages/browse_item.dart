import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BrowseItemPage extends StatelessWidget {
  const BrowseItemPage({
    Key? key,
    required this.color,
    required this.materialIndex,
    required this.title,
  }) : super(key: key);

  final MaterialColor color;
  final int materialIndex;
  final String title;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('$title $materialIndex'),
        previousPageTitle: 'Browse',
      ),
      child: Container(
        color: color[materialIndex],
        child: Center(
          child: ElevatedButton(
            child: const Text('Back (or tap Browse below)'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
    );
  }
}
