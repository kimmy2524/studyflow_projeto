import 'package:flutter/material.dart';

class DetalheMateriaScreen extends StatefulWidget {
  final String materiaTitle;
  final String subtitle;
  final Color color;
  final IconData icon;
  final double progress;

  const DetalheMateriaScreen({
    super.key,
    required this.materiaTitle,
    this.subtitle = '4 Atividades · 1 prova',
    this.color = const Color(0xFF6A1B9A),
    this.icon = Icons.storage,
    this.progress = 0.5,
  });

  @override
  State<DetalheMateriaScreen> createState() => _DetalheMateriaScreenState();
}

class _DetalheMateriaScreenState extends State<DetalheMateriaScreen> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, color: Colors.black, size: 30),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(color: widget.color, borderRadius: BorderRadius.circular(14)),
                  child: Icon(widget.icon, color: Colors.white, size: 30),
                ),
                const SizedBox(width: 14),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.materiaTitle, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Text(widget.subtitle, style: const TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Progresso da matéria', style: TextStyle(fontWeight: FontWeight.w600)),
                Text('${(widget.progress * 100).toInt()}%', style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: widget.progress,
                minHeight: 8,
                backgroundColor: Colors.grey.shade200,
                color: const Color(0xFF6A1B9A),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                _buildPillTab('Atividades', 0),
                const SizedBox(width: 8),
                _buildPillTab('Provas', 1),
                const SizedBox(width: 8),
                _buildPillTab('Materiais', 2),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _selectedTab == 1
                  ? _buildProvasView()
                  : ListView(
                      children: const [
                        _AtividadeCard(titulo: 'Lista 1 - Exercícios', subtitulo: 'Entregue em 05/09', concluida: true),
                        _AtividadeCard(titulo: 'Lista 2 - Exercícios', subtitulo: 'Pendente', concluida: false),
                        _AtividadeCard(titulo: 'Trabalho em grupo', subtitulo: 'Entregue em 10/09', concluida: false),
                        _AtividadeCard(titulo: 'Prova 1', subtitulo: '20/09 · 14:00', concluida: true, isProva: true),
                      ],
                    ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6A1B9A),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                  ),
                  onPressed: () {},
                  child: const Text('Adicionar atividade', style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPillTab(String label, int index) {
    final active = _selectedTab == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedTab = index),
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
              color: active ? Colors.white : Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProvasView() {
    return ListView(
      children: const [
        _ProvaCard(
          materia: 'Estrutura de Dados',
          data: '21/09 · 14:00',
          conteudo: 'Listas, Pilhas e Filas, Merge Sort',
          cor: Color(0xFF6A1B9A),
          icone: Icons.storage,
        ),
        _ProvaCard(
          materia: 'Banco de Dados',
          data: '05/10 · 10:00',
          conteudo: 'SQL, Normalização',
          cor: Color(0xFF2196F3),
          icone: Icons.dns,
        ),
        _ProvaCard(
          materia: 'Programação',
          data: '18/10 · 16:30',
          conteudo: 'POO, Estrutura de Repetição',
          cor: Color(0xFF2E7D32),
          icone: Icons.code,
        ),
      ],
    );
  }
}

class _AtividadeCard extends StatelessWidget {
  final String titulo;
  final String subtitulo;
  final bool concluida;
  final bool isProva;

  const _AtividadeCard({
    required this.titulo,
    required this.subtitulo,
    required this.concluida,
    this.isProva = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(isProva ? Icons.assignment_outlined : Icons.description_outlined, color: Colors.grey),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(titulo, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(subtitulo, style: const TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ),
          Icon(
            concluida ? Icons.check_circle_outline : Icons.radio_button_unchecked,
            color: concluida ? Colors.green : Colors.grey,
            size: 28,
          ),
        ],
      ),
    );
  }
}

class _ProvaCard extends StatelessWidget {
  final String materia;
  final String data;
  final String conteudo;
  final Color cor;
  final IconData icone;

  const _ProvaCard({
    required this.materia,
    required this.data,
    required this.conteudo,
    required this.cor,
    required this.icone,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: cor, borderRadius: BorderRadius.circular(12)),
                child: Icon(icone, color: Colors.white),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(materia, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text(data, style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text('Conteúdo: $conteudo', style: const TextStyle(fontSize: 13)),
        ],
      ),
    );
  }
}