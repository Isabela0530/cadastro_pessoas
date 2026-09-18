import 'package:flutter/material.dart';
import '../services/storage_service.dart';
import '../models/pessoa.dart';


class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final nomeController = TextEditingController();
  final cepController = TextEditingController();
  final ruaController = TextEditingController();
  final bairroController = TextEditingController();
  final cidadeController = TextEditingController();
  final estadoController = TextEditingController();
  final numeroController = TextEditingController();
  final complementoController = TextEditingController();

  Future<void> salvarCadastro() async {
  final pessoa = Pessoa(
    nome: nomeController.text,
    cep: cepController.text,
    rua: ruaController.text,
    bairro: bairroController.text,
    cidade: cidadeController.text,
    estado: estadoController.text,
    numero: numeroController.text,
    complemento: complementoController.text,
  );

  await StorageService.salvarPessoa(pessoa);

  if (!mounted) return;

  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Cadastro salvo com sucesso!'),
    ),
  );

  Navigator.pop(context);
}

  @override
  void dispose() {
    nomeController.dispose();
    cepController.dispose();
    ruaController.dispose();
    bairroController.dispose();
    cidadeController.dispose();
    estadoController.dispose();
    numeroController.dispose();
    complementoController.dispose();

    super.dispose();
  }

  Widget campo({
    required String label,
    required TextEditingController controller,
    TextInputType? keyboardType,
    bool readOnly = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        readOnly: readOnly,
        decoration: InputDecoration(
          labelText: label,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Novo cadastro',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            campo(
              label: 'Nome',
              controller: nomeController,
            ),

            campo(
              label: 'CEP',
              controller: cepController,
              keyboardType: TextInputType.number,
            ),

            TextFormField(
              controller: ruaController,
              decoration: const InputDecoration(
              labelText: 'Rua',
              ),
            ),

            TextFormField(
              controller: bairroController,
              decoration: const InputDecoration(
              labelText: 'Bairro',
              ),
            ),

            TextFormField(
              controller: cidadeController,
              decoration: const InputDecoration(
              labelText: 'Cidade',
              ),
            ),

            TextFormField(
              controller: estadoController,
              decoration: const InputDecoration(
              labelText: 'Estado',
              ),
            ),

            campo(
              label: 'Número',
              controller: numeroController,
              keyboardType: TextInputType.number,
            ),

            campo(
              label: 'Complemento',
              controller: complementoController,
            ),

            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: FilledButton.icon(
                onPressed: salvarCadastro,
                icon: const Icon(Icons.save),
                label: const Text(
                  'Salvar cadastro',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}