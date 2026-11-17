import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20.0),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Olá, Eugênio! 👋', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    Text('Que bom te ver por aqui!', style: TextStyle(color: Colors.grey)),
                  ],
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none, size: 28)),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFF6A1B9A),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Próximas tarefas', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                      Text('Ver todas >', style: TextStyle(color: Colors.white70, fontSize: 13)),
                    ],
                  ),
                  SizedBox(height: 14),
                  _TarefaResumoItem(titulo: 'Trabalho de Programação', data: 'Hoje · 20:00'),
                  SizedBox(height: 10),
                  _TarefaResumoItem(titulo: 'Estudar banco de dados', data: 'Amanhã · 14:00'),
                  SizedBox(height: 10),
                  _TarefaResumoItem(titulo: 'Leitura de Estrutura de Dados', data: '19/09 · 19:00'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 140,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F5F7),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Próximas provas', style: TextStyle(fontWeight: FontWeight.w600)),
                        Text('2', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF6A1B9A))),
                        Text('nos próximos 30 dias', style: TextStyle(fontSize: 12, color: Colors.grey)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    height: 140,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F5F7),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Progresso geral', style: TextStyle(fontWeight: FontWeight.w600)),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: 72,
                              height: 72,
                              child: CircularProgressIndicator(
                                value: 0.68,
                                strokeWidth: 7,
                                backgroundColor: Colors.grey.shade300,
                                color: const Color(0xFF6A1B9A),
                              ),
                            ),
                            const Text('68%', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text('Minhas matérias', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _MateriaMiniCard(
                    titulo: 'Estrutura de Dados',
                    subtitulo: '3 atividades',
                    corFundo: const Color(0xFFE8F5E9),
                    corIcone: const Color(0xFF6A1B9A),
                    icone: Icons.storage,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: _MateriaMiniCard(
                    titulo: 'Banco de Dados',
                    subtitulo: '2 atividades',
                    corFundo: const Color(0xFFE3F2FD),
                    corIcone: Colors.blue,
                    icone: Icons.dns,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _TarefaResumoItem extends StatelessWidget {
  final String titulo;
  final String data;
  const _TarefaResumoItem({required this.titulo, required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.radio_button_unchecked, color: Colors.white, size: 20),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(titulo, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
            Text(data, style: const TextStyle(color: Colors.white70, fontSize: 12)),
          ],
        ),
      ],
    );
  }
}

class _MateriaMiniCard extends StatelessWidget {
  final String titulo;
  final String subtitulo;
  final Color corFundo;
  final Color corIcone;
  final IconData icone;

  const _MateriaMiniCard({
    required this.titulo,
    required this.subtitulo,
    required this.corFundo,
    required this.corIcone,
    required this.icone,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: corFundo, borderRadius: BorderRadius.circular(18)),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: corIcone, borderRadius: BorderRadius.circular(12)),
            child: Icon(icone, color: Colors.white),
          ),
          const SizedBox(height: 10),
          Text(titulo, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13), textAlign: TextAlign.center),
          Text(subtitulo, style: const TextStyle(color: Colors.black54, fontSize: 12)),
        ],
      ),
    );
  }
}