import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/splash_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.people_alt_rounded,
                  color: Colors.white,
                  size: 45,
                ),

                SizedBox(height: 10),

                Text(
                  'People',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  'Cadastro de pessoas',
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),

          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Início'),
            onTap: () {
              Navigator.pop(context);

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => const HomeScreen(),
                ),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.animation),
            title: const Text('Splash'),
            onTap: () {
              Navigator.pop(context);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const SplashScreen(),
                ),
              );
            },
          ),

          const Divider(),

          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Sair'),
            onTap: () {
              Navigator.of(context).pop();

              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Sair do aplicativo'),
                    content: const Text(
                      'Deseja realmente sair do aplicativo?',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancelar'),
                      ),
                      FilledButton(
                        onPressed: () {
                          // No emulador/dispositivo podemos encerrar o app.
                          // Implementaremos isso na etapa final.
                          Navigator.pop(context);
                        },
                        child: const Text('Sair'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}