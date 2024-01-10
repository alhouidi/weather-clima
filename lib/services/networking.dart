import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkingHelper {
  final String? url;

  NetworkingHelper({this.url});

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url!));

    if (response.statusCode == 200) {
      String data = response.body;
      var result = jsonDecode(data);
      print(result['coord']['lon']);
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
