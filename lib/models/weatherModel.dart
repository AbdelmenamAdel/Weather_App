import 'package:flutter/material.dart';

class WeatherModel {
  DateTime date;
  double minTemp;
  double maxTemp;
  double temp;
  String weatherCondition;

  WeatherModel(
      {required this.date,
      required this.minTemp,
      required this.maxTemp,
      required this.temp,
      required this.weatherCondition});

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
        date: DateTime.parse(data['location']['localtime']),
        minTemp: jsonData['mintemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        temp: jsonData['avgtemp_c'],
        weatherCondition: jsonData['condition']['text']);
  }
  String getImage() {
    if (weatherCondition == 'Clear' || weatherCondition == 'Sunny') {
      return 'assets/images/113.png';
    } else if (weatherCondition == 'Partly cloudy') {
      return 'assets/images/116.png';
    } else if (weatherCondition == 'Cloudy') {
      return 'assets/images/119.png';
    } else if (weatherCondition == 'Patchy rain possible') {
      return 'assets/images/176.png';
    } else if (weatherCondition == 'Patchy sleet possible') {
      return 'assets/images/182.png';
    } else if (weatherCondition == 'Thundery outbreaks possible') {
      return 'assets/images/200.png';
    } else if (weatherCondition == 'Heavy rain at times' ||
        weatherCondition == 'Heavy rain' ||
        weatherCondition == 'Moderate rain') {
      return 'assets/images/305.png';
    } else if (weatherCondition == 'Light sleet') {
      return 'assets/images/317.png';
    } else if (weatherCondition == 'Moderate snow') {
      return 'assets/images/332.png';
    } else if (weatherCondition == 'Patchy heavy snow' ||
        weatherCondition == 'Heavy snow' ||
        weatherCondition == 'Blowing snow' ||
        weatherCondition == 'Patchy snow possible') {
      return 'assets/images/335.png';
    } else if (weatherCondition == 'Light rain shower') {
      return 'assets/images/353.png';
    } else if (weatherCondition == 'Torrential rain shower' ||
        weatherCondition == 'Patchy light rain with thunder') {
      return 'assets/images/359.png';
    } else if (weatherCondition == 'Moderate or heavy sleet showers') {
      return 'assets/images/365.png';
    } else if (weatherCondition == 'Light snow showers') {
      return 'assets/images/368.png';
    } else if (weatherCondition == 'Patchy light snow with thunder') {
      return 'assets/images/392.png';
    } else if (weatherCondition == 'Moderate or heavy snow with thunder') {
      return 'assets/images/395.png';
    } else {
      return 'assets/images/113.png';
    }
  }

  MaterialColor getThemeColor() {
    if (weatherCondition == 'Clear' || weatherCondition == 'Sunny') {
      return Colors.orange;
    } else if (weatherCondition == 'Torrential rain shower' ||
        weatherCondition == 'Patchy light rain with thunder' ||
        weatherCondition == 'Partly cloudy' ||
        weatherCondition == 'Cloudy' ||
        weatherCondition == 'Thundery outbreaks possible' ||
        weatherCondition == 'Patchy light snow with thunder' ||
        weatherCondition == 'Moderate or heavy snow with thunder') {
      return Colors.grey;
    } else if (weatherCondition == 'Heavy rain at times' ||
        weatherCondition == 'Heavy rain' ||
        weatherCondition == 'Moderate rain' ||
        weatherCondition == 'Patchy rain possible' ||
        weatherCondition == 'Patchy sleet possible' ||
        weatherCondition == 'Light snow showers' ||
        weatherCondition == 'Moderate snow' ||
        weatherCondition == 'Patchy heavy snow' ||
        weatherCondition == 'Heavy snow' ||
        weatherCondition == 'Blowing snow' ||
        weatherCondition == 'Patchy snow possible') {
      return Colors.blue;
    } else if (weatherCondition == 'Light sleet' ||
        weatherCondition == 'Moderate or heavy sleet showers' ||
        weatherCondition == 'Light rain shower') {
      return Colors.blueGrey;
    } else {
      return Colors.blue;
    }
  }
}
