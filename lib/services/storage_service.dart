import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/pessoa.dart';

class StorageService {
  static const String chave = 'pessoas';

  static Future<void> salvarPessoa(Pessoa pessoa) async {
    final prefs = await SharedPreferences.getInstance();

    final pessoas = await carregarPessoas();

    pessoas.add(pessoa);

    final listaJson = pessoas
        .map((pessoa) => jsonEncode(pessoa.toMap()))
        .toList();

    await prefs.setStringList(chave, listaJson);
  }

  static Future<List<Pessoa>> carregarPessoas() async {
    final prefs = await SharedPreferences.getInstance();

    final listaJson = prefs.getStringList(chave) ?? [];

    return listaJson.map((item) {
      return Pessoa.fromMap(jsonDecode(item));
    }).toList();
  }
}