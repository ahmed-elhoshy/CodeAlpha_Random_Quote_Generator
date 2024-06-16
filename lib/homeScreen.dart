import 'package:code_alpha/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:share_plus/share_plus.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> Quotes = [
    'You’re the greatest gift I’ve ever gotten',
    'You’re my greatest adventure',
    'Forever & Always',
    'I never want to stop making memories with you',
    'If I know what love is, it is because of you.',
    'All you are is all I’ll ever need',
    'I’m much more when I’m with you',
    'All you need is love” - Beatles',
    'You are nothing short of my everything'
  ];
  var randomItem;

  bool clicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Random Quote',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF651AA9),
      ),
      backgroundColor: MyTheme.whiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFF651AA9),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: clicked == false
                      ? Lottie.asset("assets/animations/Animation1.json")
                      : Text(
                          randomItem,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          ElevatedButton(
              onPressed: () {
                randomItem = (Quotes..shuffle()).first;
                clicked = true;
                setState(() {});
              },
              child: const Text(
                'Generate random quote',
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF651AA9),
                ),
              )),
          ElevatedButton(
              onPressed: () {
                Share.share(randomItem);
              },
              child: Text(
                'Share',
                style: TextStyle(fontSize: 20, color: MyTheme.primaryDark),
              )),
        ],
      ),
    );
  }
}
