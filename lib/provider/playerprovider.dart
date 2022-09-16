
import 'package:flutter/cupertino.dart';
import 'package:rapidfootball/api/player_api.dart';
import 'package:rapidfootball/model/PlayerModel.dart';


class PlayerProvider with ChangeNotifier{
 PlayerApi   playerApi= PlayerApi();
  late PlayerModel playerModel;
  bool loading=false;

  PlayersProvider()async{
    loading =true;
    playerModel=await playerApi.Player();
    loading=false;
    notifyListeners();
  }


}