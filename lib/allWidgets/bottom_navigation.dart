import 'package:chat_app/allConstants/color_constants.dart';
import 'package:chat_app/allScreens/favorite_page.dart';
import 'package:chat_app/allScreens/home_page.dart';
import 'package:chat_app/allScreens/new_photo.dart';
import 'package:chat_app/allScreens/profile_page.dart';
import 'package:chat_app/allScreens/reel_page.dart';
import 'package:chat_app/main.dart';
import 'package:flutter/material.dart';

class ButtomNavigationScreen extends StatefulWidget {
  const ButtomNavigationScreen({Key? key}) : super(key: key);

  @override
  _ButtomNavigationScreenState createState() => _ButtomNavigationScreenState();
}

class _ButtomNavigationScreenState extends State<ButtomNavigationScreen> {
  int _currentIndex = 0;

  final pages = [
    HomePage(),
    ReelPage(),
    NewPhoto(),
    FavoritePage(),
    ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    // TODO: implement dispose
  }

  init() async {
    // TODO: implement dispose
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorConstants.primaryColor,
        unselectedItemColor: ColorConstants.greyColor,
        backgroundColor: isWhite ? Colors.white : Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'images/home.png',
              height: 25,
              width: 25,
              color: ColorConstants.greyColor,
            ),
            activeIcon: Image.asset(
              'images/home_fill.png',
              height: 25,
              width: 25,
              color: ColorConstants.primaryColor,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'images/reel.png',
              height: 25,
              width: 25,
              color: ColorConstants.greyColor,
            ),
            activeIcon: Image.asset(
              'images/reel_fill.png',
              height: 25,
              width: 25,
              color: ColorConstants.primaryColor,
            ),
            label: 'Reel',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'images/gallery.png',
              height: 25,
              width: 25,
              color: ColorConstants.greyColor,
            ),
            activeIcon: Image.asset(
              'images/gallery_fill.png',
              height: 25,
              width: 25,
              color: ColorConstants.primaryColor,
            ),
            label: 'Gallery',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'images/heart.png',
              height: 25,
              width: 25,
              color: ColorConstants.greyColor,
            ),
            activeIcon: Image.asset(
              'images/heart_fill.png',
              height: 25,
              width: 25,
              color: ColorConstants.primaryColor,
            ),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                'images/profile1.png',
                height: 30,
                width: 30,
              ),
            ),
            activeIcon: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                'images/profile1.png',
                height: 30,
                width: 30,
              ),
            ),
            label: 'Favorite',
          )
        ],
      ),
    );
  }
}
