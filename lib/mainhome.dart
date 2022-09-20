import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rapidfootball/home.dart';
import 'package:rapidfootball/provider/playerprovider.dart';

class MainHome extends StatefulWidget {
  MainHome({
    Key? key,
  }) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  void initState() {
    final playerProvider = Provider.of<PlayerProvider>(context, listen: false);
    playerProvider.PlayersProvider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final playerProvider = Provider.of<PlayerProvider>(context);
    return Scaffold(
              appBar: AppBar(
              title: Text("PlayersList"),
        ),
        body: playerProvider.loading
            ? CircularProgressIndicator()
            : Container(
                child: ListView.separated(
                  itemCount: playerProvider.playerModel.response!.length,
                  itemBuilder: (ctx, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => PlayerDetails(
                                      index: index,
                                    )));
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(playerProvider
                              .playerModel.response![index].player!.photo
                              .toString()),
                        ),
                        title: Text(playerProvider
                            .playerModel.response![index].player!.name
                            .toString()),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 5,
                    );
                  },
                ),
              ));
  }
}
