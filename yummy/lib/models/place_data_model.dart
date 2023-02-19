class PlaceData {
  PlaceData({
    this.results,
    this.status,
  });

  List<Result>? results;
  String? status;

  factory PlaceData.fromJson(Map<String, dynamic> json) => PlaceData(
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    status: json["status"],
  );

}

class Result {
  Result({
    this.name,
    this.photos,
    this.formattedAddress,
  });

  String? name;
  List<Photos>? photos;
  String? formattedAddress;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    name: json["name"],
    photos: json["photos"] != null ? List<Photos>.from(json["photos"].map((x) => Photos.fromJson(x))) : <Photos>[],
    formattedAddress: json["formatted_address"],
  );

}

class Photos {
  Photos({
    this.photoReference,
  });

  String? photoReference;

  factory Photos.fromJson(Map<String, dynamic> json) => Photos(
    photoReference: json["photo_reference"] !=null ? json['photo_reference'] : '',
  );
}
