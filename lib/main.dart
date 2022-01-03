import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController tec1 = new TextEditingController();
  TextEditingController tec2 = new TextEditingController();

  Widget myWidget = Text(''); // vamos a ir cambiandolo

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Icons'),

          actions: <Widget>[ // TODO: agregar acciones a la barra
            IconButton(icon: Icon(Icons.add_box),
                onPressed: (){
                  print("Icono suma");
                  setState(() {
                    double n1 = double.parse(tec1.text);
                    double n2 = double.parse(tec2.text);
                    print('Suma: $n1 + $n2 = ${n1+n2}');
                    myWidget = suma(n1, n2, n1+n2);
                  });
                }
            ),

            IconButton(icon: Icon(Icons.wb_iridescent_rounded),
                onPressed: (){
                  print("Icono resta");
                  setState(() {
                    double n1 = double.parse(tec1.text);
                    double n2 = double.parse(tec2.text);
                    print('Resta: $n1 - $n2 = ${n1-n2}');
                    myWidget = resta(n1, n2, n1-n2);
                  });
                }
            ),

            IconButton(icon: Icon(Icons.adjust),
                onPressed: (){
                  print("Icono multiplicacion");
                  setState(() {
                    double n1 = double.parse(tec1.text);
                    double n2 = double.parse(tec2.text);
                    print('Multiplicacion: $n1 * $n2 = ${n1*n2}');
                    myWidget = mult(n1, n2, n1*n2);
                  });
                }
            ),

            IconButton(icon: Icon(Icons.workspaces_filled),
                onPressed: (){
                  print("Icono division");
                  setState(() {
                    double n1 = double.parse(tec1.text);
                    double n2 = double.parse(tec2.text);
                    print('Division: $n1 / $n2 = ${n1/n2}');
                    myWidget = division(n1, n2, n1/n2);
                  });
                }
            )
          ],

        ),


        body:Padding(
          padding: const EdgeInsets.all(15.0),
          child: Stack(
            children: <Widget>[
              Row( // cambiamos de row a stack para mejor control
                children: <Widget>[
                  Expanded(child: TextField(controller: tec1, decoration: InputDecoration(hintText: 'primer numero'), )),
                  SizedBox(width: 20, ),
                  Expanded(child: TextField(controller: tec2, decoration: InputDecoration(hintText: 'segundo numero'), ))
                ],
              ),

              Align(
                alignment: Alignment(0, 0),
                child: myWidget,
              )
            ]
          ),
        ) ,


      ),
    );
  }

  Widget suma(n1, n2, sum){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          res(n1, Colors.teal[100], Colors.teal[900]),
          res(n2, Colors.lime[100], Colors.lime[900]),
          res(sum, Colors.red[100], Colors.red[900]),
        ],

      ),
    );
  }

  Widget resta(n1, n2, sum){
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          res(n1, Colors.teal[100], Colors.teal[900]),
          res(n2, Colors.lime[100], Colors.lime[900]),
          res(sum, Colors.red[100], Colors.red[900]),
        ],

      ),
    );
  }

  Widget mult(n1, n2, sum){
    return Center(
      child: Stack(
        children: <Widget>[
          Align(alignment: (Alignment(-1, -0.7)),
            child: res(n1, Colors.teal[100], Colors.teal[900]),
          ),
          Align(alignment: (Alignment(0, 0)),
            child: res(n2, Colors.lime[100], Colors.lime[900]),
          ),
          Align(alignment: (Alignment(1, 0.7)),
            child: res(sum, Colors.red[100], Colors.red[900]),
          )
        ],

      ),
    );
  }

  Widget division(n1, n2, sum){
    return Center(
      child: Stack(
        children: <Widget>[
          Align(alignment: (Alignment(1, -0.7)),
            child: res(n1, Colors.teal[100], Colors.teal[900]),
          ),
          Align(alignment: (Alignment(0, 0)),
            child: res(n2, Colors.lime[100], Colors.lime[900]),
          ),
          Align(alignment: (Alignment(-1, 0.7)),
            child: res(sum, Colors.red[100], Colors.red[900]),
          )
        ],

      ),
    );
  }


  Widget res(msg, clr1, Color clr2){
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          gradient: RadialGradient(colors: [clr1, clr2]),
          borderRadius: BorderRadius.circular(50)
      ),
      child: Center(child: Text(
        msg.toString(),
        style: TextStyle(fontSize: 25, fontFamily: 'Courier New'),
      )),
    );
  }
}