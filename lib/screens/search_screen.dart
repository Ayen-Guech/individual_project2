import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../weather_provider.dart';
import 'forecast_screen.dart'; 

class SearchScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search City'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.lightBlue[100],
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Enter City Name',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Changed to black
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    labelText: 'City name',
                    labelStyle: TextStyle(color: Colors.black), // Changed to black
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black), // Changed to black
                    ),
                  ),
                  style: const TextStyle(color: Colors.black), // Changed to black
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (_controller.text.isNotEmpty) {
                      // Show loading indicator
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) => const Center(child: CircularProgressIndicator()),
                      );

                      await Future.delayed(const Duration(seconds: 10));

                      Provider.of<WeatherProvider>(context, listen: false)
                          .setCity(_controller.text);

                      // Dismiss the loading dialog
                      Navigator.pop(context);

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const ForecastScreen()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please enter a city name.')),
                      );
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.blue),
                    padding: WidgetStateProperty.all(const EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
                  ),
                  child: const Text('Get Weather'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
