
import 'package:cositive/view/main/main_bloc.dart';
import 'package:equatable/equatable.dart';

abstract class MainState extends Equatable {

  const MainState();

  @override
  List<Object> get props => [];
}
class MainStateHome extends MainState {
  final MainPage currentPage;

  MainStateHome(this.currentPage);

  @override
  List<Object> get props {
    return [currentPage];
  }
}
class MainStateCoupon extends MainState {}
class MainStateChat extends MainState {}
class MainStateMyHome extends MainState {}
