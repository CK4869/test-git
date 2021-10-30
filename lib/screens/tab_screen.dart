import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_app_clone/constant.dart';
import 'package:instagram_app_clone/data/bottom_navigation_bar_icon_json.dart';
import 'package:instagram_app_clone/screens/account_screen.dart';
import 'package:instagram_app_clone/screens/favorite_screen.dart';
import 'package:instagram_app_clone/screens/home_screen.dart';
import 'package:instagram_app_clone/screens/new_post_screen.dart';
import 'package:instagram_app_clone/screens/search_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int indexPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: indexPage,
        children: const [
          HomeScreen(),
          SearchScreen(),
          NewPostScreen(),
          FavoriteScreen(),
          AccountScreen(),
        ],
      ),
      bottomNavigationBar: getBottomNavigationBar(),
    );
  }

  Widget getBottomNavigationBar() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1,
            color: bgDark.withOpacity(.2),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            icons.length,
            (index) => IconButton(
              onPressed: () {
                setState(() {
                  indexPage = index;
                });
              },
              icon: SvgPicture.asset((indexPage == index)
                  ? icons[index]['active']!
                  : icons[index]['inactive']!),
            ),
          ),
        ),
      ),
    );
  }
}
