import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:review/shared/bloc_observer.dart';
import 'package:review/shared/network/local/cach_helper.dart';
import 'package:review/shared/network/remote/dio_helper.dart';
import 'layout/news_app/cubit/cubit.dart';
import 'layout/news_app/cubit/states.dart';
import 'layout/news_app/news_layout.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  dio_helper.init();
  await cash_helper.init();

  runApp(MyApp( ));
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    bool? is_dark= cash_helper.getbool(key: "is_dark");
   return MultiBlocProvider(
     providers: [

       BlocProvider(create: (BuildContext context)=>news_app_cubit()..changemode(alwaysisdark: is_dark), ),
       BlocProvider(create: (BuildContext context)=>news_app_cubit()..get_businessdata()..get_sciencedata()..get_sportsdata()),

     ],
     child: BlocConsumer<news_app_cubit,new_app_states>(
       listener:(context,state){},
       builder: (context,state){
         is_dark=news_app_cubit.get(context).isdark;


         return MaterialApp(
           debugShowCheckedModeBanner: false,
           theme: ThemeData(
               scaffoldBackgroundColor: Colors.white,

               primaryColor: Colors.deepOrange,
               appBarTheme: AppBarTheme(
                 color: Colors.white,
                 elevation: 0.0,
                 actionsIconTheme: IconThemeData(
                   color: Colors.black,

                 ),


                 titleTextStyle: TextStyle(
                     color: Colors.black,
                     fontSize: 20,
                     fontWeight:FontWeight.bold
                 ),

               ),
               bottomNavigationBarTheme: BottomNavigationBarThemeData(
                 type: BottomNavigationBarType.fixed,

                 elevation: 20,
                 selectedItemColor: Colors.deepOrange,
                 unselectedItemColor: Colors.black45,

               )

           ),
           darkTheme: ThemeData(

               scaffoldBackgroundColor: HexColor("333739"),
               primaryColorDark: Colors.deepOrange,
               primaryColorLight: Colors.deepOrange,
               iconTheme:IconThemeData(color: Colors.white) ,

               textTheme: TextTheme(
                   bodyText1: TextStyle(
                     fontSize: 18,
                     color: Colors.white,
                   )
               ),

               primaryColor: Colors.deepOrange,
               appBarTheme: AppBarTheme(

                 color: HexColor("333739"),
                 elevation: 0.0,
                 actionsIconTheme: IconThemeData(
                   color: Colors.white,

                 ),

                 titleTextStyle: TextStyle(
                     color: Colors.black,
                     fontSize: 20,
                     fontWeight:FontWeight.bold
                 ),

               ),
               bottomNavigationBarTheme: BottomNavigationBarThemeData(
                 backgroundColor: HexColor("333739"),
                 unselectedItemColor:  Colors.grey,
                 type: BottomNavigationBarType.fixed,


                 elevation: 20,
                 selectedItemColor: Colors.deepOrange,


               )

           ),
           themeMode: (is_dark!) ? ThemeMode.dark : ThemeMode.light,
           home: Directionality(
               textDirection:TextDirection.ltr ,
               child: news_layout()),
         );
       },

     ),
   );
  }

}



