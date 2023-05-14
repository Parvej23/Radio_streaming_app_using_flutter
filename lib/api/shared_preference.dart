import 'package:radio/model/radio_station.dart';
import 'package:radio/utils/radio_station.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsApi{
  static const _key='radio_station';
 static Future<RadioStation> getInitialRadioStation() async{
   final sharedPrefs= await SharedPreferences.getInstance();
   final stationName= sharedPrefs.getString(_key);
   if(stationName==null) return RadioStations.allStation[0];
   return RadioStations.allStation.firstWhere((element) =>
       element.name==stationName);
 }
 static Future<void> setStation(RadioStation station) async{
   final sharedPrefs= await SharedPreferences.getInstance();

   sharedPrefs.setString(_key, station.name);
 }
}