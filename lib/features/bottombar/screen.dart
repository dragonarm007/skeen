import 'package:flutter/material.dart';
import 'package:skreen/base/base_screen.dart';
import 'package:skreen/features/bottombar/viewmodel.dart';
import 'package:skreen/features/gallery/screen.dart';
import 'package:skreen/features/map/screen.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  BottomBarScreenState createState() => BottomBarScreenState();
}

class BottomBarScreenState extends State<BottomBarScreen> {
  var currentTab = [
    const GalleryScreen(),
    const MapScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BaseScreen<BottomNavigationBarViewmodel>(
        viewmodel: BottomNavigationBarViewmodel(context: context),
        builder: ((context, model, child) {
          return Scaffold(
            body: currentTab[model.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: model.currentIndex,
              onTap: (index) {
                model.currentIndex = index;
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                )
              ],
            ),
          );
        }));
  }
}
