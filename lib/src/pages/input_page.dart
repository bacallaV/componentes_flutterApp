import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _email = '';
  String _fecha = '';
  String _opcSeleccionada = 'Hombre';

  List<String> _sexos = ['Hombre', 'Mujer', 'Prefiero no decirlo', 'Alien'];

  TextEditingController _inputDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de texto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearDate( context ),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        counter: Text('Letras ${_nombre.length}'),
        hintText: 'Nombre de la Persona',
        labelText: 'Nombre',
        helperText: 'Sólo es el nombre',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle)
      ),
      onChanged: (texto) {
        setState(() {
          _nombre = texto;
          
        });
      },
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'Introduzca su email',
        labelText: 'Email',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email)
      ),
      onChanged: (texto) => setState(() {
        _email = texto;
      }),
    );
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'Introduzca su contraseña',
        labelText: 'Contraseña',
        suffixIcon: Icon(Icons.lock),
        icon: Icon(Icons.lock_open)
      ),
      onChanged: (texto) => setState(() {
        _email = texto;
      }),
    );
  }

  Widget _crearDate(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputDate,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Fecha de Nacimiento',
        labelText: 'Fecha',
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today)
      ),
      onTap: () {
        FocusScope.of(context).requestFocus( FocusNode() );
        _selectDate( context );
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2025),
      locale: Locale('es', 'ES')
    );

    if( picked != null ){
      setState(() {
        _fecha = picked.toString();
        _inputDate.text = _fecha.substring(0, 10);
      });
    }

  }

  Widget _crearDropdown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 20.0,),
        DropdownButton(
          items: _getOpcionesDropdown(),
          value: _opcSeleccionada,
          onChanged: (opc) {
            setState(() {
              _opcSeleccionada = opc;
            });
          },
        ),
      ],
    );
  }

  List<DropdownMenuItem<String>> _getOpcionesDropdown() {
    List<DropdownMenuItem<String>> lista = List();

    _sexos.forEach( (sexo) {
      lista.add( DropdownMenuItem(
        child: Text(sexo),
        value: sexo
      ) );
    } );

    return lista;
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('El nombre es: $_nombre'),
      subtitle: Text('Email: $_email'),
      trailing: Text(_opcSeleccionada),
    );
  }
}