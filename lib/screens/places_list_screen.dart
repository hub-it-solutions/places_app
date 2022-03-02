import 'package:flutter/material.dart';
import 'package:places_app/providers/places.dart';
import 'package:places_app/screens/add_place_screen.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your places'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.route);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Consumer<Places>(
        child: const Center(
          child: Text("Got no places yet, start adding  some!"),
        ),
        builder: (ctx, places, ch) => places.items.isEmpty
            ? Center(
                child: ch,
              )
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: places.items.length,
                itemBuilder: (BuildContext context, int i) {
                  return Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: FileImage(places.items[i].image))),
                  );
                }),
      ),
    );
  }
}
