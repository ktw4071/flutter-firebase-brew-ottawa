import 'package:brew_ottawa/models/brew.dart';
import 'package:brew_ottawa/screens/home/settings_form.dart';
import 'package:brew_ottawa/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:brew_ottawa/services/database.dart';
import 'package:provider/provider.dart';
import 'brew_list.dart';

class Home extends StatelessWidget {
  
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    void _showSettingPanel() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 20.0),
          child: SettingsForm()
        );
      });
    }

    return StreamProvider<List<Brew>>.value(
        value: DatabaseService().brews,
        child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Brew Crew'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              }, 
              icon: Icon(Icons.person), 
              label: Text('Logout')
            ),
            FlatButton.icon(
              icon: Icon(Icons.settings),
              label: Text('settings'),
              onPressed: () => _showSettingPanel(),
            )
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/coffee_bg.png'),
              fit: BoxFit.cover
            )
          ),
          child: BrewList()
        ),
      ),
    );
  }
}