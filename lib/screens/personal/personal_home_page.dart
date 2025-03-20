import 'package:flutter/material.dart';

class PersonalHomePage extends StatefulWidget {
  const PersonalHomePage({super.key});

  @override
  State<PersonalHomePage> createState() => _PersonalHomePageState();
}

class _PersonalHomePageState extends State<PersonalHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Personal Home Page"),
        backgroundColor: const Color.fromARGB(255, 50, 179, 184),
      ),
      body: Column(
        children: [
          // TODO: Inserir alguma estatistica ou desenho
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 150,
            )
          ),
          // Retângulo rolável com várias informações
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white, // Cor de fundo branca
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Color.fromARGB(255, 114, 180, 182), // Cor da borda
                    width: 2, // Largura da borda
                  ),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Informações 1",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Aqui você pode colocar várias informações.",
                        style: TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 16), // Espaço maior entre os itens
                      Text(
                        "Informações 2",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Detalhes adicionais sobre as informações podem ser colocados aqui.",
                        style: TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 16), // Espaço maior entre os itens
                      Text(
                        "Informações 3",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Mais informações que você gostaria de exibir aqui.",
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Botão "Cadastrar Aluno"
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // TODO: Colocar funcao de cadastrar aluno
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 50, 179, 184),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Cadastrar Novo Aluno",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // Barra de navegação na parte inferior
          BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.fitness_center),
                label: 'Halter',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Perfil',
              ),
            ],
            onTap: (index) {
              // TODO: Implementar logica de navegação entre itens
            },
            currentIndex: 0, // Para selecionar o ícone inicial
            selectedItemColor: Color.fromARGB(255, 50, 179, 184),
            unselectedItemColor: Colors.grey,
          ),
        ],
      ),
    );
  }
}
