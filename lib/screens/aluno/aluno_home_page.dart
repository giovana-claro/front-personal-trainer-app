import 'package:flutter/material.dart';

class AlunoHomePage extends StatefulWidget {
  const AlunoHomePage({super.key});

  @override
  State<AlunoHomePage> createState() => _AlunoHomePageState();
}

class _AlunoHomePageState extends State<AlunoHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Define o fundo branco
      appBar: AppBar(
        title: const Text("Aluno Home Page"),
        backgroundColor: Colors.deepPurpleAccent, // Cor opcional para a AppBar
      ),
      body: const Center(
        child: Text(
          "Aluno Home Page",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}