import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/app_colors.dart';
import 'package:food_delivery_app/views/pages/favorites_page.dart';
import 'package:food_delivery_app/views/pages/home_page.dart';
import 'package:food_delivery_app/views/pages/profile_page.dart';

class CustomBottomNavbar extends StatefulWidget {
  const CustomBottomNavbar({super.key});

  @override
  State<CustomBottomNavbar> createState() => _CustomBottomNavbarState();
}

class _CustomBottomNavbarState extends State<CustomBottomNavbar> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    //to determine what is the size and width of the screen
    // we can control how the app looks on other devices with diff sizes
    // =>  final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const Drawer(
          child: Column(
        children: [
          DrawerHeader(child: Text('test')),
          Center(
            child: Text('inside the drawer'),
          ),
        ],
      )),
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
        ],
        title: Column(
          children: [
            Text(
              'Current Location',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: AppColors.grey,
                  ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.location_on,
                  color: AppColors.green,
                ),
                const SizedBox(width: 4),
                Text('Giza, Egypt',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge), //inhirited widget, context knows details of every element in widget tree
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.favorite),
            icon: Icon(Icons.favorite_border),
            label: 'Favorites',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
      body: <Widget>[
        const HomePage(),
        const FavoritesPage(),
        const ProfilePage(),
      ][currentPageIndex],
    );
  }
}
