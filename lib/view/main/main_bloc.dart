
import 'package:cositive/view/main/main_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'main_state.dart';

enum MainPage {
  home, coupon, chat, my
}


class MainBloc extends Bloc<MainEvent, MainState> {
  @override
  // TODO: implement initialState
  get initialState => MainStateHome(MainPage.home);

  @override
  Stream<MainState> mapEventToState(MainEvent event) async* {

    if (event is TapElement) {
      yield* _mapTapElementToState(event);
    }
    yield null;
  }

  Stream<MainState> _mapTapElementToState(TapElement tapElement) async* {

    switch(tapElement.category) {
      case MainPage.home:
        yield MainStateHome(MainPage.home);
        break;
      case MainPage.coupon:
        yield MainStateHome(MainPage.coupon);
        break;
      case MainPage.chat:
        yield MainStateHome(MainPage.chat);
        break;
      case MainPage.my:
        yield MainStateHome(MainPage.my);
        break;
    }

  }

}