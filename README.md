# currentweather

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



# Weather App

This Flutter app provides weather information by integrating with the OpenWeather API. Users can view the current weather, a 5-day forecast, and search for weather information by city name.

 Screens

HomeScreen
Description: Displays the current weather for a city.
Widgets:
 AppBar Displays the title "Current Weather."
  Center Centers the content vertically and horizontally.
  CircularProgressIndicator: Shows a loading spinner when data is loading.
  Column Displays the weather data vertically, including:
   Image.network: Fetches and displays the weather icon.
   Text Displays the temperature and weather description.
  FloatingActionButton: Allows the user to refresh the current weather data.


 ForecastScreen
Description Shows a 5-day weather forecast.
Widgets
 AppBar Displays the title "5-Day Forecast."
  Container: Wraps the entire screen with a gradient background (light green to dark grey).
  CircularProgressIndicator Displays a loading spinner while data is loading.
  ListView.builderCreates a scrollable list of weather forecasts.
  ListTile: Represents each forecast item, with the following components:
  adding Displays the weather icon for the forecast day using `Image.network`.
    title: Shows the temperature and weather description using `Text`.
    subtitle: Displays the forecast date and time.
   onTap: Opens a dialog showing detailed information about the selected day with a 10-second loading spinner.
  AlertDialog: Provides a popup with detailed weather information for the selected day.

### SearchScreen
DescriptionAllows users to search for a city's weather.
Widgets
  AppBar: Displays the title "Search City.
  Container: Sets a light blue background for the screen.
  Padding: Adds padding around the central content.
  Column: Displays components vertically, including:
   Text: Displays the prompt "Enter City Name" in bold, centred black text.
   TextField: Allows users to input a city name, with customised black label and border styles.
    ElevatedButton: Allows users to submit their search request, triggering the following actions:
      showDialog: Shows a loading spinner for 10 seconds.
      SnackBar: Displays a message if the user does not enter a city name.
 Navigator.pushReplacement: Redirects to the ForecastScreen once the search is complete.

Core Widgets and Functionalities

Widgets
AppBar: Provides a consistent title bar across all screens.
Container: Adds backgrounds and gradients to screens.
CircularProgressIndicator: Indicates loading when fetching data.
Column: Organises multiple widgets vertically.
TextField: Allows text input in the search screen.
ElevatedButton: Provides a clickable button for submitting actions.
ListView.builder: Dynamically generates a scrollable list for forecast data.
ListTile: Represents each forecast entry in the list.

 Providers and State Management
Provider: Manages state for weather data across the app.
 WeatherProvider is the main provider used for managing API calls, storing data, and updating the app state based on API responses.

How to Use
1. Home Screen Displays the current weather for a pre-set city. Tap the refresh button to update the data.
2. Forecast Screen: Displays the 5-day forecast with temperature and weather icons. Tap a forecast item to view detailed information.
3. Search Screen: Enter a city name and press Get Weather to view the forecast. A loading spinner will appear, and the app will navigate to the forecast after the data loads.

## Requirements
Flutter SDK: 
Provider Package: Manages app state 
internet Connection: Required for fetching data from OpenWeather API.




