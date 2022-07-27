// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors, avoid_print, unused_local_variable

import 'package:flutter/material.dart';
import 'package:clima_flutter/services/location.dart';
import 'package:clima_flutter/services/networking.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late double longitude;
  late double latitude;
  var accuweatherapikey = "FIdb3pNAjsMROx6tiw6S2V5Tkp7Bev0E";
  @override
  void initState() {
    super.initState();
    getLocationdata();
  }

  void getLocationdata() async {
    Location location = Location();
    await location.getcurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    Networkhelper networkhelper = Networkhelper(
        'http://dataservice.accuweather.com/locations/v1/cities/geoposition/search.json?q=$latitude,$longitude&apikey=$accuweatherapikey');
    var citydata = await networkhelper.getData();
    Networkhelper networkhelper2 = Networkhelper(
        'http://dataservice.accuweather.com/currentconditions/v1/$cityid?apikey=$accuweatherapikey');
    var weatherdata = await networkhelper2.getData();
  }

  @override
  Widget build(BuildContext context) {
    getLocationdata();
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

    // var cityname = citydata['EnglishName'];
    // var cityid = citydata['Key'];
    // var temp = weatherdata[0]['Temperature']['Metric']['Value'];
    // var weather = weatherdata[0]['WeatherText'];
    // var icon = weatherdata[0]['WeatherIcon'];
