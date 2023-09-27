import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:record/record.dart';

class First extends StatefulWidget {
  const First({Key? key}) : super(key: key);

  @override
  State<First> createState() => _First();
}

class _First extends State<First> {
  late Record audioRecord;
  late AudioPlayer audioPlayer;

  bool isRecording = false;
  String audioPath = '';

  @override
  void initState() {
    audioPlayer = AudioPlayer();
    audioRecord = Record();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    audioRecord.dispose();
    audioPlayer.dispose();
  }

  Future<void> startRecording() async {
    try {
      if (await audioRecord.hasPermission()) {
        await audioRecord.start();
        setState(() {
          isRecording = true;
        });
      }
    } catch (e) {
      print('deu pau');
    }
  }

  Future<void> stopRecording() async {
    try {
      String? path = await audioRecord.stop();

      setState(() {
        isRecording = false;
        audioPath = path!;
      });
    } catch (e) {
      print('deu pau');
    }
  }

  Future<void> playRecording() async {
    try {
      Source urlSource = UrlSource(audioPath);

      await audioPlayer.play(urlSource);
    } catch (e) {
      print('deu pau');
    }
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
                  'images/1.jpg',
                  fit: BoxFit.fitHeight,
                ),
              ),
              Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            if (isRecording) {
                              stopRecording();
                            } else {
                              startRecording();
                            }

                          },
                          child: Container(
                            height: 40,
                            width: 70,
                            color: Colors.black87,
                          )),


                      ElevatedButton(
                          onPressed: () {
                            playRecording();
                          },
                          child: Container(
                            height: 40,
                            width: 70,
                            color: Colors.blue,
                          ))
                    ],
                  ))
            ],
          ),
        ));
  }
}
