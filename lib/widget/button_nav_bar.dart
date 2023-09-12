import 'package:flutter/material.dart';

class BottomNavBarCustom extends StatefulWidget {
  const BottomNavBarCustom({
    super.key,
    required this.items,
    this.unselectedColor = Colors.grey,
    this.height = 60.0,
    this.iconSize = 24.0,
    this.backgroundColor = Colors.white,
    this.selectedColor = Colors.blue,
    required this.onTabSelected,
  });

  final List<MyAppBarItem> items;
  // final List<BottomNavigationBarItem>? items2;
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

  _updateIndex(int index) {
    widget.onTabSelected(index);
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });

    return SizedBox(
      // height: 96,
      child: Material(
        elevation: 10,
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          child: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            color: widget.backgroundColor,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: items,
            ),
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
        height: widget.height,
        child: InkWell(
          onTap: () => onPressed(index),
          focusColor : coloring,
          hoverColor: coloring,
          highlightColor: coloring,
          splashColor: coloring,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(item.iconData, color: color, size: widget.iconSize),
              Text(
                item.text,
                style: TextStyle(color: color, fontSize: 11),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyAppBarItem {
  MyAppBarItem({required this.iconData, required this.text});

  IconData iconData;
  String text;
}
