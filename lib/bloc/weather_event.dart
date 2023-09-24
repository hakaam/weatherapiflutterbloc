part of 'weather_bloc.dart';


sealed class WeatherBlocEvent extends Equatable{
  const WeatherBlocEvent();

  @override
  List<Object> get props => [];


}
 final class FetchWeather extends WeatherBlocEvent{
  final Position position;

  const FetchWeather(this.position);
  @override
  List<Object> get props => [position];



 }
