import 'package:flutter_bloc/flutter_bloc.dart';

class CubitBloc extends Cubit<int> {

  CubitBloc() : super(0);

  int selectedIndex = 0;
  int selectedTile = 0;

  List title = [
    'Current Premium Allocation',
    'Current AAR Allocation'
  ];
  List isDateDue = [false, true];

  updateIndex(index) {
    selectedIndex = index;
    emit(selectedIndex);
  }

  updateSelectedTile(index) {
    selectedTile = index;
    emit(selectedTile);
  }

}