import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => HomeScreen(),
        '/details': (context) => DetailsScreen(),
      },
      initialRoute: '/',
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<String> produkte = ['Produkt 1', 'Produkt 2', 'Produkt 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: ListView.builder(
        itemCount: produkte.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(produkte[index]),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/details',
                arguments: produkte[index],
              );
            },
          );
        },
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final produktName = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Produkt: $produktName'),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Zurück zum Home Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
