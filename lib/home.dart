import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rapidfootball/provider/playerprovider.dart';

class PlayerDetails extends StatefulWidget {
   PlayerDetails({Key? key,  required this.index}) : super(key: key);
  final int index;
  @override
  State<PlayerDetails> createState() => _PlayerDetailsState();
}

class _PlayerDetailsState extends State<PlayerDetails> {
  @override
  void initState() {
    final playerProvider=Provider.of<PlayerProvider>(context,listen: false);
  playerProvider.PlayersProvider();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    final playerProvider=Provider.of<PlayerProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("PlayerDetailse"),
      ),
      body:
      playerProvider.loading?CircularProgressIndicator():
      Padding(
        padding: const EdgeInsets.all(18.0),
        child: Card(elevation: 6,
          child: Container(
            height: 400,
            width: 350,
            child: Column(
              children: [
                Center(
                  child: Container(
                    height: 100,
                    width: 100,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(playerProvider.playerModel.response![widget.index].player!.photo.toString()),

                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Text(playerProvider.playerModel.response![widget.index].player!.name.toString(),style: TextStyle(color: Colors.black,fontSize: 25),),
                Text(playerProvider.playerModel.response![widget.index].player!.age.toString(),style: TextStyle(color: Colors.black,fontSize: 18),),
                Text(playerProvider.playerModel.response![widget.index].player!.nationality.toString(),style: TextStyle(color: Colors.black,fontSize: 18),),
                SizedBox(height: 50,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(

                      height: 150,
                      width: 100,
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("GOALS",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                          Text("totel=${playerProvider.playerModel.response![widget.index].statistics![0].goals!.total.toString()}",style: TextStyle(color: Colors.black,fontSize: 18),),
                          Text("conceded=${playerProvider.playerModel.response![widget.index].statistics![0].goals!.conceded.toString()}",style: TextStyle(color: Colors.black,fontSize: 18),),
                          Text("assists=${playerProvider.playerModel.response![widget.index].statistics![0].goals!.assists.toString()}",style: TextStyle(color: Colors.black,fontSize: 18),),
                          Text("saves=${playerProvider.playerModel.response![widget.index].statistics![0].goals!.saves.toString()}",style: TextStyle(color: Colors.black,fontSize: 18),),
                        ],
                      ),
                    ),
                    Container(
                      height: 150,
                      width: 100,
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("PASSES",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                          Text("total",style: TextStyle(color: Colors.black,fontSize: 18),),
                          Text("key",style: TextStyle(color: Colors.black,fontSize: 18),),
                          Text("accuracy",style: TextStyle(color: Colors.black,fontSize: 18),),

                        ],
                      ),
                    ),
                    Container(
                      height: 150,
                      width: 100,

                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("shot",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                          Text("total",style: TextStyle(color: Colors.black,fontSize: 18),),
                          Text("on",style: TextStyle(color: Colors.black,fontSize: 18),),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
