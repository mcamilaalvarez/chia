import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:prueba_chia/CommonWidgets/BottomBar.dart';
import 'package:prueba_chia/CommonWidgets/common_text.dart';
import 'package:prueba_chia/CommonWidgets/common_text_field.dart';

import 'CommonWidgets/menu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: const Color(0xff0B1C28),
        primaryColor: const Color(0xff789D9E),
        cardColor: const Color(0xff112B38),
        buttonColor: const Color(0xff7AC231),
        scrollbarTheme: ScrollbarThemeData().copyWith(
          thumbColor: MaterialStateProperty.all( Color(0xff7AC231))
        )
      ),
      home: MyHomePage()
    );
  }
}
class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {

  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: const Color(0xff0B1C28),
      appBar: AppBar(
          backgroundColor: const Color(0xff0B1C28),
          leading: Padding(
            padding: const EdgeInsets.all(5.0),
            child: IconButton(
              icon: const ImageIcon(AssetImage('assets/icons/user.png'),
                  color: Color(0xff7AC231)),
              onPressed: () {},
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/logochia.png',
                fit: BoxFit.contain,
                height: 35,
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: IconButton(
                icon: const ImageIcon(
                    AssetImage('assets/icons/notification.png'),
                    color: Color(0xff789D9E)),
                onPressed: () {},
              ),
            )
          ]),
      body: Container(
        width: double.infinity,
        height: queryData.size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
              alignment: Alignment.topCenter,
              image: AssetImage(
                'assets/images/fondo.png',
              ),
              fit:  BoxFit.fitHeight,
              opacity: 0.1,
            )),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Perfil',
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 28,
                ),
                Container(
                  height: 64,
                  width: 64,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xff0B1C28),
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/icons/userphoto.png',
                      ),
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                const Text(
                  'Fernando Polo',
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 6,
                ),
                const Text(
                  'ID: 33556',
                  style: TextStyle(fontSize: 14, color: Color(0xff7AC231)),
                ),
                menuD(
                  name: 'Info Personal',
                  icon: const AssetImage('assets/icons/user.png'),
                  contentTile: Column(
                    children: const [
                      commonTextField(text: 'Usuario', type: 'text'),
                      commonTextField(
                          text: 'Correo electrónico', type: 'text'),
                      commonTextField(
                          text: 'Número de telefono', type: 'phoneNumber'),
                      commonTextField(
                          text: 'Fecha de nacimiento', type: 'date'),
                      commonTextField(text: 'País', type: 'country'),
                      commonTextField(text: 'Idioma', type: 'language'),
                    ],
                  ),
                ),
                menuD(
                  name: 'Seguridad',
                  icon: const AssetImage('assets/icons/security.png'),
                  contentTile: Column(
                    children: const [
                      commonTextField(text: 'Contraseña', type: 'password'),
                      commonTextField(text: 'Dispositivos', type: 'devices'),
                      commonTextField(
                          text: 'Autenticación por email', type: 'select'),
                      commonTextField(
                          text: 'Autenticación por teléfono', type: 'select'),
                      commonTextField(text: 'Touch', type: 'select'),
                      commonTextField(
                          text: 'Mostrar contenido sensible', type: 'select'),
                    ],
                  ),
                ),
                menuD(
                  name: 'Políticas T&C',
                  icon: const AssetImage('assets/icons/info.png'),
                  contentTile: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff0B1C28),
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: const Color(0xff789D9E)),
                    ),
                    child:  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 200,
                        child: const SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                            style: TextStyle(color: Color(0xff789D9E)),),
                        ),
                      ),
                    ),
                  ),
                ),
                const CommonText(text: 'Deja tu opinión'),
                const SizedBox(height: 10,),
                const CommonText(text: 'Reportar un error'),
                const SizedBox(height: 10,),
                TextButton(onPressed: () {}, child: Row(
                  children: const [
                    ImageIcon(AssetImage('assets/icons/cerrarsesion.png'),
                      color: Colors.white,),
                    Text('Cerrar sesión',
                      style: TextStyle(color: Colors.white),)
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}