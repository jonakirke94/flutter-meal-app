import 'package:flutter/material.dart';
import '../models/meal.dart';

import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsPage extends StatefulWidget {
  static const pageName = '/category-meals';

  @override
  _CategoryMealsPageState createState() => _CategoryMealsPageState();
}

class _CategoryMealsPageState extends State<CategoryMealsPage> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadedInitData = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayedMeals =
          DUMMY_MEALS.where((m) => m.categories.contains(categoryId)).toList();
    }

    _loadedInitData = true;
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((m) => m.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(displayedMeals[index], _removeMeal);
          },
          itemCount: displayedMeals.length,
        ),
      ),
    );
  }
}
