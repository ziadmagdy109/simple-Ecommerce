class Categorie {
  late String slug;
  late String name;
  late String url;

  Categorie.fromJson(Map<String, dynamic> json) {
    slug = json["slug"];
    name = json["name"];
    url = json["url"];
  }
}
