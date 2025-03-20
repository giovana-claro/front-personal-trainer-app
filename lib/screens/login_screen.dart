import 'package:flutter/material.dart';
import 'package:flutter_application/screens/aluno/aluno_home_page.dart';
import 'package:flutter_application/screens/personal/personal_home_page.dart';
import 'package:flutter_application/screens/signup_screen.dart';
import 'package:flutter_application/utils/auth_service.dart';
import 'package:flutter_application/utils/text_field_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  final AuthService authService = AuthService();

  void login() async {
    setState(() {
      isLoading = true;
    });

    String? result = await authService.login(
      email: emailController.text,
      password: passwordController.text,
    );

    setState(() {
      isLoading = false;
    });

    if (result == "Personal") {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const PersonalHomePage()),
        (route) => false,
      );
    } else if (result == "Aluno") {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const AlunoHomePage()),
        (route) => false,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Falha ao realizar o login: $result")),
      );  
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 190, 243, 237),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoginTextField(controller: emailController, labelText: "Email"),
              const SizedBox(height: 15),
              LoginTextField(
                controller: passwordController,
                labelText: "Senha",
                obscureText: true,
              ),
              const SizedBox(height: 15),
              isLoading
                  ? const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Color.fromARGB(255, 7, 90, 80),
                      ),
                    ),
                  )
                  : SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 7, 90, 80),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            5,
                          ), // Sem bordas arredondadas
                        ),
                      ),
                      child: const Text(
                        "Entrar",
                        style: TextStyle(
                          color: Color.fromARGB(255, 190, 243, 237),
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Ainda não tem uma conta? ",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => SignupScreen()),
                      );
                    },
                    child: Text(
                      "Cadastre-se aqui",
                      style: TextStyle(
                        color: Color.fromARGB(255, 7, 90, 80),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
