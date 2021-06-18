import 'package:animate_do_ejemplos/src/page/pagina1_page.dart';
import 'package:flutter/material.dart';

 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animate Do',
      home: Pagina1Page()
    );
  }
}