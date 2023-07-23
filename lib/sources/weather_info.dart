import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weatherModel.dart';

class WeatherService {
  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weather;
    try {
      String baseUrl = 'http://api.weatherapi.com/v1';
      String apikey = '92fa018061ee4c3d934215334231207';
      Uri url =
          Uri.parse('$baseUrl/forecast.json?key=$apikey&q=$cityName&days=7');
      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);
      weather = WeatherModel.fromJson(data);
    } catch (e) {}
    return weather;
  }
}
