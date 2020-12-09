import '../widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import './categories_screen.dart';
import './favorites_screen.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  TabsScreen(this.favoriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _Pages;
  int _selectedPageIndex = 0;


  @override
  void initState() { 
    _Pages = [
    {'Page': CategoriesScreen(), 
    'title': 'Categories'},
    {'Page': FavoritesScreen(widget.favoriteMeals), 
    'title': 'Your Favorite'}
  ];
    super.initState();
    
  }

  
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _Pages[_selectedPageIndex]['title'],
        ),
      ),
      drawer: MainDrawer(),
      body: _Pages[_selectedPageIndex]['Page'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedPageIndex,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              title: Text('Categories'),
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              title: Text('Favorites'),
            )
          ]),
    );
  }
}
