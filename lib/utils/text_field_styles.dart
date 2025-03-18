// Widget Customizado para TextField
import 'package:flutter/material.dart';

class LoginTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;

  const LoginTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.obscureText = false,
  });

  @override
  // ignore: library_private_types_in_public_api
  _LoginTextFieldState createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {

  bool isPasswordHidden = false; // Valor inicial

  @override
  void initState() {
    super.initState();

    // Definir isPasswordHidden como true caso o widget.controller não seja nulo
    if (widget.obscureText) {
      setState(() {
        isPasswordHidden = true; // Como você pediu, pode definir como `true` aqui
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: isPasswordHidden,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: TextStyle(color: Color.fromARGB(255, 7, 90, 80)),
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 7, 90, 80),
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 18, 177, 177),
            width: 2.0,
          ),
        ),
        // Alterando a cor do rótulo conforme o foco
        focusColor: Color.fromARGB(255, 18, 177, 177),
        suffixIcon:
            widget.obscureText
                ? IconButton(
                  onPressed: () {
                    setState(() {
                      isPasswordHidden = !isPasswordHidden;
                    });
                  },
                  icon: Icon(
                    isPasswordHidden ? Icons.visibility_off : Icons.visibility,
                  ),
                )
                : null,
      ),
    );
  }
}
