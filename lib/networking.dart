import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkGetter {
  NetworkGetter({required this.url});

  final String url;

  Future getData() async {
    Uri url_ = Uri.parse(url);
    http.Response resp = await http.get(url_);

    if (resp.statusCode == 200) {
      String data = resp.body;
      var cryptoData = jsonDecode(data);
      // print(cryptoData);
      return cryptoData;
    } else {
      print(resp.statusCode);
    }
  }
}
