
import 'package:cositive/view/main/main_bloc.dart';

abstract class MainEvent {

}

class TapElement extends MainEvent {

  final MainPage category;

  TapElement(this.category);

}