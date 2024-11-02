import 'package:flutter/material.dart';

class Smartphone extends StatefulWidget {
  const Smartphone({super.key});

  @override
  _SmartphoneState createState() => _SmartphoneState();
}

class _SmartphoneState extends State<Smartphone> {
  final List<String> _images = [
    'assets/img/pinokio.jpeg', // Path gambar yang ada
    'assets/img/SMKN.jpeg',     // Path gambar yang ada
  ];

  void _addImage(String path) {
    setState(() {
      _images.add(path);
    });
  }

  void _deleteImage(int index) {
    setState(() {
      _images.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 213, 214, 231),
        title: const Text('Gallery'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addImage('assets/img/new_image.jpeg'); // Menambahkan gambar baru
        },
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/background.jpeg'), // Path gambar latar belakang
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: _images.isEmpty
              ? const Text(
                  'No images to display.',
                  style: TextStyle(color: Colors.white),
                )
              : GridView.builder(
                  padding: const EdgeInsets.all(20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemCount: _images.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              _images[index],
                              width: 300,
                              height: 300,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 8,
                          top: 8,
                          child: IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () => _deleteImage(index),
                          ),
                        ),
                      ],
                    );
                  },
                ),
        ),
      ),
    );
  }
}
