import 'package:chatapp/chatpages/chat.dart';
import 'package:chatapp/chatpages/search.dart';
import 'package:chatapp/chatpages/settings.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late int pageIndex = 0;
  late PageController pageController;

  List <Widget> tabPages = const[

    Chat(),
    Settings(),
    Search(),
  ];

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: pageIndex);
  }

  @override
  void dispose() {
   pageController.dispose();
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: onTabTapped,
        backgroundColor: const  Color(0XFFF3E5F5),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.message_outlined, color:  Color(0xFFEA80FC),), title: Text('Chat',style: TextStyle(color:  Color(0xFFEA80FC),),) ),
          BottomNavigationBarItem(icon: Icon(Icons.settings,color:  Color(0xFFEA80FC),), title: Text('Settings',style: TextStyle(color:  Color(0xFFEA80FC),),)),
          BottomNavigationBarItem(icon: Icon(Icons.search,color:  Color(0xFFEA80FC),), title: Text('Search',style: TextStyle(color:  Color(0xFFEA80FC),),) ),
        ],
      ),
      body: PageView(
        children: tabPages,
        onPageChanged: onPageChanged,
        controller: pageController,
      ),

    );
  }
  void onPageChanged(int page) {
    setState(() {
      pageIndex = page;
    });
  }


  void onTabTapped(int index) {
    pageController.animateToPage(index,duration: const Duration(milliseconds: 500),curve: Curves.easeInOut);
  }
}
