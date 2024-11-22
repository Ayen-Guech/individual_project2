import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../weather_provider.dart';

class ForecastScreen extends StatelessWidget {
  const ForecastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('5-Day Forecast'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.green.shade300, 
              Colors.grey.shade700,   
            ],
          ),
        ),
        child: weatherProvider.isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: weatherProvider.forecast.length,
                itemBuilder: (context, index) {
                  final forecast = weatherProvider.forecast[index];
                  return ListTile(
                    leading: Image.network(
                      'https://openweathermap.org/img/wn/${forecast['weather'][0]['icon']}@2x.png',
                    ),
                    title: Text('${forecast['main']['temp']}°C - ${forecast['weather'][0]['description']}'),
                    subtitle: Text(forecast['dt_txt']),
                    onTap: () async {
                      // Show a continuous circular loading spinner for 10 seconds
                      showDialog(
                        context: context,
                        barrierDismissible: false, 
                        builder: (_) => const Center(
                          child: CircularProgressIndicator(), 
                        ),
                      );

                      // Simulate the 10-second loading process
                      await Future.delayed(const Duration(seconds: 10));

                  
                      Navigator.pop(context);

                    
                      _showWeatherDetails(context, forecast);
                    },
                  );
                },
              ),
      ),
    );
  }

  void _showWeatherDetails(BuildContext context, Map<String, dynamic> forecast) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Weather for the Day'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Temperature: ${forecast['main']['temp']}°C'),
            Text('Description: ${forecast['weather'][0]['description']}'),
            Text('Humidity: ${forecast['main']['humidity']}%'),
            Text('Wind Speed: ${forecast['wind']['speed']} m/s'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}
