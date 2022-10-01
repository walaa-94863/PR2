import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Modules/Module.dart';

class TouristTripsScreen extends StatefulWidget {
  //const TouristTripsScreen({Key? key}) : super(key: key);

  @override
  State<TouristTripsScreen> createState() => _TouristTripsScreenState();
}

List data = [];

Future<List> getData() async {
  Uri myUrl = Uri.parse("http://tourism-agency.ddns.net/api/touristtrips");
  http.Response response = await http.get(myUrl);
  return json.decode(response.body);
}

getList() async {
  data = await getData();
  print("1=====");
  print(data);
  print("2=====");
  print(data.length);
}

class _TouristTripsScreenState extends State<TouristTripsScreen> {
  @override
  void initState() {
    getData().then((value) {
      print("dada");
      setState(() {});
    });
    getList();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String id = "1";
    String trip_number = "1";
    String departureairport = "1";
    String destination_airport = "1";
    String starttime = "1";
    String created_at = "1";
    String updated_at = "1";

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Tourist Trips",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: ListView.builder(
            //physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(13),
                    image: DecorationImage(
                        image: AssetImage("assets/images/data.jpeg"),
                        fit: BoxFit.cover),
                  ),
                  padding: EdgeInsets.all(8),
                  width: double.infinity,
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            data[index]['id'].toString(),
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            data[index]['trip_number'].toString(),
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Color.fromARGB(73, 255, 0, 0)),
                            child: Text(
                              data[index]['departureairport'].toString(),
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Color.fromARGB(73, 10, 255, 0)),
                            child: Text(
                              data[index]['destination_airport'].toString(),
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),SizedBox(height: 6,),
                      Text(
                        data[index]['starttime'].toString(),
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),SizedBox(height: 6,),
                      Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color.fromARGB(73, 255, 0, 0)),
                        child: Text(
                          data[index]['created_at'].toString(),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color.fromARGB(73, 10, 255, 0)),
                        child: Text(
                          data[index]['updated_at'].toString(),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),bottomNavigationBar: BottomNavBar(

    ),
    );
  }
}

/*
"id":2,
"trip_number":"751",
"departureairport":"somewhere5",
"destination_airport":"somewhere6",
"starttime":"12:30 25\/7\/2023",
"created_at":"2022-09-25T10:59:01.000000Z",
"updated_at":"2022-09-26T11:45:48.000000Z"
*/
