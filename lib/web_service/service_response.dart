
import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:path_provider/path_provider.dart';


class PostRequest {

  PostRequest();

  Future<String> sendPostRequestMultiPart(File file) async {
    try {

      var request = http.MultipartRequest("POST", Uri.parse("https://webe.com.br/hm/webservice/usuario/chat/adicionaraudio"));
      request.fields['id_de'] = "264";
      request.fields['id_para'] = "12";
      request.fields['token'] = "f7DRB00J";

      request.files.add(await http.MultipartFile.fromPath('audio', file.path));

      final response = await request.send();
      final responseString = await response.stream.bytesToString();

      print(responseString + " " + response.statusCode.toString());

      if (response.statusCode == 200) {
        return responseString;
      } else {
        throw Exception('Falha na solicitação POST: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erro durante a solicitação POST: $e');
    }
  }
}
