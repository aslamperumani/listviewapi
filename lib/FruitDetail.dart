import 'package:flutter/material.dart';
import 'package:listviewapi/post_model.dart';
import 'package:listviewapi/McApp.dart';
import 'package:listviewapi/main.dart';

class FruitDetail extends StatelessWidget {

  final Post fruitDataModel;
  FruitDetail({Key? key, required this.fruitDataModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var frt = fruitDataModel.title.toString();
    var lnk = fruitDataModel.link.toString();

    return Scaffold(
      appBar: AppBar(title: Text(frt),),
      body:

      Column(
        children: [
          Center(child: Padding(
            padding: const EdgeInsets.only(left: 60.0, right: 60, top: 20, bottom: 20),
            child: Image.network(fruitDataModel.body),
          )),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.teal),
              minimumSize: MaterialStatePropertyAll(Size(MediaQuery.of(context).size.width, 40)),
            ),
              child: Text(fruitDataModel.title,
    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),
    ),
              onPressed: () {
                var route = new MaterialPageRoute(
                    builder: (BuildContext context) => new McApp(value: lnk),
                );
                Navigator.of(context).push(route);

              },
    ),
        ],
      ),
    );
  }
}