import 'package:flutter/material.dart';

import 'dart:async';

class ListaPage extends StatefulWidget {
  ListaPage({Key key}) : super(key: key);

  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  ScrollController _scrollController = ScrollController();

  List<int> _listaNumeros = List();
  int _ultimoItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _agregar10();

    _scrollController.addListener(() {
      if( _scrollController.position.pixels == _scrollController.position.maxScrollExtent )
        // _agregar10();
        fetchData();
    });
  }

  //ESTE MÉTODO SE LLAMA CUANDO SE DESTRUYE LA PÁGINA
  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas')
      ),
      body: Stack(
        children: <Widget>[
          _crearLista(),
          _crearLoading(),
        ],
      ),
    );
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: obtenerPagina1, //REFERENCIA DE LA FUNCIÓN
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: ( BuildContext context, int index ) {
          int numImg = _listaNumeros[index];
          return FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage('https://picsum.photos/500/400/?image=$numImg'),
          );
        },
      ),
    );
  }

  Future<Null> obtenerPagina1() async {
    final duration = Duration(seconds: 2);
    Timer(duration, () {
      _listaNumeros.clear();
      _ultimoItem++;
      _agregar10();
    });

    return Future.delayed(duration);
  }

  void _agregar10() {
    for (var i = 0; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }

    setState(() {});
  }

  Future fetchData() async {
    _isLoading = true;
    setState(() {});

    final duration = Duration(seconds: 2);
    Timer(duration, respuestaHTTP); //REFERENCIA DE LA FUNCIÓN, POR ESO NO TIENE ()
  }

  void respuestaHTTP() {
    _isLoading = false;
    _agregar10();

    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.easeIn,
      duration: Duration(milliseconds: 250),
    );
  }

  Widget _crearLoading() {
    if( _isLoading )
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(height: 15.0,),
        ],
      );
    return Container();
  }

}