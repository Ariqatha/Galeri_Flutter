import 'package:flutter/material.dart';

class Headset extends StatefulWidget {
  const Headset({super.key});

  @override
  _HeadsetState createState() => _HeadsetState();
}

class _HeadsetState extends State<Headset> {
  final List<Map<String, String>> _headsetData = [
    {'title': 'Praktikum 1', 'date': '9 September 2024'},
    {'title': 'Praktikum 2', 'date': '10 September 2024'},
    {'title': 'Praktikum 3', 'date': '11 September 2024'},
  ];

  void _addNewHeadset(String title, String date) {
    setState(() {
      _headsetData.add({'title': title, 'date': date});
    });
    Navigator.of(context).pop(); // Close the dialog
  }

  void _showAddHeadsetDialog() {
    final titleController = TextEditingController();
    final dateController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Tambah Informasi'),
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
                _addNewHeadset(titleController.text, dateController.text);
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

  void _deleteHeadset(int index) {
    setState(() {
      _headsetData.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 213, 214, 231),
        title: const Text('Informasi'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _showAddHeadsetDialog, // Show dialog to add new information
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF93B8D8), Colors.white], // Custom gradient colors
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: _headsetData.length,
          itemBuilder: (context, index) {
            final item = _headsetData[index];
            return _buildHeadsetCard(item['title']!, item['date']!, index);
          },
        ),
      ),
    );
  }

  Widget _buildHeadsetCard(String title, String description, int index) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 8, // Increased shadow for more depth
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // More rounded corners
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 22.0, // Increased font size for title
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent, // Using a standout color for title
          ),
        ),
        subtitle: Text(
          description,
          style: const TextStyle(
            color: Colors.black54, // Softer color for subtitle
            fontSize: 16.0,
          ),
        ),
        leading: const Icon(Icons.info, size: 40.0, color: Colors.blue),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () => _deleteHeadset(index), // Delete action
        ),
      ),
    );
  }
}
