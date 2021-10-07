import 'package:http/http.dart' as http;
import 'package:flutter_config/flutter_config.dart';

import 'dart:async';
import 'dart:io';
import 'dart:convert';

// 1. GET Client Credentials
Future getClientCredentials() async {
  String _username = FlutterConfig.get('USERNAME');
  String _password = FlutterConfig.get('PASSWORD');

  String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_username:$_password'));
  // print('Basic Auth: $basicAuth');

  final response = await http.get(
      Uri.parse('https://sandbox.safaricom.co.ke/oauth/v1/generate?grant_type=client_credentials'),
      headers: {'authorization': basicAuth}
  );

  final jsonResponse = jsonDecode(response.body);
  print('JSON Response: $jsonResponse');

  return AccessCredentials.fromJson(jsonResponse);
}

class AccessCredentials{
  final accessToken;
  final expiresIn;

  AccessCredentials({this.accessToken, this.expiresIn});

  factory AccessCredentials.fromJson(Map<String, dynamic> json){
    return AccessCredentials(accessToken: json["access_token"], expiresIn: json['expires_in'],
    );
  }
}

Future processRequest(amount, phoneNumber) async {
  final accessCredentials = await getClientCredentials();

  try{
    final response = await http.post(
        Uri.parse('https://sandbox.safaricom.co.ke/mpesa/stkpush/v1/processrequest'),
        headers: {
          'Authorization': 'Bearer ${accessCredentials.accessToken}',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          "BusinessShortCode": 174379,
          "Password": "MTc0Mzc5YmZiMjc5ZjlhYTliZGJjZjE1OGU5N2RkNzFhNDY3Y2QyZTBjODkzMDU5YjEwZjc4ZTZiNzJhZGExZWQyYzkxOTIwMjEwOTAxMTEwNTI4",
          "Timestamp": "20210901110528",
          "TransactionType": "CustomerPayBillOnline",
          "Amount": amount,
          "PartyA": phoneNumber,
          "PartyB": 174379,
          "PhoneNumber": phoneNumber,
          "CallBackURL": "https://mydomain.com/path",
          "AccountReference": "CHATMATE",
          "TransactionDesc": "Payment of X"
        })
    );
    print(jsonDecode(response.body));

  } catch(error){
    print(error);
  }
}