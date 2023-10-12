import 'package:flutter_bloc/flutter_bloc.dart';

class CubitBloc extends Cubit<int> {

  CubitBloc() : super(0);

  int selectedIndex = 0;

  updateIndex(index) {
    selectedIndex = index;
    emit(selectedIndex);
  }

}