
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../weather_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Current Weather'),
      ),
      body: Center(
        child: weatherProvider.isLoading
            ? const CircularProgressIndicator()
            : weatherProvider.currentWeather != null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (weatherProvider.currentWeather!['weather'] != null)
                        Image.network(
                          "https://openweathermap.org/img/wn/${weatherProvider.currentWeather!['weather'][0]['icon']}@2x.png",
                        ),
                      Text(
                        '${weatherProvider.currentWeather!['main']['temp']}°C',
                        style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        weatherProvider.currentWeather!['weather'][0]['description'],
                        style: const TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                      ),
                    ],
                  )
                : const Text('Failed to load weather data'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: weatherProvider.fetchCurrentWeather,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
