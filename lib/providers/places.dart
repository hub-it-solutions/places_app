import 'dart:io';

import 'package:flutter/material.dart';
import 'package:places_app/helpers/db_helpers.dart';
import 'package:places_app/models/place.dart';

class Places with ChangeNotifier {
  final List<Place> _items = [];
  List<Place> get items {
    return [..._items];
  }

  void addPlaces(String pickeTitle, File pickedImage) {
    final newPlace = Place(
      id: DateTime.now().toString(),
      image: pickedImage,
      title: pickeTitle,
      location: PlaceLoction(
        address: '',
        latitude: 0.0,
        longitude: 0.0,
      ),
    );
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert('places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
    });
  }
}
