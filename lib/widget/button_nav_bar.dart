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
          // shape: const CircularNotchedRectangle(),
          color: widget.backgroundColor,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          // padding: EdgeInsets.zero,
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
    Color color =
        _selectedIndex == index ? widget.selectedColor : widget.unselectedColor;
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
                  Icon(item.iconData, color: color, size: widget.iconSize),
                  Text(
                    item.text,
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
}

class MyAppBarItem {
  MyAppBarItem({required this.iconData, required this.text});

  IconData iconData;
  String text;
}

class BottomNavBarCustomV2 extends StatefulWidget {
  const BottomNavBarCustomV2({super.key});

  @override
  State<BottomNavBarCustomV2> createState() => _BottomNavBarCustomV2State();
}

class _BottomNavBarCustomV2State extends State<BottomNavBarCustomV2> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          backgroundColor: Colors.black87,
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.white,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          type: BottomNavigationBarType.fixed,
          enableFeedback: true,
          items: [
            navBarItem(
              label: 'Home',
              activeIcon: Icons.dashboard_customize_rounded,
              unActiveIcon: Icons.dashboard_customize_outlined,
            ),
            navBarItem(
              label: 'Cart',
              activeIcon: Icons.shopping_bag_rounded,
              unActiveIcon: Icons.shopping_bag_outlined,
            ),
            navBarItem(
              label: 'Place',
              activeIcon: Icons.place_rounded,
              unActiveIcon: Icons.place_outlined,
            ),
            navBarItem(
              label: 'Profile',
              activeIcon: Icons.person_2_rounded,
              unActiveIcon: Icons.person_2_outlined,
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem navBarItem({
    required String label,
    required IconData activeIcon,
    required IconData unActiveIcon,
  }) {
    return BottomNavigationBarItem(
      label: label,
      icon: Center(
        child: Icon(unActiveIcon),
      ),
      activeIcon: Container(
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
          child: Icon(activeIcon)),
    );
  }
}
