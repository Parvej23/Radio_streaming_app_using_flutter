import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radio/api/shared_preference.dart';
import 'package:radio/model/radio_station.dart';
import 'package:radio/providers/radio_provider.dart';
import 'screens/home_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final radioStation= await SharedPrefsApi.getInitialRadioStation();
  runApp(MyApp(
    initialStation: radioStation,
  ));
}

class MyApp extends StatelessWidget {
  final RadioStation initialStation;
  const MyApp({super.key, required this.initialStation});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ((context)=> RadioProvider(initialStation)),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}

