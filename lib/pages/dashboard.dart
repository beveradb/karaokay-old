import 'package:flutter/material.dart';
import 'package:karaokay/blocs/bloc-provider.dart';
import 'package:karaokay/blocs/user-bloc.dart';
import 'package:karaokay/models/user.dart';
import 'package:karaokay/services/auth.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
    return Scaffold(
      body: Center(
        child: StreamBuilder<UserModel>(
          initialData: userBloc.user,
          stream: userBloc.stream,
          builder: (ctx, snap) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(snap.data.username),
                  SizedBox(height: 20.0),
                  RaisedButton(
                    child: Text('LOGOUT'),
                    onPressed: AuthService().handleSignOut,
                  ),
                ],
              ),
        ),
      ),
    );
  }
}
