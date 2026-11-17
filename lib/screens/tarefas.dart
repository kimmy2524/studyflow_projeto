import 'package:flutter/material.dart';

class TarefasScreen extends StatefulWidget {
  const TarefasScreen({super.key});

  @override
  State<TarefasScreen> createState() => _TarefasScreenState();
}

class _TarefasScreenState extends State<TarefasScreen> {
  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF6A1B9A),
        shape: const CircleBorder(),
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Tarefas', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              Row(
                children: [
                  _buildFilterPill('Pendentes', 0),
                  const SizedBox(width: 8),
                  _buildFilterPill('Em andamento', 1),
                  const SizedBox(width: 8),
                  _buildFilterPill('Concluídas', 2),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: _tabIndex == 0
                    ? ListView(
                        children: const [
                          _TarefaRow(titulo: 'Trabalho de Programação', data: 'Hoje · 20:00', tag: 'Trabalho', corTag: Color(0xFF6A1B9A)),
                          _TarefaRow(titulo: 'Estudar Banco de Dados', data: 'Amanhã · 14:00', tag: 'Estudo', corTag: Color(0xFF2E7D32)),
                          _TarefaRow(titulo: 'Leitura de Estrutura de Dados', data: '19/10 · 19:00', tag: 'Leitura', corTag: Color(0xFF2196F3)),
                          _TarefaRow(titulo: 'Listas de Exercícios - BD', data: '20/10 · 20:00', tag: 'Exercícios', corTag: Color(0xFFE91E63)),
                          _TarefaRow(titulo: 'Projeto Final', data: '22/10 · 19:00', tag: 'Projeto', corTag: Color(0xFFEF6C00)),
                        ],
                      )
                    : Center(
                        child: Text(_tabIndex == 1 ? 'Nenhuma tarefa em andamento' : 'Nenhuma tarefa concluída'),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterPill(String label, int index) {
    final active = _tabIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _tabIndex = index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: active ? const Color(0xFF6A1B9A) : const Color(0xFFF3F4F6),
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: active ? Colors.white : Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

class _TarefaRow extends StatelessWidget {
  final String titulo;
  final String data;
  final String tag;
  final Color corTag;

  const _TarefaRow({
    required this.titulo,
    required this.data,
    required this.tag,
    required this.corTag,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        children: [
          const Icon(Icons.radio_button_unchecked, color: Colors.grey),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(titulo, style: const TextStyle(fontWeight: FontWeight.w600)),
                Text(data, style: const TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: corTag.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(tag, style: TextStyle(color: corTag, fontWeight: FontWeight.bold, fontSize: 12)),
          ),
        ],
      ),
    );
  }
}