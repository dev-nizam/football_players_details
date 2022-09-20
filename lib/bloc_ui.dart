import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapidfootball/bloc/player_bloc.dart';
import 'package:rapidfootball/home.dart';
import 'package:rapidfootball/model/PlayerModel.dart';

class BlocUi extends StatefulWidget {
  const BlocUi({Key? key}) : super(key: key);

  @override
  State<BlocUi> createState() => _BlocUiState();
}

class _BlocUiState extends State<BlocUi> {
  late PlayerModel playerModel;
  @override
  void initState() {
    BlocProvider.of<PlayerBloc>(context).add(GetPlayers());
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PlayersListBloc"),
      ),
      body: BlocBuilder<PlayerBloc, PlayerState>(
        builder: (context, state) {
          if(state is PlayerLoading){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if(state is PlayerError){
            return  Center(
              child: Text("something went wrong "),
            );
          }
          if(state is PlayerLoaded){
            playerModel = BlocProvider.of<PlayerBloc>(context).playerModel;
            return ListView.separated(
              itemCount: playerModel.response!.length,
              itemBuilder: (ctx, index) {
                return GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (ctx) => PlayerDetails(
                    //           index: index,
                    //         )));
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(playerModel.response![index].player!.photo
                          .toString()),
                    ),
                    title: Text(playerModel.response![index].player!.name
                        .toString()),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 5,
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
