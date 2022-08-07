// ignore_for_file: avoid_print

import 'package:clima_flutter/services/location.dart';
import 'package:clima_flutter/services/networking.dart';

const openweathermapurl = 'https://api.openweathermap.org/data/2.5/weather';
const apiKey = '4c38ba785c4029cbbe30de6b3ab5b8b9';

class WeatherModel {
  Future<dynamic> getlocationweather() async {
    Location location = Location();
    await location.getcurrentLocation();
    Networkhelper networkhelper = Networkhelper(
        '$openweathermapurl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var weatherdata = await networkhelper.getData();
    print(weatherdata);
    return weatherdata;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  Future<dynamic> getcityweather(typedcityname) async {
    var url = '$openweathermapurl?q=$typedcityname&appid=$apiKey&units=metric';
    Networkhelper citynetworkhelper = Networkhelper(url);
    var weatherdata = await citynetworkhelper.getData();
    return weatherdata;
  }
}
