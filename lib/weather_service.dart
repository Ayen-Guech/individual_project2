import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  final String apiKey = '483ca863059bdfcab502eb65f4715150';

  Future<Map<String, dynamic>> getCurrentWeather(String city) async {
    final url = 'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<List<Map<String, dynamic>>> get5DayForecast(String city) async {
    final url = 'https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=$apiKey&units=metric';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return List<Map<String, dynamic>>.from(data['list']);
    } else {
      throw Exception('Failed to load forecast data');
    }
  }
}
