// To parse this JSON data, do
//
//     final photo = photoFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Photo> photoFromJson(String str) => List<Photo>.from(json.decode(str).map((x) => Photo.fromJson(x)));

String photoToJson(List<Photo> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Photo {
    Photo({
        required this.id,
        required this.author,
        required this.width,
        required this.height,
        required this.url,
        required this.downloadUrl,
    });

    final String id;
    final String author;
    final int width;
    final int height;
    final String url;
    final String downloadUrl;

    factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        id: json["id"],
        author: json["author"],
        width: json["width"],
        height: json["height"],
        url: json["url"],
        downloadUrl: json["download_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "author": author,
        "width": width,
        "height": height,
        "url": url,
        "download_url": downloadUrl,
    };
}
