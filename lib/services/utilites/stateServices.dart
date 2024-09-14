import 'dart:convert';
import 'package:covid19/models/WorldCovidAttacktModel.dart';
import 'package:covid19/services/utilites/app_url.dart';
import 'package:http/http.dart' as http;

class Stateservices {
 static Future<Worldcovidattacktmodel> covidstaterecord() async {
    final responce = await http.get(Uri.parse(AppUrl.worldStateApi));
    if (responce == 200) {
      var decode = jsonDecode(responce.body);

      return Worldcovidattacktmodel.fromJson(decode);
    } else {
     throw  Exception("Error");
    }
  }
}
