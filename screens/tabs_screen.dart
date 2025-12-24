import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/meals.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0; // current index
  var activePageTitle = 'Your Favorites'; //current title

  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
      activePageTitle = 'Favorites';
    });
  } //excutes a function to change the index

  @override
  Widget build(BuildContext context) {
    Widget activePage = const CategoriesScreen(); // holds the current screen

    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(title: 'Favorites', meals: []);
    } // changes the screen dynamically

    return Scaffold(
      appBar: AppBar(title: Text('Categories')),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Category',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}
