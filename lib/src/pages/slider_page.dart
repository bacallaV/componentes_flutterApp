import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 205.0;
  bool _valorCheck = false;
  bool _valorSwitch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _crearCheckBox(),
            _crearSwitch(),
            Expanded(child: _crearImagen()),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      label: 'Tamaño de la imagen',
      value: _valorSlider,
      min: 10.0,
      max: 400.0,
      activeColor: Colors.indigoAccent,
      onChanged: (_valorCheck || _valorSwitch) ? null :  (valor) {
        setState(() {
          _valorSlider = valor;
          
        });
      },
    );
  }

  Widget _crearCheckBox() {
    return CheckboxListTile(
      title: Text('Bloquear Slider'),
      value: _valorCheck,
      onChanged: (check) {
        setState(() {
          _valorCheck = check;

        });
      },
    );
    //MANERA 1 (SOLO DA EL CUADRITO)
    // return Checkbox(
    //   value: _valorCheck,
    //   onChanged: (check) {
    //     setState(() {
    //       _valorCheck = check;

    //     });
    //   },
    // );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      title: Text('Bloquear Slider'),
      value: _valorSwitch,
      onChanged: (switchh) {
        setState(() {
          _valorSwitch = switchh;

        });
      },
    );
  }

  Widget _crearImagen() {
    return FadeInImage(
      placeholder: AssetImage('assets/jar-loading.gif'),
      image: NetworkImage('https://image.flaticon.com/icons/png/512/17/17022.png'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }

}