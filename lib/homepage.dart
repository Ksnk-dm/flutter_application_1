import 'package:flutter/material.dart';
import 'package:flutter_application_1/detailpage.dart';
import 'package:flutter_application_1/entity/Pizza.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  IconData buttonIcon = Icons.add;

  void onTabChange(int index) {
    setState(() {
      selectedIndex = index;
    });
    print(selectedIndex);
  }

  IconData setImage(bool state) {
    setState(() {
      if (state) {
        buttonIcon = Icons.account_balance_wallet_rounded;
      }
    });
    return buttonIcon;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(style: TextStyle(color: Colors.white), 'Menu'),
        backgroundColor: Colors.black,
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _getPageContent(selectedIndex),
      )),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
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

  Widget _getPageContent(int index) {
    if (index == 0) {
      return ListView.builder(
        itemCount: pizzas.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailPage()));
              },
              child: Card(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          pizzas[index].image,
                          height: 110,
                          width: 120,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            pizzas[index].name,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          RichText(
                              maxLines: 2,
                              text: TextSpan(children: <TextSpan>[
                                TextSpan(
                                    text: pizzas[index].params,
                                    style:
                                        TextStyle(color: Colors.orangeAccent)),
                                TextSpan(
                                  text: " - " + pizzas[index].description,
                                  style: TextStyle(color: Colors.black),
                                )
                              ])),
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 0),
                                child: Text(
                                  pizzas[index].price + " грн",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              const Spacer(),
                              IconButton(
                                style: IconButton.styleFrom(
                                    backgroundColor: Colors.orangeAccent),
                                color: Colors.white,
                                icon: const Icon(Icons.add),
                                onPressed: () {
                                  setImage(true);
                                  _showToast(context, 'Pizza price $index');
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                    ))
                  ],
                ),
              )
          );
        },
      );
    } else {
      IconData iconData;
      String label;

      switch (index) {
        case 1:
          iconData = Icons.favorite;
          label = 'Favorite';
          break;
        case 2:
          iconData = Icons.search;
          label = 'Search';
          break;
        case 3:
          iconData = Icons.settings;
          label = 'Settings';
          break;
        default:
          iconData = Icons.error;
          label = 'Error';
      }

      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(iconData, size: 100),
            const SizedBox(height: 20),
            Text(label, style: const TextStyle(fontSize: 24)),
          ],
        ),
      );
    }
  }

  void _showToast(BuildContext context, String text) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(text),
        action: SnackBarAction(
            label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}
