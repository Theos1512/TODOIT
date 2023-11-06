
// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoit/utilities/color.dart';

class ToDoTile extends StatelessWidget {
  ToDoTile(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      required this.deletefunction});

  final String taskName; //nom de la tâche
  final bool taskCompleted; //pour la valeur de la checkbox

  Function(bool?)?
      onChanged; //pour la logique lorsque la valeur de la checkbox passe à true ou false

  Function(BuildContext)? deletefunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(onPressed: deletefunction,
            icon: FontAwesomeIcons.trash,
            backgroundColor: Colors.redAccent,
            borderRadius: BorderRadius.circular(8),),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(25),
          decoration: BoxDecoration(
              color: color.secondaryTextColor,
              borderRadius: BorderRadius.circular(8)),
          child: Row(
                children: [
                  //Case à cocher
                  Checkbox(value: taskCompleted, onChanged: onChanged),
      
                  const SizedBox(
                    width: 10,
                  ),
      
                  //Nom de la tâche
                  Text(
                    taskName,
                    style: GoogleFonts.rowdies(
                        color: color.primaryColor,
                        fontSize: 24,
                        decoration: taskCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none),
                  ),
                ],
              ),
        ),
      ),
    );
  }
}
