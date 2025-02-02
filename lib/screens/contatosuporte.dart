import 'package:caronapp/const.dart';
import 'package:caronapp/screens/atividades.dart';
import 'package:flutter/material.dart';

import '../widgets/custombutton.dart';
import '../widgets/customtextfield.dart';

class ContatoSuporte extends StatelessWidget {
  const ContatoSuporte({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 40.0,
                  left: 40.0,
                ),
                child: GestureDetector(
                  child: const Icon(Icons.arrow_back, size: 24),
                  onTap: () => {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => const Atividades()))
                  },
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 32.0, bottom: 32.0),
                  child: Text(
                    'Suporte',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w900,
                      color: redIdColor,
                    ),
                  ),
                ),
              ),
              const CustomTextField(
                labelTextCustom: 'Nome',
                keyboardTypeCustom: TextInputType.text,
                backgroundColorCustom: Colors.white,
              ),
              const CustomTextField(
                labelTextCustom: 'E-mail',
                keyboardTypeCustom: TextInputType.emailAddress,
                backgroundColorCustom: Colors.white,
              ),
              const CustomTextField(
                labelTextCustom: 'Matrícula',
                keyboardTypeCustom: TextInputType.number,
                backgroundColorCustom: Colors.white,
              ),
              /*CustomDropdown(
                  optionsList: const [
                    'Login',
                    'Pedir carona',
                    'Oferecer carona',
                    'Veículo',
                    'Perfil',
                    'Outros'
                  ],
                  hint: 'Tipo de problema',
                  boxColor: Colors.white,
                ),*/
              
              Padding(
                padding:
                    const EdgeInsets.only(top: 24.0, left: 40.0, right: 40.0),
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                  ),
                  child: TextField(
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      labelText: 'Descrição do problema',
                      hintText: 'Relate aqui seu problema',
                      border: InputBorder.none,
                      alignLabelWithHint: true,
                    ),
                    maxLines: 20,
                    keyboardType: TextInputType.multiline,
                    onChanged: (value) {},
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 8.0, left: 40.0, right: 40.0),
                child: CustomButton(
                  text: 'Enviar',
                  onPressed: () => {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => const Atividades()))
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
class ExpansionTileExample extends StatefulWidget {
  const ExpansionTileExample({super.key});

  @override
  State<ExpansionTileExample> createState() => _ExpansionTileExampleState();
}

class _ExpansionTileExampleState extends State<ExpansionTileExample> {
  bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const ExpansionTile(
          title: Text('ExpansionTile 1'),
          subtitle: Text('Trailing expansion arrow icon'),
          children: <Widget>[
            ListTile(title: Text('This is tile number 1')),
          ],
        ),
        ExpansionTile(
          title: const Text('ExpansionTile 2'),
          subtitle: const Text('Custom expansion arrow icon'),
          trailing: Icon(
            _customTileExpanded
                ? Icons.arrow_drop_down_circle
                : Icons.arrow_drop_down,
          ),
          children: const <Widget>[
            ListTile(title: Text('This is tile number 2')),
          ],
          onExpansionChanged: (bool expanded) {
            setState(() {
              _customTileExpanded = expanded;
            });
          },
        ),
        const ExpansionTile(
          title: Text('ExpansionTile 3'),
          subtitle: Text('Leading expansion arrow icon'),
          controlAffinity: ListTileControlAffinity.leading,
          children: <Widget>[
            ListTile(title: Text('This is tile number 3')),
          ],
        ),
      ],
    );
  }
}
*/