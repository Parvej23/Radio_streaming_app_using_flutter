import 'package:flutter/material.dart';
import 'package:radio/api/radio_api.dart';
import 'package:radio/widgets/gradient_back.dart';
import 'package:radio/widgets/radio_player.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: FutureBuilder(
          future: RadioApi.initPlayer(context),
          builder: (context, snapshot){
            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator.adaptive(
                  backgroundColor: Colors.white,
                ),
              );
            }
            return RadioPlayers();
          },
        )
//        RadioPlayers(),
      ),
    );
  }
}
