import 'package:flutter/material.dart';
import 'package:meal_app/pages/tabs_page.dart';
import './pages/meal_details.dart';
import './pages/category_meals_page.dart';
import './pages/tabs_page.dart';
import './pages/filters_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal App',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                bodyText2: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                headline6: TextStyle(
                    fontSize: 20,
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold),
              )),
      routes: {
        '/': (ctx) => TabsPage(),
        CategoryMealsPage.pageName: (ctx) => CategoryMealsPage(),
        MealDetails.pageName: (ctx) => MealDetails(),
        FiltersPage.pageName: (ctx) => FiltersPage(),
      },
    );
  }
}
