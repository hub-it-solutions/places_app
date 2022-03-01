import 'package:flutter/material.dart';

class AddPlaceScreen extends StatefulWidget {
  static const route = '/add-a-place';
  const AddPlaceScreen({Key? key}) : super(key: key);

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a New Place'),
      ),
      body: Column(
        children: [
          const Text("text inputs"),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.place),
            label: const Text("Add Place"),
          ),
        ],
      ),
    );
  }
}
