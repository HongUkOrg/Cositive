
import 'package:cositive/view/chat/chat_view.dart';
import 'package:cositive/view/coupon/coupon_view.dart';
import 'package:cositive/view/home/home_view.dart';
import 'package:cositive/view/main/center_notch_shape.dart';
import 'package:cositive/view/main/main_bloc.dart';
import 'package:cositive/view/main/main_event.dart';
import 'package:cositive/view/main/main_state.dart';
import 'package:cositive/view/my/my_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainView extends StatelessWidget {

  Widget homeView = HomeView();
  Widget couponView = CouponView();
  Widget chatView = ChatView();
  Widget myView = MyView();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainBloc(),
      child: Scaffold(
          body: BlocBuilder<MainBloc, MainState>(
            builder: (BuildContext context, MainState state) {
              if (state is MainStateHome) {
                switch(state.currentPage) {
                  case MainPage.home:
                    return homeView;
                  case MainPage.coupon:
                    return couponView;
                  case MainPage.chat:
                    return chatView;
                  case MainPage.my:
                    return myView;
                }
              }
              return Center(
                child: Text('Error'),
              );
            },
          ),
          floatingActionButton: Container(
            width: 60,
            height: 60,
            child: FloatingActionButton(
              backgroundColor: Colors.amber[500],
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {
                print('Floating action btn onPressed');
              },
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
              shape: CenterNotchShape(),
              child: BlocBuilder<MainBloc, MainState>(
                builder: (BuildContext context, MainState state) {
                  if(state is MainStateHome) {
                    return Container(
                      height: 70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              HomeButton('홈', Icons.home, state.currentPage == MainPage.home ? Colors.blue : Colors.black87),
                              HomeButton('쿠폰', Icons.wallpaper, state.currentPage == MainPage.coupon ? Colors.blue : Colors.black87),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              HomeButton('채팅', Icons.chat, state.currentPage == MainPage.chat ? Colors.blue : Colors.black87),
                              HomeButton('My', Icons.person, state.currentPage == MainPage.my ? Colors.blue : Colors.black87),
                            ],
                          ),
                        ],
                      ),
                    );
                  }
                  return Center(
                    child: Text('Error'),
                  );
                },
              )
          )
      )
    );
  }
}

class HomeButton extends StatelessWidget {

  final String title;
  final IconData iconData;
  final Color color;
  
  const HomeButton(this.title, this.iconData, this.color);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 77,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(iconData, color: color,),
          SizedBox(height: 5),
          Text(title,
            style: TextStyle(
              fontSize: 12,
                color: color,
            ),
          ),
        ],
      ),
      onPressed: () {
        MainBloc mainBloc = BlocProvider.of<MainBloc>(context);
        mainBloc.add(TapElement(getPageFromString(title)));
      },
    );
  }

  MainPage getPageFromString(String name) {
    if (name == "홈") {
      return MainPage.home;
    } else if (name == "쿠폰") {
      return MainPage.coupon;
    } else if (name == "채팅") {
      return MainPage.chat;
    } else if (name == "My") {
      return MainPage.my;
    } else {
      return MainPage.home;
    }
  }
}
