import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:PharmaControl/screens/enfermeiro/check_page.dart';
import 'package:PharmaControl/screens/enfermeiro/request_page.dart';
import 'package:PharmaControl/screens/enfermeiro/order_state.dart';
import 'package:PharmaControl/widgets/custom_app_bar.dart';
import 'package:PharmaControl/constants/colors.dart';

class NovaSolicitacao extends StatelessWidget {
  final String problema;
  final String pyxis;
  final String material;
  final String problemSelected;

  NovaSolicitacao({
    required this.problema,
    required this.pyxis,
    required this.material,
    required this.problemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Revise o seu pedido',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: hsBlackColor,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),
            Text(
              'Qual o seu problema?',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              problema,
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            SizedBox(height: 16),
            Text(
              'Qual o pyxis?',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              pyxis,
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            SizedBox(height: 16),
            Text(
              problemSelected,
              style: TextStyle(fontSize: 18),
            ),
            Text(
              material,
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                var newOrder = Order(
                  problema: problema,
                  pyxis: pyxis,
                  material: material,
                  status: 'Pedido Pendente',
                  date: DateTime.now().toString(),
                  rating: 0,
                );
                context.read<OrderState>().addOrder(newOrder);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => CheckPage()),
                );
              },
              child: Text('Fazer pedido'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                textStyle: TextStyle(fontSize: 18),
                foregroundColor: Colors.white,
                backgroundColor: Color(0xFF0D47A1),
              ),
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => RequestPage()),
                );
              },
              child: Text(
                'Alterar pedido',
                style: TextStyle(fontSize: 18, color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}