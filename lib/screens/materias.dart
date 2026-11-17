import 'package:flutter/material.dart';
import 'detalhe_materia.dart';

class MateriasScreen extends StatelessWidget {
  const MateriasScreen({super.key});

  final List<Map<String, dynamic>> materias = const [
    {'title': 'Estrutura de Dados', 'subtitle': '4 Atividades · 1 prova', 'color': Color(0xFF6A1B9A), 'icon': Icons.storage, 'progress': 0.5},
    {'title': 'Banco de Dados', 'subtitle': '2 Atividades · 2 provas', 'color': Color(0xFF2196F3), 'icon': Icons.dns, 'progress': 0.4},
    {'title': 'Programação', 'subtitle': '3 Atividades · 1 prova', 'color': Color(0xFF2E7D32), 'icon': Icons.code, 'progress': 0.8},
    {'title': 'Engenharia de Software', 'subtitle': '1 Atividade · 1 prova', 'color': Color(0xFFEF6C00), 'icon': Icons.engineering, 'progress': 0.8},
    {'title': 'Sistemas Operacionais', 'subtitle': '0 Atividades · 0 prova', 'color': Color(0xFFE91E63), 'icon': Icons.memory, 'progress': 1.0},
    {'title': 'Redes de Computadores', 'subtitle': '0 Atividades · 0 prova', 'color': Color(0xFF00ACC1), 'icon': Icons.hub, 'progress': 1.0},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Minhas matérias', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  CircleAvatar(
                    backgroundColor: const Color(0xFF6A1B9A),
                    child: IconButton(
                      icon: const Icon(Icons.add, color: Colors.white),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Buscar matéria...',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: const Color(0xFFF3F4F6),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: materias.length,
                  itemBuilder: (context, index) {
                    final item = materias[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                        leading: Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: item['color'],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(item['icon'], color: Colors.white, size: 28),
                        ),
                        title: Text(item['title'], style: const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(item['subtitle'], style: const TextStyle(color: Colors.grey)),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => DetalheMateriaScreen(
                                materiaTitle: item['title'],
                                subtitle: item['subtitle'],
                                color: item['color'],
                                icon: item['icon'],
                                progress: item['progress'],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}