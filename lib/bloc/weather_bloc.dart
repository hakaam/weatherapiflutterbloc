

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/weather.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherapiflutterbloc/data/my_data.dart';
part 'weather_event.dart';
part 'weather_state.dart';


class WeatherBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {
  WeatherBloc() : super(WeatherBlocInitial()) {
    on<FetchWeather>((event, emit) async{
      emit(WeatherBlocLoading());
       try {
         WeatherFactory wf=WeatherFactory(API_KEY,language: Language.ENGLISH);
         // Position position= await Geolocator.getCurrentPosition();
         Weather weather=await wf.currentWeatherByLocation(
             event.position.latitude,
             event.position.longitude

         );
         emit(WeatherBlocSuccess(weather));

       } catch(e){
         emit(WeatherBlocFailure());


       }


    });
  }
}
