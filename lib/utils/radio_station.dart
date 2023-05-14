import 'package:radio/model/radio_station.dart';

class RadioStations{
  static List<RadioStation> allStation=[
    RadioStation(
        name: 'Channel 1',
        streamUrl: 'https://stream.live.vc.bbcmedia.co.uk/bbc_radio_one',
        photoUrl: 'https://upload.wikimedia.org/wikipedia/en/0/00/Bangladesh-betar-logo.jpg',

    ),
    RadioStation(
        name: 'Channel 2',
        streamUrl: 'http://stream.live.vc.bbcmedia.co.uk/bbc_radio_two',
        photoUrl: 'https://listenonlineradio.com/wp-content/uploads/2019/02/ABC-Radio-FM-89.2-Logo.jpg',

    ),
  ];
}