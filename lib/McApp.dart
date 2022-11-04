import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/services.dart';
import 'package:listviewapi/main.dart';
import 'package:video_player/video_player.dart';
import 'package:listviewapi/FruitDetail.dart';
import 'package:get/get.dart';


class McApp extends StatefulWidget {
  late final String value;
  McApp({Key? key, required this.value}) : super (key: key);

  @override
  _McAppState createState() => _McAppState();
}

class _McAppState extends State<McApp> {
  late ChewieController chewieController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final videoPlayerController = VideoPlayerController.network(widget.value)..initialize().then((_) => setState((){}));
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      showControls: true,
      aspectRatio: 16/9,
      allowFullScreen: true,
      fullScreenByDefault: true,
      allowMuting: true,
      autoPlay: true,

    );
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
        onWillPop: () async {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          } else {
            SystemNavigator.pop();
          }
      return true;
    },
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,

          body: Container(
            child:
                Chewie(controller: chewieController),)),
    )
    );
  }
}