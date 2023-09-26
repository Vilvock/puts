import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Fourth extends StatefulWidget {
  const Fourth({Key? key}) : super(key: key);

  @override
  State<Fourth> createState() => _Fourth();
}

class _Fourth extends State<Fourth> {

  AudioPlayer audioPlayer = AudioPlayer();               // Create a player

  @override
  void initState() {
    dasdas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                child: Image.asset(
                  'images/3.jpg',
                  fit: BoxFit.fitHeight,
                ),
              ),
              Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                          width: double.infinity,
                          child: Card(
                              elevation: 0,
                              color: Colors.white,
                              margin: EdgeInsets.all(12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Container(
                                  padding: EdgeInsets.all(20),
                                  child: Text(
                                      textAlign: TextAlign.center,
                                      "o guarda real diz: foi so zueira ta dasjnjndas, se n quiser ir na casa do rei ta de boa, \n\n BABY DONT HURT ME NO MORE OWWWWWWW :D")))),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                          color: Colors.white,
                          child: Row(
                            children: [
/*                              Container(
                                padding: EdgeInsets.all(20),
                                child: Icon(
                                  size: 24,
                                  Icons.favorite_border,
                                  color: Colors.white,
                                ),
                              ),
                              Expanded(
                                  child: Container(
                                    child: Wrap(
                                      children: [
                                        GestureDetector(
                                            onTap: () => {},
                                            child: Text(
                                              "naum",
                                              style: TextStyle(
                                                fontFamily: 'Inter',
                                                fontSize: 14,
                                                color: Colors.red,
                                              ),
                                            )),
                                      ],
                                    ),
                                  )),
                              Container(
                                child: VerticalDivider(
                                  color: Colors.white,
                                  width: 2,
                                  thickness: 1.5,
                                ),
                              ),*/
                              // Container(
                              //   padding: EdgeInsets.all(20),
                              //   child: Icon(
                              //     color: Colors.white,
                              //     size: 24,
                              //     Icons.shopping_cart_outlined,
                              //   ),
                              // ),
                              // Expanded(
                              //     child: Container(
                              //         child: Wrap(children: [
                              //           GestureDetector(
                              //             onTap: () => {
                              //
                              //               Navigator.of(context).pop()
                              //             },
                              //             child: Text("olhar para o guarda real",
                              //                 style: TextStyle(
                              //                   fontFamily: 'Inter',
                              //                   fontSize: 14,
                              //                 )),
                              //           ),
                              //         ])))
                            ],
                          ))
                    ],
                  ))
            ],
          ),
        ));
  }

  void dasdas () async{
    final player = AudioPlayer();
    await player.play(UrlSource('https://webe.com.br/_uploads/audio/b18fd1933178340ac5ddb9924e4116bd.mp3'));

  }

}
