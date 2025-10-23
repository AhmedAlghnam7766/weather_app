class WeatherModel {
  final String city;
  final String lastUpdate;
  final double currentTemp;
  final double averageTemp;
  final double maxTemp;
  final double minTemp;
  final String text;
  final String iconPath;

  WeatherModel({
    required this.city,
    required this.lastUpdate,
    required this.averageTemp,
    required this.text,
    required this.maxTemp,
    required this.minTemp,
    required this.currentTemp,
    required this.iconPath,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      city: json['location']['name'] ?? 'Your City',
      lastUpdate: json['current']['last_updated'] ?? 'No date',
      currentTemp: json['current']['temp_c'] ?? 0.0,
      averageTemp:
          json['forecast']['forecastday'][0]['day']['avgtemp_c'] ?? 0.0,
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'] ?? 0.0,
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'] ?? 0.0,
      text:
          json['forecast']['forecastday'][0]['day']['condition']['text'] ??
          'No text',
      iconPath:
          json['current']['condition']['icon'] ??
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyNfRFSIbyb40oYPjza5OgYytSKB5U0019ZQ&s',
    );
  }
}
