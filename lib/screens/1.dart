import 'dart:convert';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:record/record.dart';

import '../web_service/service_response.dart';

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


  final postRequest = PostRequest();

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
        await audioRecord.start(
          encoder: AudioEncoder.aacLc,
          bitRate: 128000,);
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
      // Source urlSource = UrlSource(audioPath);
      //
      // await audioPlayer.play(urlSource);

      sendAudio(File(audioPath));
    } catch (e) {
      print('deu pau');
    }
  }

  Future<void> sendAudio(File audio) async {
    try {
      final json = await postRequest.sendPostRequestMultiPart(
        audio,);

      List<Map<String, dynamic>> _map = [];
      _map = List<Map<String, dynamic>>.from(jsonDecode(json));

      print('HTTP_RESPONSE: $_map');


    } catch (e) {
      throw Exception('HTTP_ERROR: $e');
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
