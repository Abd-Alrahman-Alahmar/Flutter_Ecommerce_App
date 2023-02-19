
import 'package:flutter/material.dart';
import 'package:flutter_8/features/account/services/account_services.dart';

class drawer extends StatelessWidget {
  const drawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            child: Text(
              'Menu',
              style: TextStyle(fontSize: 25),
            ),
          ),
         
          ListTile(
            leading: const Icon(Icons.logout_outlined),
            title: const Text('Logout'),
            onTap: () => AccountServices().logOut(context),
            //{Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}