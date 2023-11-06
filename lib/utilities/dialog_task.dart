
// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:todoit/utilities/color.dart';
import 'package:todoit/widgets/bouton.dart';

class DialogTask extends StatelessWidget {
  final textController;
  VoidCallback onSaved;
  VoidCallback onCancel;

     DialogTask(
      {super.key,
      required this.textController,
      required this.onSaved,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: color.secondaryTextColor,
      content: Container(
        height: 140,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //récupère le text entré par l'utilisateur...
            TextField(
              controller: textController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                  hintText: 'Ajouter une tâche...'),
            ),

            //boutons sauvegarde et annuler
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //bouton ajouter
                MyButton(buttontext: 'Ajouter', onPressed: onSaved),

                const SizedBox(
                  width: 10,
                ),

                //bouton annuler
                MyButton(buttontext: 'Annuler', onPressed: onCancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}
