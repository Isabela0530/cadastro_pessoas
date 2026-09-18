import 'package:flutter/material.dart';
import '../models/pessoa.dart';

class PessoaCard extends StatelessWidget {
  final Pessoa pessoa;

  const PessoaCard({
    super.key,
    required this.pessoa,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor:
                  Theme.of(context).colorScheme.primaryContainer,
              child: Icon(
                Icons.person,
                size: 30,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pessoa.nome,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    '${pessoa.rua}, ${pessoa.numero}',
                    style: TextStyle(
                      color: Colors.grey.shade700,
                    ),
                  ),

                  const SizedBox(height: 3),

                  Text(
                    '${pessoa.cidade} - ${pessoa.estado}',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}