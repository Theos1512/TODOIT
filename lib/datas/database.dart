
import 'package:hive/hive.dart';

class ToDoDataBase {
  //liste de tâches...
  List toDoList = [];
  
  //reférencer la boîte de données
  final _mybox = Hive.box('TODOBOX');

  //méthode lancer lors de la toute première ouverture de l'application...
  void initialData(){
    toDoList = [
      ['Coder une applis',false],
      ['finir une applis',false],
    ];
  }

  //charger les données depuis la base de données...
  void loadData(){
    toDoList = _mybox.get('TODOLIST');
  }

  //mettre à jour la base de données...
  void updateData(){
    _mybox.put('TODOLIST', toDoList);
  }

}