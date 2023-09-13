import 'package:flutter/material.dart';

class BottomNavBarCustom extends StatefulWidget {
  const BottomNavBarCustom({
    super.key,
    required this.items,
    this.height = 60.0,
    this.iconSize = 24.0,
    this.backgroundColor = Colors.black87,
    this.selectedColor = Colors.orange,
    this.unselectedColor = Colors.white,
    required this.onTabSelected,
  });

  final List<MyAppBarItem> items;
  final double height;
  final double iconSize;
  final Color backgroundColor;
  final Color unselectedColor;
  final Color selectedColor;
  final ValueChanged<int> onTabSelected;

  @override
  State<BottomNavBarCustom> createState() => _BottomNavBarCustomState();
}

class _BottomNavBarCustomState extends State<BottomNavBarCustom> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });

    return Container(
      // height: 96,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0), // Adjust the radius as needed
          topRight: Radius.circular(20.0), // Adjust the radius as needed
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 2,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0), // Adjust the radius as needed
          topRight: Radius.circular(20.0), // Adjust the radius as needed
        ),
        child: BottomAppBar(
          color: widget.backgroundColor,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: items,
          ),
        ),
      ),
    );
  }

  Widget _buildTabItem({
    required MyAppBarItem item,
    required int index,
    required ValueChanged<int> onPressed,
  }) {
    Color color = _selectedIndex == index ? widget.selectedColor : widget.unselectedColor;
    Color coloring = Colors.orange.withAlpha(30);

    return Expanded(
      child: SizedBox(
        height: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => onPressed(index),
              focusColor: coloring,
              hoverColor: coloring,
              highlightColor: coloring,
              splashColor: coloring,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _selectedIndex == index
                      ? Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.orange.withOpacity(0.3),
                                offset: const Offset(0, 4),
                                blurRadius: 20,
                              ),
                            ],
                          ),
                          child: Icon(
                            item.activeIcon,
                            color: color,
                            size: widget.iconSize,
                          ))
                      : Icon(
                          item.iconData,
                          color: color,
                          size: widget.iconSize,
                        ),
                  Text(
                    item.label,
                    style: TextStyle(color: color, fontSize: 11),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _updateIndex(int index) {
    widget.onTabSelected(index);
    setState(() => _selectedIndex = index);
  }
}

class MyAppBarItem {
  MyAppBarItem({
    required this.iconData,
    required this.label,
    required this.activeIcon,
  });

  IconData iconData;
  IconData activeIcon;
  String label;
}
