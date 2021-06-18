import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavegacionPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NotificacionModelo(),
      child: Scaffold(
        
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text('Mis Mascotas'),
        ),

      floatingActionButton: BotonFlotante(),

      bottomNavigationBar: BottomNavigation(),

   ),
    );
  }
}


class BottomNavigation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final int notificacion = Provider.of<_NotificacionModelo>(context).numero;

    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.pink,
      items: [

        BottomNavigationBarItem(
          label: 'Huesos' ,
          icon: FaIcon( FontAwesomeIcons.bone),
        ),

        BottomNavigationBarItem(
          label: 'Notificaciones' ,
          icon: Stack(
            children: [
              FaIcon( FontAwesomeIcons.bell ),
              Positioned(
                top: 0.0,
                right: 0.0,
                // child: Icon(Icons.brightness_1, size: 8, color: Colors.redAccent,)
                child: BounceInDown(
                  from: 10,
                  animate: ( notificacion > 0 ) ? true : false,
                  child: Bounce(
                    from: 10,
                    controller: ( controller ) => Provider.of<_NotificacionModelo>(context).bounceController = controller,
                    child: Container(
                      child: Text('$notificacion', style: TextStyle( color: Colors.white, fontSize: 7),),
                      alignment: Alignment.center,
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        shape: BoxShape.circle
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ),

        BottomNavigationBarItem(
          label: 'My Perro' ,
          icon: FaIcon( FontAwesomeIcons.dog)
        ),
      ],
    );
  }
}


class BotonFlotante extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: FaIcon( FontAwesomeIcons.play ),
      backgroundColor: Colors.pink,
      onPressed: () {

        final notiModel = Provider.of<_NotificacionModelo>(context, listen: false);
        
        int numero = notiModel.numero;

        numero++;

        notiModel.numero = numero;

        if ( numero >= 2) {
          final controller = notiModel.bounceController;
          controller.forward( from: 0.0 );
        }

      },
    );
  }
}



class _NotificacionModelo extends ChangeNotifier {

  int _numero = 0;
  AnimationController _bounceController;

  int get numero => this._numero;

  set numero( int valor ) {
    this._numero = valor;
    notifyListeners();
  }

  AnimationController get bounceController => this._bounceController;
  set bounceController( AnimationController controller) {
    this._bounceController = controller;
    notifyListeners();
  }

}

