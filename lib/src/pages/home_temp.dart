import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView(
        children: _crearItemsCorta(),
      ),
    );
  }

  List<Widget> _crearItems() {
    List<Widget> lista = new List<Widget>(); //Es dinámica

    for (String opc in opciones) {
      final widgetAux = new ListTile(
        title: Text(opc),
      );

      //Opcion uno
      //lista.add( widgetAux );
      //lista.add( new Divider() );

      //Opcion dos
      lista..add( widgetAux )
           ..add( Divider() );
    }

    return lista;
  }

  List<Widget> _crearItemsCorta() {
    //El List se convierte en un Map, el cual necesita de una función para saber qué y cómo,
    //Opc toma el valor de cada elemento en el List y la funcion retorna un Column con ListTile y Divider.
    //Finalmente, esto nos retorna un Iterable<Column>, el cual puede ser convertido a List.
    return opciones.map( ( opc ) {
      return Column(
        children: <Widget>[
          ListTile(
            leading: Icon( Icons.ac_unit ),
            title: Text( opc ),
            subtitle: Text( 'Cualquier cosa' ),
            trailing: Icon( Icons.keyboard_arrow_right ),
            onTap: (){},
          ),
          Divider(),
        ],
      );
    }).toList();

  }

}