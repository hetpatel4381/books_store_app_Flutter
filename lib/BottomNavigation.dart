import 'package:books_store_app/pages/FavouriteScreen.dart';
import 'package:books_store_app/pages/MyBookScreen.dart';
import 'package:books_store_app/pages/StoreScreen.dart';
import './pages/HomeScreen.dart';

import 'package:books_store_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'json/root_app_json.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  //initializing the current-position of the bottom-navigation.
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      //body
      body: getBody(),

      //Bottm-Navigation.
      bottomNavigationBar: bottomNavigation(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: currentIndex,
      children: [
        HomeScreen(),
        MyBookScreen(),
        StoreScreen(),
        const FavouriteScreen(),
      ],
    );
  }

  Widget bottomNavigation() {
    return SalomonBottomBar(
        margin: const EdgeInsets.only(bottom: 10, top: 10, left: 20, right: 20),
        selectedItemColor: primary,
        unselectedItemColor: grey,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: List.generate(rootAppJson.length, (index) {
          return SalomonBottomBarItem(
              selectedColor: rootAppJson[index]['color'],
              icon: Icon(rootAppJson[index]['icon']),
              title: Text(rootAppJson[index]['text']));
        }));
  }
}
