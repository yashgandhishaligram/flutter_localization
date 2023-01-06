


import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

enum ConnectivityStatus { online, offline }

class ConnectivityService {

  static final ConnectivityService instance = ConnectivityService._instance();
  ConnectivityService._instance();

  Future<ConnectivityStatus> checkConnectionStatus() async {
    ConnectivityResult connectivityResult =
    await (Connectivity().checkConnectivity());

    return await _getStatusFromResult(connectivityResult);
  }

  Future<ConnectivityStatus> _getStatusFromResult(
      ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.mobile:
        return (await checkIsInternetConnected())
            ? ConnectivityStatus.online
            : ConnectivityStatus.offline;
      case ConnectivityResult.wifi:
        return (await checkIsInternetConnected())
            ? ConnectivityStatus.online
            : ConnectivityStatus.offline;
      case ConnectivityResult.none:
        return ConnectivityStatus.offline;
      default:
        return ConnectivityStatus.offline;
    }
  }

  //Method to check actual internet connection
  Future<bool> checkIsInternetConnected() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
    return false;
  }
}