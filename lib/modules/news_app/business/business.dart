
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review/layout/news_app/cubit/cubit.dart';
import 'package:review/layout/news_app/cubit/states.dart';
import 'package:review/shared/components/components.dart';

class business extends StatelessWidget {
  const business({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = news_app_cubit.get(context).businesss;
    return BlocConsumer<news_app_cubit,new_app_states>(
      listener: (context,state){},
      builder: (context,state){
        list = news_app_cubit.get(context).businesss;
        return news_app_bulider(list: list);
      },

    );


  }
}
