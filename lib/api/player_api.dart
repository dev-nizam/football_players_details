import 'dart:convert';

import 'package:http/http.dart';
import 'package:rapidfootball/api/api_client.dart';
import 'package:rapidfootball/model/PlayerModel.dart';


class PlayerApi{
  ApiClient apiClient=ApiClient();
  Future<PlayerModel>Player()async{
    String path="players/topscorers?season=2019&league=39";
    Response response=await apiClient.invokeApi(path: path, method: "GET", body: null);
    return PlayerModel.fromJson(jsonDecode(response.body));

  }
}