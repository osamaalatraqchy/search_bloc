



abstract class SearchEvents {}

class AddEvent extends SearchEvents {
  String name;
  String details;
  AddEvent({this.name, this.details});
}

class GetAllEvent extends SearchEvents {}

class FindEvent extends SearchEvents {
  String key;
  FindEvent({this.key});
}
