// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'formulario2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi App',
      theme: ThemeData(
        hintColor: Colors.orange, // Color de fondo
        appBarTheme: AppBarTheme(
          backgroundColor:
              Colors.blueGrey, // Color de fondo de la barra de navegación
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple, // Color del botón
          ),
        ),
        dialogTheme: DialogTheme(
          backgroundColor: Colors.white, // Color de fondo del diálogo
        ),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(background: Colors.white),
      ),
      home: Formulario1(),
    );
  }
}

class Formulario1 extends StatelessWidget {
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Valores predefinidos
  final String usuarioValido = '123';
  final String contrasenaValida = '123';

  Formulario1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario 1'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        color: Theme.of(context).colorScheme.background,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/logo.png', // Ruta de la imagen (ajusta a tu proyecto)
              height: 100, // Ajusta el tamaño de la imagen
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: loginController,
              decoration: InputDecoration(
                labelText: 'Login',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final loginIngresado = loginController.text;
                final contrasenaIngresada = passwordController.text;

                if (loginIngresado == usuarioValido &&
                    contrasenaIngresada == contrasenaValida) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Formulario2(
                        login: 'usuarioValido',
                        password: 'contrasenaValida',
                      ),
                    ),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Usuario no válido'),
                        backgroundColor:
                            Colors.red, // Color de fondo del diálogo
                        contentTextStyle:
                            TextStyle(color: Colors.white), // Color del texto
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Cerrar'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Validar Usuario'),
            ),
          ],
        ),
      ),
    );
  }
}
