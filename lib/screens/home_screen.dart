import 'package:flutter/material.dart';
import '../models/pessoa.dart';
import '../services/storage_service.dart';
import '../widgets/app_drawer.dart';
import '../widgets/pessoa_card.dart';
import 'cadastro_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Pessoa> pessoas = [];

  @override
  void initState() {
    super.initState();
    carregarPessoas();
  }

  Future<void> carregarPessoas() async {
    final lista = await StorageService.carregarPessoas();

    setState(() {
      pessoas = lista;
    });
  }

  Future<void> abrirCadastro() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const CadastroScreen(),
      ),
    );

    carregarPessoas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pessoas',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      drawer: const AppDrawer(),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: pessoas.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.people_outline,
                      size: 80,
                      color: Colors.grey.shade400,
                    ),

                    const SizedBox(height: 20),

                    Text(
                      'Nenhuma pessoa cadastrada',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade700,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      'Toque no botão + para adicionar uma pessoa.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              )
            : ListView.builder(
                itemCount: pessoas.length,
                itemBuilder: (context, index) {
                  return PessoaCard(
                    pessoa: pessoas[index],
                  );
                },
              ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: abrirCadastro,
        child: const Icon(Icons.add),
      ),
    );
  }
}