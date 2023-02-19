class Endpoints {
  Endpoints._();

  static const String baseURL = 'https://maps.googleapis.com/maps/api/place';
  static const String textsearchURL = '/textsearch/json?language=th&type=restaurant&key=$keyGoogleMap&location=13.757105,100.501962&query=';
  static const String photoURL = '/photo?maxwidth=400&photo_reference=';
  static const String keyGoogleMap = 'You-API-Key';

}