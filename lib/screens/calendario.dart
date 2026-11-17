import 'package:flutter/material.dart';

class CalendarioScreen extends StatelessWidget {
  const CalendarioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const diasSemana = ['D', 'S', 'T', 'Q', 'Q', 'S', 'S'];
    const diasMes = [
      '', '', '1', '2', '3', '4', '5',
      '6', '7', '8', '9', '10', '11', '12',
      '13', '14', '15', '16', '17', '18', '19',
      '20', '21', '22', '23', '24', '25', '26',
      '27', '28', '29', '30', '', '', '',
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20.0),
          children: [
            const Text('Calendário', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('SETEMBRO 2026', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Icon(Icons.chevron_right),
              ],
            ),
            const SizedBox(height: 12),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 42,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7),
              itemBuilder: (context, index) {
                if (index < 7) {
                  return Center(child: Text(diasSemana[index], style: const TextStyle(color: Colors.grey)));
                }
                final dia = diasMes[index - 7];
                Color? bg;
                if (dia == '4' || dia == '7' || dia == '21') bg = const Color(0xFFF8BBD0);
                if (dia == '17' || dia == '20') bg = const Color(0xFFBBDEFB);

                return Center(
                  child: Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(color: bg, shape: BoxShape.circle),
                    alignment: Alignment.center,
                    child: Text(dia, style: const TextStyle(fontWeight: FontWeight.w600)),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            const Text('Hoje, 17 de Setembro', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 10),
            const _EventoCard(titulo: 'Trabalho de Programação', hora: '19:40'),
            const _EventoCard(titulo: 'Reunião de grupo', hora: '20:55'),
            const SizedBox(height: 16),
            const Text('Amanhã, 21 de Setembro', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 10),
            const _EventoCard(titulo: 'Prova Estrutura de Dados', hora: '14:00'),
          ],
        ),
      ),
    );
  }
}

class _EventoCard extends StatelessWidget {
  final String titulo;
  final String hora;
  const _EventoCard({required this.titulo, required this.hora});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          const Icon(Icons.access_time, color: Color(0xFF6A1B9A)),
          const SizedBox(width: 12),
          Expanded(child: Text(titulo, style: const TextStyle(fontWeight: FontWeight.w500))),
          Text(hora, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}