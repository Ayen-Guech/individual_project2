import 'package:flutter/material.dart';
import 'weather_service.dart';

class WeatherProvider with ChangeNotifier {
  final WeatherService _weatherService = WeatherService();

  String _city = 'New York';
  String get city => _city;

  Map<String, dynamic>? _currentWeather;
  Map<String, dynamic>? get currentWeather => _currentWeather;

  List<Map<String, dynamic>> _forecast = [];
  List<Map<String, dynamic>> get forecast => _forecast;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Map<String, dynamic>? get selectedDayWeather => null;

  Future<void> fetchCurrentWeather() async {
    _isLoading = true;
    notifyListeners();

    try {
      _currentWeather = await _weatherService.getCurrentWeather(_city);
    } catch (e) {
      print(e);
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchForecast() async {
    _isLoading = true;
    notifyListeners();

    try {
      _forecast = await _weatherService.get5DayForecast(_city).then((data) => data.sublist(0, 5));
    } catch (e) {
      print(e);
    }

    _isLoading = false;
    notifyListeners();
  }

  void setCity(String newCity) {
    _city = newCity;
    fetchCurrentWeather();
    fetchForecast();
    notifyListeners();
  }

  fetchWeatherForDay(forecast) {}
}
