import 'package:firebase_auth/firebase_auth.dart';
import '../models/user.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on FirebaseUser

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
      .map((FirebaseUser user) => _userFromFirebaseUser(user));
  }


  // sign in anonymously
  Future signInAnon () async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
  // sign in with email & pwd

  // sign out
}