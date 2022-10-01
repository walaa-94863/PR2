// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:project2/Screen/FlightTripsScreen.dart';
import 'package:project2/Screen/TouristTripsScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomNavBar extends StatefulWidget {
  //const BottomNavBar({Key? key}) : super(key: key);


  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
   int index =0 ;

  // @override
  // void setState(VoidCallback fn) {
  //
  //   super.setState(fn);
  //   print("==+++++++++");
  //   print(index);
  //   print(indexLate);
  // }

  // int? get indexLate => index;
  //
  savePrefe(int num) async {
    SharedPreferences Preferences = await SharedPreferences.getInstance();
    Preferences.setInt("num", num);
    setState(() {
      index = Preferences.getInt("num") ?? 0 ;
    });
  }
  //
  getPrefe() async {
    SharedPreferences Preferences = await SharedPreferences.getInstance();

    setState(() {
      index = Preferences.getInt("num") ?? 0 ;
    });

  }

  @override
  void initState() {
    super.initState();
    getPrefe();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 40),
        child: GNav(
            selectedIndex: index,
            haptic: true,
            // haptic feedback
            tabBorderRadius: 25,
            tabActiveBorder: Border.all(color: Colors.black, width: 1),
            // tab button border
            tabBorder: Border.all(color: Colors.grey, width: 1),
            // tab button border
            curve: Curves.easeOutExpo,
            // tab animation curves
            duration: Duration(milliseconds: 800),
            // tab animation duration
            gap: 1,
            // the tab button gap between icon and text
            color: Color.fromRGBO(111, 118, 126, 1),
            rippleColor: Color.fromRGBO(26, 27, 45, 1),
            // unselected icon color
            activeColor: Color.fromRGBO(26, 27, 45, 1),
            iconSize: 28,
            textStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
            // tab button icon size
            // tabBackgroundColor:
            //     Colors.purple.withOpacity(0.1), // selected tab background color
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            // navigation bar padding
            tabs: [
              GButton(
                  icon: Icons.airplane_ticket,
                  text: '     Tourist',
                  onPressed: () {
                    setState(() {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TouristTripsScreen()));

                      savePrefe(0);
                    });
                  }),
              GButton(
                  icon: Icons.airplanemode_active,
                  text: '     Flight',
                  onPressed: () {
                    setState(() {index = 1;
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FlightTripsScreen()));

                      savePrefe(1);
                    });
                  }),
            ]),
      ),
    );
  }
}
