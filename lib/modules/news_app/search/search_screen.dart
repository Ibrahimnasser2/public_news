

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review/layout/news_app/cubit/cubit.dart';
import 'package:review/layout/news_app/cubit/states.dart';
import 'package:review/shared/components/components.dart';

class search extends StatelessWidget {
  const search({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    var list = news_app_cubit.get(context).search;
    var serch=TextEditingController();
    return BlocConsumer<news_app_cubit,new_app_states>(
      listener: (context,state){},
      builder: (context,state){
         list = news_app_cubit.get(context).search;
        return Scaffold(
          appBar: AppBar() ,
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextFormField(
                  controller: serch ,
                  keyboardType: TextInputType.text,
                  onChanged:(value){
                    news_app_cubit.get(context).get_searchedata(value);
                    },

                  validator: (value){
                    if(!(value!.isEmpty)){
                      return null;
                    }
                    return("not valid");
                  } ,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(color:Colors.deepOrange, width: 2.0),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.deepOrange, width: 2.0),
                    ),

                    labelText: "search" ,
                    labelStyle: Theme.of(context).textTheme.bodyText1,
                    prefixIcon: Icon( Icons.search),

                  ) ,

                ),
              ),
              Expanded(child: news_app_bulider(list: list,issearch: true)),
            

            ],
          ),

        );
      },

    );
  }
}
