import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weatherModel.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/sources/weather_info.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Search a City'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
                onChanged: (value) {
                  cityName = value;
                },
                onSubmitted: (value) async {
                  cityName = value;
                  WeatherService weatherService = WeatherService();
                  WeatherModel? weather =
                      await weatherService.getWeather(cityName: cityName!);
                  Provider.of<WeatherProvider>(context, listen: false)
                      .weatherData = weather;
                  Provider.of<WeatherProvider>(context, listen: false)
                      .cityName = cityName;
                  Navigator.pop(context);
                },
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 32, horizontal: 16),
                    label: const Text('Search'),
                    hintText: 'Enter City Name',
                    suffixIcon: IconButton(
                        onPressed: () async {
                          WeatherService weatherService = WeatherService();
                          WeatherModel? weather = await weatherService
                              .getWeather(cityName: cityName!);
                          Provider.of<WeatherProvider>(context, listen: false)
                              .weatherData = weather;
                          Provider.of<WeatherProvider>(context, listen: false)
                              .cityName = cityName;
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.search)),
                    border: const OutlineInputBorder())),
          ),
        ));
  }
}
