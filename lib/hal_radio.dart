import 'package:flutter/material.dart';

class AgendaScreen extends StatefulWidget {
  @override
  _AgendaScreenState createState() => _AgendaScreenState();
}

class _AgendaScreenState extends State<AgendaScreen> {
  // List of agenda items to display
  final List<Map<String, String>> agendas = [
    {'title': 'Ujian Pemograman', 'date': '9 September 2024'},
    {'title': 'Ujian Web Design', 'date': '10 September 2024'},
    {'title': 'Ujian Database', 'date': '11 September 2024'},
  ];

  void _addNewAgenda(String title, String date) {
    setState(() {
      agendas.add({'title': title, 'date': date});
    });
    Navigator.of(context).pop(); // Close the dialog
  }

  void _showAddAgendaDialog() {
    final titleController = TextEditingController();
    final dateController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Tambah Agenda'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Judul'),
              ),
              TextField(
                controller: dateController,
                decoration: const InputDecoration(labelText: 'Tanggal'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (titleController.text.isNotEmpty && dateController.text.isNotEmpty) {
                  _addNewAgenda(titleController.text, dateController.text);
                }
              },
              child: const Text('Tambah'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Batal'),
            ),
          ],
        );
      },
    );
  }

  void _deleteAgenda(int index) {
    setState(() {
      agendas.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 213, 214, 231),
        title: const Text('Agenda'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _showAddAgendaDialog, // Show dialog to add new agenda
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent.shade100, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: agendas.length,
          itemBuilder: (context, index) {
            final agenda = agendas[index];
            return _buildAgendaCard(agenda['title']!, agenda['date']!, index);
          },
        ),
      ),
    );
  }

  Widget _buildAgendaCard(String title, String date, int index) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 5, // Shadow effect for depth
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Rounded corners
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 17, 18, 18), // Highlighted title color
          ),
        ),
        subtitle: Text(
          date,
          style: const TextStyle(
            fontSize: 16.0,
            color: Colors.grey, // Subtitle color
          ),
        ),
        leading: const Icon(Icons.event, size: 40.0, color: Colors.blue),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () => _deleteAgenda(index), // Delete action
        ),
      ),
    );
  }
}
