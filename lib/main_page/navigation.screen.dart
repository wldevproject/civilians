import 'package:flutter/material.dart';

import '../widget/button_nav_bar.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Text('data')),
      bottomNavigationBar: BottomNavBarCustom(
        backgroundColor: Colors.black87,
        unselectedColor: Colors.white,
        selectedColor: Colors.orange,
        items: [
          MyAppBarItem(
            iconData: Icons.dashboard_customize_rounded,
            text: 'Home',
          ),
          MyAppBarItem(
            iconData: Icons.shopping_bag_rounded,
            text: 'Cart',
          ),
          MyAppBarItem(
            iconData: Icons.place_rounded,
            text: 'Place',
          ),
          MyAppBarItem(
            iconData: Icons.person_2_rounded,
            text: 'Profile',
          ),
        ], onTabSelected: (index) {},),
    );
  }
}
