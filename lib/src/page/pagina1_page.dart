import 'package:animate_do_ejemplos/src/page/navegacionPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';

import 'package:animate_do_ejemplos/src/page/twitter_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class Pagina1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: FadeIn(
          duration: Duration(milliseconds: 500),
          child: Text('Animate do')
        ),
        actions: [

          IconButton(
            icon: FaIcon( FontAwesomeIcons.twitter),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => TwitterPage() ));
            },
          ),

          SlideInLeft(
            from: 50,
            child: IconButton(
              icon: Icon( Icons.navigate_next ),
              onPressed: () {
                Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => Pagina1Page() ));
              },
            ),
          )

        ],
      ),

      floatingActionButton: ElasticInRight(
        child: FloatingActionButton(
          child: FaIcon (FontAwesomeIcons.play),
          onPressed: () {

            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => NavegacionPage() ));

          },
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ElasticIn(
              delay: Duration( milliseconds: 1100),
              child: Icon(Icons.new_releases, color: Colors.blue, size: 40,)
            ),

            FadeInDown(
              delay: Duration( milliseconds: 200),
              child: Text('Titulo', style: TextStyle( fontSize: 40, fontWeight: FontWeight.w200),)
            ),

            FadeInDown(
              child: Text('Texto mas chico', style: TextStyle( fontSize: 20, fontWeight: FontWeight.w400),)
            ),

            FadeInLeft(
              child: Container(
                width: 220,
                height: 2,
                color: Colors.blue,
              ),
            )


          ],
        ),
      ),


   );
  }
}