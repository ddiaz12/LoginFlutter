// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class Formulario2 extends StatelessWidget {
  final String login;
  final String password;

  Formulario2({super.key, required this.login, required this.password});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Login: $login', style: TextStyle(fontSize: 18)),
            Text('Password: $password', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Aquí puedes agregar la lógica de validación de usuario.
                bool usuarioValido =
                    true; // Cambia esto según tu lógica de validación.
                if (usuarioValido) {
                  Navigator.pop(context, 'Usuario Válido');
                }
              },
              child: Text('Salir', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
