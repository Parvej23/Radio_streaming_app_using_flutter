import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radio/api/radio_api.dart';
import 'package:radio/api/shared_preference.dart';
import 'package:radio/model/radio_station.dart';
import 'package:radio/providers/radio_provider.dart';
import 'package:radio/utils/radio_station.dart';
class RadioList extends StatefulWidget {
  const RadioList({Key? key}) : super(key: key);

  @override
  State<RadioList> createState() => _RadioListState();
}

class _RadioListState extends State<RadioList> {
  late RadioStation selectedStation;
  late RadioProvider provider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider=Provider.of<RadioProvider>(context, listen: false);
    selectedStation= provider.station;
  }
  @override
  Widget build(BuildContext context) {
    final provider= Provider.of<RadioProvider>(context, listen: false);
    return ListView.builder(
      itemCount: RadioStations.allStation.length,
      itemBuilder: (context, index){
        final station= RadioStations.allStation[index];
        bool isSelected= station.name==provider.station.name;
        return Container(
          decoration: BoxDecoration(
            gradient: isSelected?
                LinearGradient(
                  colors: [
                    Colors.pink,
                    Colors.deepPurple
                  ]
                ):null,
          ),
          child: ListTile(
            leading: Image.network(station.photoUrl, width: 40, height: 40,fit: BoxFit.cover,),
            horizontalTitleGap: 50,
            title: Text(
              station.name,
              style: TextStyle(
                color: isSelected? Colors.white: Colors.black,
                fontWeight: isSelected? FontWeight.bold: FontWeight.normal
              ),
            ),
            onTap: () async{
              provider.setRadioStation(station);
              SharedPrefsApi.setStation(station);
              await RadioApi.changeStation(station);
              setState(() {
                selectedStation=station;
              });
            }
          ),
        );
      },
    );
  }
}
