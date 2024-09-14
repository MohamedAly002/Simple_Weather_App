class WeatherModel {
  final double temperature;
  final double minTemp;
  final double maxTemp;
  final String description;
  final String? image;
  final String cityName;

  WeatherModel({
    required this.cityName,
    required this.temperature,
    required this.minTemp,
    required this.maxTemp,
    required this.description,
    required this.image,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['city']['name'],
      temperature: json['list'][0]['main']['temp'],
      minTemp: json['list'][0]['main']['temp_min'],
      maxTemp: json['list'][0]['main']['temp_max'],
      description: json['list'][0]['weather'][0]['description'],
      image: json['list'][0]['weather'][0]['icon'],
    );
  }
}
