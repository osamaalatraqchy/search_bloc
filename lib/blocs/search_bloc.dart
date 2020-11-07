

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instantsearchbloc/blocs/search_event.dart';
import 'package:instantsearchbloc/blocs/search_states.dart';
import 'package:instantsearchbloc/data/search_model.dart';
import 'package:instantsearchbloc/data/search_repository.dart';

 class SearchBloc extends Bloc<SearchEvents, SearchStates> {
   SearchRepository repo;
  SearchBloc(SearchStates initialState, this.repo) : super(initialState);

  @override
  Stream<SearchStates> mapEventToState(SearchEvents event) async*{
      if(event is GetAllEvent) {
        yield LoadingState();
        var emps = await repo.getEmp();
        yield GetState(emps: emps);

      } else if (event is AddEvent) {
        var splitKey = event.name.split(" "); //osama => [o, s, a, m, a]
        List<String> keys = [];
        for(int i = 0; i < splitKey.length; i++) {
          for(int j = 1; j < splitKey[i].length +1; j++) {
            keys.add(splitKey[i].substring(0, j));
          }
        }

        await repo.addEmp(SearchModel(name: event.name, details: event.details, key: keys));
        yield AddState();
      } else if (event is FindEvent) {
        yield LoadingState();
        var emp = await repo.findEmp(event.key);
        yield SearchState(emps: emp);
      }
  }

}
