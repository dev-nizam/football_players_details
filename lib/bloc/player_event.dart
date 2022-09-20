part of 'player_bloc.dart';

@immutable
abstract class PlayerEvent {}

class GetPlayers extends PlayerEvent{

}
class GetPlayersPlayersId extends PlayerEvent{
  int id;
  GetPlayersPlayersId(this.id);
}