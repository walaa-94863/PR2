import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Modules/Module.dart';

class FlightTripsScreen extends StatefulWidget {
  //const TouristTripsScreen({Key? key}) : super(key: key);

  @override
  State<FlightTripsScreen> createState() => _FlightTripsScreenState();
}

List data = [];

Future<List> getData() async {
  Uri myUrl = Uri.parse("http://tourism-agency.ddns.net/api/flighttrips");
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

class _FlightTripsScreenState extends State<FlightTripsScreen> {
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


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Flight Trips",
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
                        image: AssetImage("assets/images/data1.webp"),
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
                      SizedBox(height: 10,),
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

