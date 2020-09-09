import 'package:flutter/material.dart';
import '../pages/meal_details.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  final Function removeMeal;

  MealItem(this.meal, this.removeMeal);

  void _selectMeal(ctx) {
    Navigator.of(ctx).pushNamed(MealDetails.pageName, arguments: {
      'id': meal.id,
    }).then((result) {
      // the data from the popped route i.e when the meal item is "deleted"
      if (result != null) {
        removeMeal(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _selectMeal(context);
      },
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 4,
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Image.network(
                      meal.imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                      color: Colors.black54,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      width: 350,
                      child: Text(meal.title,
                          style: TextStyle(fontSize: 26, color: Colors.white),
                          softWrap: true,
                          overflow: TextOverflow.fade),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.schedule),
                        SizedBox(
                          width: 6,
                        ),
                        Text('${meal.duration}min'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.work),
                        SizedBox(
                          width: 6,
                        ),
                        Text('${meal.complexityText}'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.monetization_on),
                        SizedBox(
                          width: 6,
                        ),
                        Text('${meal.affordabilityText}'),
                      ],
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
