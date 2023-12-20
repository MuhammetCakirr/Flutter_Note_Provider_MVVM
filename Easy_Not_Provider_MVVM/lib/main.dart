
import 'package:deneme/feature/NotList/View/not_list_view.dart';
import 'package:deneme/feature/NotList/ViewModel/not_list_viewmodel.dart';




import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_){return NoteProvider();})
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const NoteListScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
            tabBarTheme: TabBarTheme(
                labelColor: Colors.orange,
                unselectedLabelColor: Colors.grey.withOpacity(0.3),
                indicatorSize: TabBarIndicatorSize.label,
                indicator: const BoxDecoration()),
            appBarTheme: const AppBarTheme(
                elevation: 0, backgroundColor: Colors.transparent, systemOverlayStyle: SystemUiOverlayStyle.dark),
            floatingActionButtonTheme:
                const FloatingActionButtonThemeData(backgroundColor: Color.fromRGBO(11, 23, 84, 1))),
      
    );
  }
}