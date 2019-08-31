import 'dart:async';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:http/http.dart' as http;

//import 'package:flutter_flux/flutter_flux.dart';


class DeribitClient with SecureStoreMixin {
//  final String api_key;
//  final String api_secret;
//  final bool testnet;

  final String baseUrlTest = 'https://test.deribit.com/api/v2/';
//  DeribitClient({this.api_key, this.api_secret, this.testnet})




  Future<String> getIndex() async {
//    var client = http.Client();
//    var streamedresp = await client.send(http.Request('get', Uri.parse(this.baseUrlTest + 'public/get_index' + '?currency=BTC')));

    http.Response getresp = await http.get(this.baseUrlTest + 'public/get_index' + '?currency=BTC');

    if (getresp.statusCode == 200){
      return json.decode(getresp.body)['result']['BTC'].toString();   // return result
    }else{
      throw Exception('Request failed with status code ${getresp.statusCode}');
    }

//    resp = streamedresp.stream
//        .transform(utf8.decoder)
//        .transform(json.decoder)
//        .expa
  }


}


class SecureStoreMixin {
  final secureStore = FlutterSecureStorage();

  void setSecureStore(String key, String value) async {
    await secureStore.write(key: key, value: value);
  }

  void getSecureStore(String key, Function callback) async {
    await secureStore.read(key: key).then(callback);
  }

  void printLol() {
    print("Did the method lol");
  }
}