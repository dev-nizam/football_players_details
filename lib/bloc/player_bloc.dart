import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rapidfootball/api/player_api.dart';
import 'package:rapidfootball/model/PlayerModel.dart';

part 'player_event.dart';
part 'player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {

  PlayerApi playerApi = PlayerApi();
  late PlayerModel playerModel;

  PlayerBloc() : super(PlayerInitial()) {
    on<GetPlayers>((event, emit) => getPlayer(event, emit));
   // on<GetPlayersPlayersId>((event, emit) => getPlayerTest(event, emit,event.id));
  }

  void getPlayer(PlayerEvent playerEvent,Emitter<PlayerState> emit) async {
    emit(PlayerLoading());
    try{
      playerModel = await playerApi.Player();
      emit(PlayerLoaded());
    }catch(e){
      emit(PlayerError());
      print("error >>>>>>>>>>>>>>>>> "+e.toString());
    }

  }

  void getPlayerTest(PlayerEvent playerEvent,Emitter<PlayerState> emit,int id) async {

  }
}
