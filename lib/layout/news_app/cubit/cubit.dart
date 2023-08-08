import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review/layout/news_app/cubit/states.dart';
import 'package:review/modules/news_app/business/business.dart';
import 'package:review/modules/news_app/science/science.dart';
import 'package:review/modules/news_app/settings/settings.dart';
import 'package:review/modules/news_app/sports/sports.dart';
import 'package:review/shared/network/remote/dio_helper.dart';
import 'package:review/shared/network/local/cach_helper.dart';

class news_app_cubit extends Cubit<new_app_states>{
  news_app_cubit() : super(news_intial_state());
  static news_app_cubit get(context)=> BlocProvider.of(context);

  List<BottomNavigationBarItem> bottomitem=[
    BottomNavigationBarItem(icon: Icon(Icons.business),label: "business"),
    BottomNavigationBarItem(icon: Icon(Icons.sports),label: "sports"),
    BottomNavigationBarItem(icon: Icon(Icons.science),label: "science"),
    ];

  List<Widget> body=[business(), sports(), science(), ];
  List<dynamic> businesss=[];
  List<dynamic> sportss=[];
  List<dynamic> sciences=[];
  List<dynamic> search=[];

   int c_index=0;
  void change_navig_bar (int index){

    c_index=index;
    emit(change_navig_bar_state());
  }
  
  void get_businessdata(){
    if(businesss.length==0){
      emit(loading_bus_state());
      dio_helper.get_data(
        url: "v2/top-headlines",
        quiries: {
          "country": "us",
          "category": "business",
          "apiKey":"36080c39f76944c7a2cb2223841274de"},
      ).then((value) {
        businesss =value.data['articles'];
        var m=businesss[1];
        print(m["title"].toString());
        emit(sucess_load_bus_state());

      }).catchError((error){
        print(error.toString());
        emit(fail_load_bus_state(error));
      });

    }
    else{
      emit(sucess_load_bus_state());
    }

    
  }
  void get_sportsdata(){
    if(sportss.length==0){
      emit(loading_spo_state());
      dio_helper.get_data(
        url: "v2/top-headlines",
        quiries: {
          "country": "us",
          "category": "sports",
          "apiKey":"36080c39f76944c7a2cb2223841274de"},
      ).then((value) {
        sportss =value.data['articles'];
        emit(sucess_load_spo_state());

      }).catchError((error){
        print(error.toString());
        emit(fail_load_spo_state(error));
      });

    }
    else{
      emit(sucess_load_spo_state());
    }



  }
  void get_sciencedata(){
    if(sciences.length==0){
      emit(loading_sci_state());
      dio_helper.get_data(
        url: "v2/top-headlines",
        quiries: {
          "country": "us",
          "category": "science",
          "apiKey":"36080c39f76944c7a2cb2223841274de"},
      ).then((value) {
        sciences =value.data['articles'];
        emit(sucess_load_sci_state());

      }).catchError((error){
        print(error.toString());
        emit(fail_load_sci_state(error));
      });
    }
    else{
      emit(sucess_load_sci_state());
    }




  }
  void get_searchedata( String value){
    search=[];

      emit(loading_sear_state());
      dio_helper.get_data(
        url: "v2/everything",
        quiries: {
          "q": "$value",
          "apiKey":"36080c39f76944c7a2cb2223841274de"},
      ).then((value) {
        search =value.data['articles'];
        print(search[0]['title']);
        emit(sucess_load_sear_state());

      }).catchError((error){
        print(error.toString());
        emit(fail_load_sear_state(error));
      });





  }

   bool isdark=false;
  void changemode( {alwaysisdark}){

    if(alwaysisdark != null){

      isdark=alwaysisdark;
      emit(changemode_state());





    }
    else{
      isdark=!isdark;
      cash_helper.setbool(key: "is_dark", value: isdark).then((value){

        emit(changemode_state());
      });


    }



  }



}
