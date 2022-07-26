// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors, avoid_print, unused_local_variable

import 'package:flutter/material.dart';
import 'package:clima_flutter/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getcurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  void getdata() async {
    http.Response response = await http.get(Uri.parse(
        'http://dataservice.accuweather.com/currentconditions/v1/259645?apikey=FIdb3pNAjsMROx6tiw6S2V5Tkp7Bev0E'));
    if (response.statusCode == 200) {
      String data = response.body.toString();

      var temp = jsonDecode(data)[0]['Temperature']['Metric']['Value'];
      print(temp);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    getdata();
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
