import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'browse_item.dart';

class BrowsePage extends StatelessWidget {
  const BrowsePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String colorName = 'Deep Purple';
    final MaterialColor color = Colors.deepPurple;
    final List<int> materialIndices = [
      50, 100, 200, 300, 400, 500, 600, 700, 800, 900
    ];

    return CustomScrollView(
      slivers: <Widget>[
        const CupertinoSliverNavigationBar(
          largeTitle: Text('Browse'),
        ),
        SliverSafeArea(
          top: false,
          sliver: SliverFixedExtentList(
            itemExtent: 200.0,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                int materialIndex = materialIndices[index];
                return Material(
                  child: Container(
                    alignment: Alignment.center,
                    color: color[materialIndex],
                    child: ListTile(
                      title: Text('$materialIndex'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        Navigator.of(context).push(
                          CupertinoPageRoute<void>(
                            builder: (BuildContext context) {
                              return BrowseItemPage(
                                color: color,
                                materialIndex: materialIndex,
                                title: colorName,
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
              childCount: materialIndices.length,
            ),
          ),
        ),
      ],
    );
  }
}
