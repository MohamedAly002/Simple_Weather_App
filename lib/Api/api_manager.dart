import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:simple_weather_app/model/Weather_model.dart';

class ApiManager {
  static const String baseUrl = 'api.openweathermap.org';
  static const String apiKey = '04ed72b485d3511932cb66d5aee24490';

  Future<WeatherModel> getWeatherData(double lat, double lon) async {
    var url = Uri.https(baseUrl, '/data/2.5/forecast', {
      'lat': lat.toString(),
      'lon': lon.toString(),
      'appid': apiKey,
      'units': 'metric',
    });
    http.Response response = await http.get(url);
    return WeatherModel.fromJson(jsonDecode(response.body));
  }
}
