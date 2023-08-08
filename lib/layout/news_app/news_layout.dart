
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review/modules/news_app/search/search_screen.dart';
import 'package:review/shared/components/components.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

class news_layout extends StatelessWidget {
  const news_layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<news_app_cubit,new_app_states>(
      listener:(context,state){} ,
      builder: (context,state){
        news_app_cubit cubit= news_app_cubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text("News app",style: Theme.of(context).textTheme.bodyText1,),
            actions: [
              IconButton(onPressed:(){
                navigate_to(context,search());
              } ,icon: Icon(Icons.search)),
              IconButton(onPressed:(){
                cubit.changemode();
              } ,icon: Icon(Icons.nightlight)),

            ],
          ),
          body: cubit.body[cubit.c_index],
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomitem,

            onTap: (index){
            cubit.change_navig_bar(index);
            },
            currentIndex:cubit.c_index,


          ),
        );
      },

    );
  }
}
