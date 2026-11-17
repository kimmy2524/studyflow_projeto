import 'package:flutter/material.dart';


export 'screens/login.dart';
export 'screens/main_navigation.dart';
export 'screens/home.dart';
export 'screens/materias.dart';
export 'screens/detalhe_materia.dart';
export 'screens/tarefas.dart';
export 'screens/calendario.dart';
export 'screens/cadastro.dart';
export 'screens/mais.dart';

import 'screens/login.dart';
import 'screens/main_navigation.dart';

void main() {
  runApp(const StudyFlowApp());
}

class StudyFlowApp extends StatelessWidget {
  const StudyFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StudyFlow',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: const Color(0xFFFAFAFA),
        fontFamily: 'Roboto',
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/main': (context) => const MainNavigationScreen(),
      },
    );
  }
}