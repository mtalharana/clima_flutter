// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors, avoid_print, unused_local_variable, use_build_context_synchronously

import 'package:clima_flutter/services/weather.dart';
import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late double longitude;
  late double latitude;
  var weatherapikey = "4c38ba785c4029cbbe30de6b3ab5b8b9";
  @override
  void initState() {
    super.initState();
  }

  void getLocationdata() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherdata = await weatherModel.getlocationweather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherdata,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    getLocationdata();
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}

    // 