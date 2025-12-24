import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.toggleOnFavorite});
  final void Function(Meal meal) toggleOnFavorite;

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealsScreen(
          toggleOnFavorite: toggleOnFavorite,
          title: category.title,
          meals: filteredMeals,
        ),
      ),
    ); //  Navigator.push(context, route)
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(24),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 20,
      ),
      children: [
        //availiableCategories.Map((category)=> CategoryGridItem(category: Category)).toList()
        for (final Category in availableCategories)
          CategoryGridItem(
            category: Category,
            onSelectCategory: () {
              _selectCategory(context, Category);
            },
          ),
      ],
    );
  }
}
