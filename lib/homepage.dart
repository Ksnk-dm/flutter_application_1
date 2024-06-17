
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  static const List<Widget> _pages = <Widget>[
    Icon(
      Icons.home,
      size: 150,
    ),
    Icon(
      Icons.favorite,
      size: 150,
    ),
    Icon(
      Icons.search,
      size: 150,
    ),
    Icon(
      Icons.settings,
      size: 150,
    ),
  ];

  int selectedIndex = 0;

  void onTabChange(int index) {
    setState(() {
      selectedIndex = index;
    });
    print(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(style: TextStyle(color: Colors.white), 'My app'),
        backgroundColor: Colors.black,
      ),
      body: Center(child: _pages.elementAt(selectedIndex)),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            gap: 8,
            tabBackgroundColor: Colors.white10,
            onTabChange: onTabChange,
            padding: const EdgeInsets.all(16),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: "Home",
              ),
              GButton(
                icon: Icons.favorite,
                text: "Favorite",
              ),
              GButton(
                icon: Icons.search,
                text: "Search",
              ),
              GButton(
                icon: Icons.settings,
                text: "Setting",
              )
            ],
          ),
        ),
      ),
    );
  }
}
