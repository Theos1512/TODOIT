
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:todoit/datas/database.dart';
import 'package:todoit/utilities/color.dart';
import 'package:todoit/utilities/dialog_task.dart';
import 'package:todoit/utilities/todo_tile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//PAGE D'ACCUEIL DE L'APP !!
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  ToDoDataBase db = ToDoDataBase();

  //reférencer la boîte de données hive
  final _mybox = Hive.box('TODOBOX');

  //initialized
  @override
  void initState() {
    //si c'est la première fois que l'on ouvre l'appli alors charger les données prédéfinis...
    if (_mybox.get('TODOLIST') == null) {
      db.initialData();
    }else{
      db.loadData();
    }
    super.initState();
  }

  //lorsque la case à cocher est enclenché
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateData();
  }

  //ajouter une nouvelle tâche
  void addTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  //text controller
  final _controller = TextEditingController();

  //créer une nouvelle tâche
  void createTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogTask(
            textController: _controller,
            onCancel: () => Navigator.of(context).pop(),
            onSaved: addTask,
          );
        });
  }

  //supprimer une tâche
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color.secondaryTextColor,
        elevation: 5,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'TO DO IT',
          style: GoogleFonts.rowdies(
              color: color.alternateColor,
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createTask,
        child: const FaIcon(
          Icons.add,
          size: 40,
        ),
      ),
      backgroundColor: color.primaryColor,
      body:
          //Une ListView pour afficher l'ensemble des tâches ajouter
          ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            deletefunction: (context) => deleteTask(index),
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
          );
        },
      ),
    );
  }
}
