import 'dart:convert' show json;

import 'package:flukan/api/api.dart';
import 'package:http/http.dart' as http;

Future<Version> getVersion() async {
  final response = await http.get(Api().rootURL() + '/version');

  if (response.statusCode == 200) {
    return Version.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to get service version');
  }
}

class Version {
  final String version;
  Version({this.version});
  factory Version.fromJson(Map<String, dynamic> json) {
    return Version(
      version: json['version'],
    );
  }
}
