import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersPage extends StatefulWidget {
  static const pageName = '/filters';

  @override
  _FiltersPageState createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  Widget _buildSwitchListTile(
      String title, String subtitle, bool value, Function updateFunc) {
    return SwitchListTile(
      value: value,
      onChanged: updateFunc,
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Filters'),
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text('Adjust meal selection!',
                  style: Theme.of(context).textTheme.headline6),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildSwitchListTile('Gluten free',
                      'Only include gluten free meals', _glutenFree, (newVal) {
                    setState(() {
                      _glutenFree = newVal;
                    });
                  }),
                  _buildSwitchListTile(
                      'Lactose free',
                      'Only include lactose free meals',
                      _lactoseFree, (newVal) {
                    setState(() {
                      _lactoseFree = newVal;
                    });
                  }),
                  _buildSwitchListTile(
                      'Vegetarian free',
                      'Only include vegetarian free meals',
                      _vegetarian, (newVal) {
                    setState(() {
                      _vegetarian = newVal;
                    });
                  }),
                  _buildSwitchListTile(
                      'Vegan free', 'Only include vegan free meals', _vegan,
                      (newVal) {
                    setState(() {
                      _vegan = newVal;
                    });
                  }),
                ],
              ),
            ),
          ],
        ));
  }
}
