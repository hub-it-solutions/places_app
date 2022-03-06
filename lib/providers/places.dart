import 'dart:io';

import 'package:flutter/material.dart';
import 'package:places_app/helpers/db_helpers.dart';
import 'package:places_app/models/place.dart';

class Places with ChangeNotifier {
  List<Place> _items = [];
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
    DBHelper.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData('user_places');

    _items = dataList
        .map((item) => Place(
              id: item['id'],
              title: item['title'],
              location: PlaceLoction(latitude: 0, longitude: 0, address: ''),
              image: File(
                item['image'],
              ),
            ))
        .toList();
    notifyListeners();
  }
}
