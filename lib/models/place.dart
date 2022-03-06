import 'dart:io';
class PlaceLoction {
  final double latitude;
  final double longitude;
  final String address;
  PlaceLoction({
    required this.latitude,
    required this.longitude,
    required this.address,
  });
}

class Place {
  final String id;
  final String title;
  final PlaceLoction location;
  final File image;
  Place({
    required this.id,
    required this.title,
    required this.location,
    required this.image,
  });
}
