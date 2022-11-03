import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:listviewapi/post_model.dart';
import 'package:listviewapi/FruitDetail.dart';


class McApp extends StatefulWidget {


  @override
  _McAppState createState() => _McAppState();
}

class _McAppState extends State<McApp> {
  final videoPlayerController = VideoPlayerController.network("");
  late ChewieController chewieController;

  late final String uur;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sample App"),
        ),
        body: Container(
          child:
              Chewie(controller: chewieController),));
  }
}