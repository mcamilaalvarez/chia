import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(12),
        topLeft: Radius.circular(12),
      ),
      child: SizedBox(
        height: 62,
        child: BottomNavigationBar(
            backgroundColor: Theme.of(context).cardColor,
            fixedColor: Theme.of(context).primaryColor,
            unselectedItemColor: Theme.of(context).primaryColor,
            selectedFontSize:10,
            unselectedFontSize:10,

            items:
          const <BottomNavigationBarItem>[
           BottomNavigationBarItem(
             icon: Padding(
               padding: EdgeInsets.all(5.0),
               child: ImageIcon(AssetImage('assets/icons/home.png')),
             ),
             label: 'Inicio',
           ),
           BottomNavigationBarItem(
             icon: Padding(
               padding: EdgeInsets.all(5.0),
               child: ImageIcon(AssetImage('assets/icons/pool.png')),
             ),
             label: 'Pool',
           ),
           BottomNavigationBarItem(
             icon: Padding(
               padding: EdgeInsets.all(5.0),
               child: ImageIcon(AssetImage('assets/icons/wallet.png')),
             ),
             label: 'Billetera',
           ),
         ]),
      ),
    );


  }

}