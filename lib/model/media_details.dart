/* 
 * Copyright (c) 2020 Razeware LLC
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
 * distribute, sublicense, create a derivative work, and/or sell copies of the
 * Software in any work that is designed, intended, or marketed for pedagogical or
 * instructional purposes related to programming, coding, application development,
 * or information technology.  Permission for such use, copying, modification,
 * merger, publication, distribution, sublicensing, creation of derivative works,
 * or sale is expressly withheld.
 * 
 * This project and source code may use libraries or frameworks that are
 * released under various Open-Source licenses. Use of those libraries and
 * frameworks are governed by their own individual licenses.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import 'dart:convert';

class MediaDetails {
  final String id;
  final int width;
  final int height;
  final User user;
  final Link urls;

  MediaDetails({required this.id, required this.width, required this.height, required this.user, required this.urls});

  factory MediaDetails.fromJson(Map<String, dynamic> json) =>
      MediaDetails(
          id: json["id"],
          width: json["width"],
          height : json["height"],
          user: User.fromJson(json['user']),
          urls: Link.fromJson(json['urls']));

  Map<String, dynamic> toJson() =>
      {"id": id, "width": width, "height": height, "user": user, "url": urls};

  static List<MediaDetails> sampleFromJson(String str) {
    final jsonData = json.decode(str);
    return List<MediaDetails>.from(jsonData.map((x) => MediaDetails.fromJson(x)));
  }

  static String sampleToJson(List<MediaDetails> data) {
    final dyn = List<dynamic>.from(data.map((x) => x.toJson()));
    return json.encode(dyn);
  }
}

class User {
  final String name;

  User({required this.name});

  factory User.fromJson(Map<String, dynamic> json) =>
      User(name: json["name"]);

  Map<String, dynamic> toJson() => {"name": name};
}

class Link {
  final String regular;

  Link({required this.regular});

  factory Link.fromJson(Map<String, dynamic> json) =>
      Link(regular: json["regular"]);

  Map<String, dynamic> toJson() => {"regular": regular};
}
