import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instantsearchbloc/blocs/search_bloc.dart';
import 'package:instantsearchbloc/blocs/search_states.dart';
import 'package:instantsearchbloc/data/search_repository.dart';


import 'ui/insert_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    BlocProvider<SearchBloc>(
      create: (context) => SearchBloc(InitState(), SearchRepository()),
      child: MaterialApp(
        home: Insert()),
    ),
  );
}


