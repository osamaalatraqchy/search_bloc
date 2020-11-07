
class SearchModel {
  String name;
  String details;
  List<String> key;

  SearchModel({this.name, this.details, this.key});

  toMap() => {
    "name" : name,
    "details" : details,
    "key" : key,
  };


  SearchModel.fromMap(Map<String, dynamic> map) :
      name = map["name"],
      details = map["details"];

}
