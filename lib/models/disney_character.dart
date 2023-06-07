class DisneyCharacter {
  List<String>? films;
  String? sourceUrl;
  String? name;
  String? imageUrl;

  DisneyCharacter({this.films, this.sourceUrl, this.name, this.imageUrl});

  DisneyCharacter.fromJson(Map<String, dynamic> json) {
    films = json['films'].cast<String>();
    sourceUrl = json['sourceUrl'];
    name = json['name'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['films'] = films;
    data['sourceUrl'] = sourceUrl;
    data['name'] = name;
    data['imageUrl'] = imageUrl;
    return data;
  }
}
