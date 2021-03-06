import 'package:flutter/material.dart';
import 'package:hopex_progx/hand_cursor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerOptionTabletLandscape extends StatelessWidget {
  final String title;
  final IconData iconData;
  final String toPage;
  const DrawerOptionTabletLandscape({
    Key key,
    this.title,
    this.iconData, this.toPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String currRoute = ModalRoute.of(context).settings.name;
    return HandCursor(
      child: MaterialButton(
        highlightElevation: 0,
        hoverElevation: 0,
        minWidth: double.infinity,
        shape: (currRoute == toPage || currRoute == toPage) ? Border(
            left: BorderSide(color: Colors.green, width: 3)
        ) : null,
        onPressed: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          if(toPage == "/SignIn"){
            prefs.setBool('isLoggedIn', false);
            prefs.setString('token', null);
          }
          Navigator.of(context).pushReplacementNamed(toPage);
        },
        splashColor: Colors.green.shade200,
        highlightColor: Colors.green.shade200,
        elevation: 0,
        color: (currRoute == toPage || currRoute == toPage) ? Colors.grey.shade100 : Colors.transparent,
        child: Container(
          padding: EdgeInsets.only(top: 15, bottom: 15, right: 5, left: 5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                iconData,
                size: 25,
                color: (currRoute == toPage || currRoute == toPage) ?
                Colors.green : Colors.black,
              ),
              SizedBox(height: 5,),
              Text(title, style: TextStyle(fontSize: 13, color: Colors.black54)),
            ],
          ),
        ),
      ),
    );
  }
}
