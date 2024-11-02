import 'package:flutter/material.dart';
import './hal_komputer.dart' as komputer;
import './hal_radio.dart' as radio;
import './hal_headset.dart' as headset;
import './hal_smartphone.dart' as hp;
import './login_screen.dart'; // Import the login screen

void main() {
  runApp(
    MaterialApp(
      title: "Tab Bar",
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const Home(),
      },
    ),
  );
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = TabController(vsync: this, length: 4);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 213, 231, 218),
        title: const Text('Empat Mobile Apps'),
        centerTitle: true,
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          komputer.Komputer(),
          headset.Headset(),
          radio.AgendaScreen(),
          hp.Smartphone(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: TabBar(
          controller: controller,
          tabs: <Widget>[
            Tab(
              icon: const Icon(Icons.home),
              text: 'Home',
            ),
            Tab(
              icon: const Icon(Icons.info),
              text: 'Info',
            ),
            Tab(
              icon: const Icon(Icons.event),
              text: 'Agenda',
            ),
            Tab(
              icon: const Icon(Icons.filter),
              text: 'Gallery',
            ),
          ],
        ),
      ),
    );
  }
}