import 'package:flutter/material.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/widgets/vakinha_button.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/widgets/vakinha_textformfield.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  logar() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash'),
      ),
      body: Column(
        children: const [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: VakinhaTextformfield(
              label: 'Text Form',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          VakinhaButton(
            label: 'Entrar',
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
