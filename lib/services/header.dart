import 'dart:async';

import 'package:chopper/chopper.dart';

class HeaderAPI extends RequestInterceptor {
  static const String AUTH_HEADER = 'Authorization';
  static const String BEARER = 'Bearer ';
  // API KEY
  static const String V4 = 'api_key_here';

  @override
  FutureOr<Request> onRequest(Request request) async {
    Request r = request.copyWith(headers: {AUTH_HEADER: BEARER + V4});
    return r;
  }
}
