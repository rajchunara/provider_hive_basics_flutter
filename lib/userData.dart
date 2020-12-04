import 'package:flutter/material.dart';

class UserData extends ChangeNotifier {
  bool isLoggedIn = false;

  alterLoggedInStatus() {
    isLoggedIn = !isLoggedIn;

    notifyListeners();
  }
}
