import 'package:brew_ottawa/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'authenticate/authenticate.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print('user - $user');
    // return either Home or Authetnicate Widget
    return Authenticate();
  }
}