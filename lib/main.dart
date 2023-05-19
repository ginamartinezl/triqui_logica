import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';

void main() {
  runApp(TriquiApp());
}

class TriquiApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Triqui',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: FirstScreen(),
    );
  }
}

class Controlador extends GetxController {
  RxList<RxString> Lista_comprobar = [
    ''.obs,
    ''.obs,
    ''.obs,
    ''.obs,
    ''.obs,
    ''.obs,
    ''.obs,
    ''.obs,
    ''.obs
  ].obs; //obs es la variable observable

  RxString mensaje = ''.obs;

  List<int> Verificar() {
    List<int> Lista_verificar = [];
    for (int i = 0; i < Lista_comprobar.length; i++) {
      if (Lista_comprobar[i].value != 'X' && Lista_comprobar[i].value != 'O') {
        Lista_verificar.add(i);
      }
    }
    return Lista_verificar;
  }

  void jugar_oponente() {
    List<int> Lista_oponente = Verificar();
    if (terminado() == false) {
      int jugar = Lista_oponente[Random().nextInt(Lista_oponente.length)];
      Lista_comprobar[jugar].value = 'O';
    }
  }

  void jugar_yo(int j) {
    List<int> Lista_yo = Verificar();
    if (terminado() == false) {
      if (Lista_yo.contains(j)) {
        Lista_comprobar[j].value = 'X';
        jugar_oponente();
      }
    }
  }

  bool estado_ganar() {
    if (Lista_comprobar[0].value == 'X' &&
        Lista_comprobar[1].value == 'X' &&
        Lista_comprobar[2].value == 'X') {
      //GANE
      return true;
    } else if (Lista_comprobar[0].value == 'X' &&
        Lista_comprobar[3].value == 'X' &&
        Lista_comprobar[6].value == 'X') {
      return true;
    } else if (Lista_comprobar[0].value == 'X' &&
        Lista_comprobar[4].value == 'X' &&
        Lista_comprobar[8].value == 'X') {
      return true;
    } else if (Lista_comprobar[3].value == 'X' &&
        Lista_comprobar[4].value == 'X' &&
        Lista_comprobar[5].value == 'X') {
      return true;
    } else if (Lista_comprobar[6].value == 'X' &&
        Lista_comprobar[7].value == 'X' &&
        Lista_comprobar[8].value == 'X') {
      return true;
    } else if (Lista_comprobar[6].value == 'X' &&
        Lista_comprobar[4].value == 'X' &&
        Lista_comprobar[2].value == 'X') {
      return true;
    } else if (Lista_comprobar[1].value == 'X' &&
        Lista_comprobar[4].value == 'X' &&
        Lista_comprobar[7].value == 'X') {
      return true;
    } else if (Lista_comprobar[2].value == 'X' &&
        Lista_comprobar[5].value == 'X' &&
        Lista_comprobar[8].value == 'X') {
      return true;
    }
    return false;
  }

  bool estado_perder() {
    if (Lista_comprobar[0].value == 'O' &&
        Lista_comprobar[1].value == 'O' &&
        Lista_comprobar[2].value == 'O') {
      //GANO
      return true;
    } else if (Lista_comprobar[0].value == 'O' &&
        Lista_comprobar[3].value == 'O' &&
        Lista_comprobar[6].value == 'O') {
      return true;
    } else if (Lista_comprobar[0].value == 'O' &&
        Lista_comprobar[4].value == 'O' &&
        Lista_comprobar[8].value == 'O') {
      return true;
    } else if (Lista_comprobar[3].value == 'O' &&
        Lista_comprobar[4].value == 'O' &&
        Lista_comprobar[5].value == 'O') {
      return true;
    } else if (Lista_comprobar[6].value == 'O' &&
        Lista_comprobar[7].value == 'O' &&
        Lista_comprobar[8].value == 'O') {
      return true;
    } else if (Lista_comprobar[6].value == 'O' &&
        Lista_comprobar[4].value == 'O' &&
        Lista_comprobar[2].value == 'O') {
      return true;
    } else if (Lista_comprobar[1].value == 'O' &&
        Lista_comprobar[4].value == 'O' &&
        Lista_comprobar[7].value == 'O') {
      return true;
    } else if (Lista_comprobar[2].value == 'O' &&
        Lista_comprobar[5].value == 'O' &&
        Lista_comprobar[8].value == 'O') {
      return true;
    }
    return false;
  }

