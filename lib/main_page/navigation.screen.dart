import 'package:flutter/material.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Text('data')),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0), // Adjust the radius as needed
            topRight: Radius.circular(20.0), // Adjust the radius as needed
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
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
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorites',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),

      // bottomNavigationBar: BottomNavBarCustom(
      //   backgroundColor: Colors.black87,
      //   unselectedColor: Colors.white,
      //   selectedColor: Colors.orange,
      //   items: [
      //     MyAppBarItem(
      //       iconData: Icons.dashboard_customize_rounded,
      //       text: 'Home',
      //     ),
      //     MyAppBarItem(
      //       iconData: Icons.shopping_bag_rounded,
      //       text: 'Cart',
      //     ),
      //     MyAppBarItem(
      //       iconData: Icons.place_rounded,
      //       text: 'Place',
      //     ),
      //     MyAppBarItem(
      //       iconData: Icons.person_2_rounded,
      //       text: 'Profile',
      //     ),
      //   ], onTabSelected: (index) {
      //
      //
      // },),
    );
  }
}
