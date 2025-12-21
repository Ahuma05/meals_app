import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealsDetailScreen extends StatelessWidget {
  const MealsDetailScreen(this.meal, {super.key});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: Image.network(
        meal.imageUrl,
        width: double.infinity,
        height: 300,
        fit: BoxFit.cover,
      ),
    );
  }
}
