import 'dart:convert';

import 'package:http/http.dart';

import '../util/nothing.dart';
import '../util/request_type.dart';
import '../util/request_type_exception.dart';

class ApiClient {
  //Base url
  static const String _baseUrl = "api.unsplash.com";
  late final Client _client;

  ApiClient(this._client);

  Future<Response> request({required RequestType requestType, required String path, dynamic parameter = Nothing}) async {
    switch (requestType) {
      case RequestType.GET:
        return _client.get(Uri.https(_baseUrl, path, parameter),
            headers: {"Authorization": "Client-ID d7aaad899d10c0f9def7d3e33707660d3d548d1d40a3d66af4a053142c08c07d"});
      case RequestType.POST:
        return _client.post(Uri.https(_baseUrl, path),
            headers: {"Content-Type": "application/json"}, body: json.encode(parameter));
      case RequestType.DELETE:
        return _client.delete(Uri.https(_baseUrl, path));
      default:
        return throw RequestTypeNotFoundException("The HTTP request mentioned is not found");
    }
  }
}