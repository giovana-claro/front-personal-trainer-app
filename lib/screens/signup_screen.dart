import 'package:flutter/material.dart';
import 'package:flutter_application/screens/login_screen.dart';
import 'package:flutter_application/utils/auth_service.dart';
import 'package:flutter_application/utils/text_field_styles.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isLoading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  String selectedRole = "Aluno"; // Default selected role for signup

  final AuthService authService = AuthService();

  void signup() async {

    bool verification = authService.verifyPassword(
      password: passwordController.text,
      confirmPassword: confirmPasswordController.text,
    );

    if (verification == false) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("As senhas informadas precisam ser iguais.")),
      );
      return null;
    }

    setState(() {
      isLoading = true;
    });

    String? result = await authService.signup(
      email: emailController.text,
      password: passwordController.text,
      role: selectedRole,
    );

    setState(() {
      isLoading = false;
    });

    if (result == null) {
      // signup successfull: Navigate to Login screen
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Cadastro realizado com sucesso! Faça seu login."),
        ),
      );
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (_) => LoginScreen()),
      );
    } else {
      // signup failed: Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Falha ao realizar o cadastro: $result")),
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
              DropdownButtonFormField(
                value: selectedRole,
                decoration: InputDecoration(
                  labelText: "Tipo de cadastro",
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
                ),
                items:
                    ["Personal", "Aluno"].map((role) {
                      return DropdownMenuItem(value: role, child: Text(role));
                    }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedRole = newValue!;
                  });
                },
              ),
              const SizedBox(height: 15),
              LoginTextField(controller: emailController, labelText: "Email"),
              const SizedBox(height: 15),
              LoginTextField(
                controller: passwordController,
                labelText: "Senha",
                obscureText: true,
              ),
              const SizedBox(height: 15),
              LoginTextField(
                controller: confirmPasswordController,
                labelText: "Confirmar senha",
                obscureText: true,
              ),
              const SizedBox(height: 15),
              isLoading
                  ? const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 7, 90, 80)),
                    ),
                  )
                  : SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: signup,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 7, 90, 80),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            5,
                          ), // Sem bordas arredondadas
                        ),
                      ),
                      child: const Text(
                        "Cadastrar",
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
                    "Já possui uma conta? ",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => LoginScreen()),
                      );
                    },
                    child: Text(
                      "Entre aqui",
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
