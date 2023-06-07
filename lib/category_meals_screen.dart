import 'package:flutter/material.dart';

import './dummy_data.dart';

class categoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String categoryId;
  // final String categoryTitle;

  // categoryMealsScreen(this.categoryId, this.categoryTitle); ///Used routes

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'] ?? " ";
    final categoryId = routeArgs['Id'] ?? "";
    final categoryMeals = DUMMY_MEALS.where((meals) {
      return meals.categories.contains(categoryId);
    }).toList();
    // final categoryMeals = DUMMY_MEALS.where((meal) {
    //   return meal.categories.contains(categoryId);
    // }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Text(categoryMeals[index].title);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
