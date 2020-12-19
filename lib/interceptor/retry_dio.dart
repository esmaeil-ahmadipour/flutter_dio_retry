import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dio_retry/interceptor/helper_retry_dio.dart';

class RetryConnection extends Interceptor{
  final DioConnectivityRequestRetrier requestRetrier;

  RetryConnection({
    @required this.requestRetrier,
  });

  @override
  Future onError(DioError err) async {
    if (_shouldRetry(err)) {
      try {
        return requestRetrier.scheduleRequestRetry(err.request);
      } catch (e) {
        return e;
      }
    }
    return err;
  }

  bool _shouldRetry(DioError err) {
    return err.type == DioErrorType.DEFAULT &&
        err.error != null &&
        err.error is SocketException;
  }
}