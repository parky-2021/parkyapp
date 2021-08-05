import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Phoneauth with ChangeNotifier {
  // final String? phonenumber;
  // Phoneauth({@required this.phonenumber});
 String? userid;
 

  Future<void> authenticate(phonenumber) async {
    var url = Uri.parse("http://10.0.2.2:8080/api/authenticate_user");

    try {
      final response =
          await http.post(url, body: json.encode({'mobile': phonenumber}));
      final responsedata = json.decode(response.body);

      userid = responsedata["userId"];
    } catch (error) {
      throw (error);
    }
  }
}