  bool terminado() {
    List<int> Lista_terminado = Verificar();
    if (estado_ganar() == true) {
      mensaje.value = '¡Ganaste!';
      return true;
    } else if (estado_perder() == true) {
      mensaje.value = '¡Te Ganaron!';
      return true;
    } else if (Lista_terminado.isEmpty) {
      mensaje.value = 'Bah... Empataron';
      return true;
    }
    return false;
  }

  void reiniciar() {
    for (int i = 0; i < 9; i++) {
      Lista_comprobar[i].value = '';
    }
    mensaje.value = '';
  }
}

class FirstScreen extends StatelessWidget {
  //final c_cont = Get.put(Controlador());
  //final triqui_cont = Get.find<Controlador>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              alignment: Alignment.center,
              child: Text("TRIQUI",
                  style: TextStyle(
                      fontSize: 90,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 4
                        ..color = Colors.teal[500]!))),
          Container(
              child: Image.network(
                  'https://avatars.githubusercontent.com/u/109951?s=400&v=4'),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40)),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 20),
                  //color: Colors.blue,
                  height: 100,
                  width: 100,
                  child: ElevatedButton(
                    child: Text('PLAY'),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SecondScreen(),
                      ));
                    },
                  ),
                ),
              ])
        ],
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final c_cont = Get.put(Controlador());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('En juego'),
          leading: ElevatedButton(
            child: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
              c_cont.reiniciar();
            },
          ),
        ),
        body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 3,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[500],
              child: ElevatedButton(
                  child: Obx(() => Text('${c_cont.Lista_comprobar[0].value}',
                      style: TextStyle(
                          fontSize: 80,
                          color: Color(
                              int.parse("#fafffe".replaceAll('#', '0xff')))))),
                  onPressed: () {
                    c_cont.jugar_yo(0);
                  }),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[500],
              child: ElevatedButton(
                  child: Obx(() => Text('${c_cont.Lista_comprobar[1].value}',
                      style: TextStyle(fontSize: 80))),
                  onPressed: () {
                    c_cont.jugar_yo(1);
                  }),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[500],
              child: ElevatedButton(
                  child: Obx(() => Text('${c_cont.Lista_comprobar[2].value}',
                      style: TextStyle(fontSize: 80))),
                  onPressed: () {
                    c_cont.jugar_yo(2);
                  }),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[500],
              child: ElevatedButton(
                  child: Obx(() => Text('${c_cont.Lista_comprobar[3].value}',
                      style: TextStyle(fontSize: 80))),
                  onPressed: () {
                    c_cont.jugar_yo(3);
                  }),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[500],
              child: ElevatedButton(
                  child: Obx(() => Text('${c_cont.Lista_comprobar[4].value}',
                      style: TextStyle(fontSize: 80))),
                  onPressed: () {
                    c_cont.jugar_yo(4);
                  }),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[500],
              child: ElevatedButton(
                  child: Obx(() => Text('${c_cont.Lista_comprobar[5].value}',
                      style: TextStyle(fontSize: 80))),
                  onPressed: () {
                    c_cont.jugar_yo(5);
                  }),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[500],
              child: ElevatedButton(
                  child: Obx(() => Text('${c_cont.Lista_comprobar[6].value}',
                      style: TextStyle(fontSize: 80))),
                  onPressed: () {
                    c_cont.jugar_yo(6);
                  }),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[500],
              child: ElevatedButton(
                  child: Obx(() => Text('${c_cont.Lista_comprobar[7].value}',
                      style: TextStyle(fontSize: 80))),
                  onPressed: () {
                    c_cont.jugar_yo(7);
                  }),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[500],
              child: ElevatedButton(
                  child: Obx(() => Text('${c_cont.Lista_comprobar[8].value}',
                      style: TextStyle(fontSize: 80))),
                  onPressed: () {
                    c_cont.jugar_yo(8);
                  }),
            ),
            Obx(() => Text('${c_cont.mensaje.value}',
                style: TextStyle(
                    fontSize: 28,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 3
                      ..color = Colors.teal[500]!))),
            Container(
              padding: const EdgeInsets.only(top: 100, left: 30, right: 10),
              child: ElevatedButton(
                  child: Text(
                    'Reiniciar',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color:
                            Color(int.parse("#01ffbb".replaceAll('#', '0xff'))),
                        fontSize: 20),
                  ),
                  onPressed: () {
                    c_cont.reiniciar();
                  }),
            ),
          ],
        ));
  }
}



//------------------------------
//Referencias usadas: https://api.flutter.dev/flutter/widgets/GridView-class.html
//https://blog.pleets.org/article/insertar-im%C3%A1genes-en-flutter