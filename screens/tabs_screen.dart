import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/filter_screen.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0; // current index
  var activePageTitle = 'Your Favorites'; //current title
  final List<Meal> _favoriteMeal = []; //Favorite meals list

  void _showInfoMessage(String Message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(Message)));
  }

  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
      activePageTitle = 'Favorites';
    });
  } //excutes a function to change the index

  void _toggleFavoriteMealStatus(Meal meal) {
    final existingFavorite = _favoriteMeal;

    // if (existingFavorite == true) {
    //       setState(() {
    //         _favoriteMeal.remove(meal);
    //       });
    //     } else {
    //       setState(() {
    //         _favoriteMeal.add(meal);
    //       });
    //     }
    if (existingFavorite.contains(meal)) {
      setState(() {
        _favoriteMeal.remove(meal);
        _showInfoMessage('Meal is no longer a favorite!');
      });
    } else {
      setState(() {
        _favoriteMeal.add(meal);
        _showInfoMessage('Added to favorite!');
      });
    }
  }

  void _setScreen(String identifier) {
    if (identifier == 'Filter') {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => FilterScreen()));
    } else {
      Navigator.of(context).pop();
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
        meals: _favoriteMeal,
      );
      activePageTitle = 'Your Favorites';
    } // changes the screen dynamically

    return Scaffold(
      drawer: MainDrawer(onSelectScreen: _setScreen),
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
