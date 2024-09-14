import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:simple_weather_app/Api/api_manager.dart';
import 'package:simple_weather_app/cubit/get_weather_cubit/get_weather_states.dart';
import 'package:simple_weather_app/model/Weather_model.dart';
import 'package:simple_weather_app/services/location_handeler.dart';

class GetWeatherCubit extends Cubit<WeatherStates> {
  GetWeatherCubit() : super(IntialLoadingState());
  late WeatherModel weatherdata;
  late LocationHandeler locationdataHandeler = LocationHandeler();
  ApiManager apiManager = ApiManager();

  void getWeatherData() async {
    emit(IntialLoadingState());
    try {
      Position position = await locationdataHandeler.determinePosition();
      weatherdata = await apiManager.getWeatherData(
          position.latitude, position.longitude);

      emit(LoadedState());
    } catch (e) {
      emit(ErrorState());
    }
  }
}
