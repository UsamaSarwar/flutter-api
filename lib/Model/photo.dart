// To parse this JSON data, do
//
//     final image = imageFromJson(jsonString);

import 'dart:convert';

List<Photo> photoFromJson(String str) => List<Photo>.from(json.decode(str).map((x) => Photo.fromJson(x)));

String photoToJson(List<Photo> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Photo {
    Photo({
        required this.albumId,
        required this.id,
        required this.title,
        required this.url,
        required this.thumbnailUrl,
    });

    final int albumId;
    final int id;
    final String title;
    final String url;
    final String thumbnailUrl;

    factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
    );

    Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
    };
}
