import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
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
  final List<Meal> _favoriteMeal = []; //Favorite meals list

  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
      activePageTitle = 'Favorites';
    });
  } //excutes a function to change the index

  void _toggleFavoriteMealStatus(Meal meal) {
    final _existingFavorite = _favoriteMeal;

    if (_existingFavorite == true) {
      _favoriteMeal.remove(meal);
    } else {
      _favoriteMeal.add(meal);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(
      toggleOnFavorite: _toggleFavoriteMealStatus,
    ); // holds the current screen
    var activePageTitle = 'Category'; //holds the title

    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
        toggleOnFavorite: _toggleFavoriteMealStatus,
        meals: [],
      );
      activePageTitle = 'Your Favorites';
    } // changes the screen dynamically

    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle)),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        currentIndex: _selectedPageIndex,
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
