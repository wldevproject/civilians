import 'package:flutter/material.dart';

import '../widget/button_nav_bar.dart';
import 'cart.screen.dart';
import 'dashboard.screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const DashboardScreen(),
    const CartScreen(),
    const DashboardScreen(),
    const CartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavBarCustom(
        items: [
          MyAppBarItem(
            iconData: Icons.dashboard_customize_outlined,
            activeIcon: Icons.dashboard_customize_rounded,
            label: 'Home',
          ),
          MyAppBarItem(
            iconData: Icons.shopping_bag_outlined,
            activeIcon: Icons.shopping_bag_rounded,
            label: 'Cart',
          ),
          MyAppBarItem(
            iconData: Icons.place_outlined,
            activeIcon: Icons.place_rounded,
            label: 'Place',
          ),
          MyAppBarItem(
            iconData: Icons.person_2_outlined,
            activeIcon: Icons.person_2_rounded,
            label: 'Profile',
          ),
        ],
        onTabSelected: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
