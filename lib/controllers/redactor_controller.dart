import 'package:cloud_firestore/cloud_firestore.dart';

class RedactorController {
  //Crée une instance de firebase
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //Récupérer la collection 'Redactor'
  Stream<QuerySnapshot> get redactorStream => _firestore.collection('redactor').snapshots();

  //Ajouter un redacteur
  Future<void> addRedactor(String name, String speciality) async {
    await _firestore.collection('redactor').add({
      "name" : name,
      "speciality" : speciality
    });
  }

  //Modifier un redacteur
  Future<void> updateRedactor(String id, String name, String speciality) async {
    await _firestore.collection('redactor').doc(id).update({
      "name": name,
      "speciality": speciality
    });
  }

  //Supprimer un redacteur
  Future<void> deleteRedactor(String id) async {
    await _firestore.collection('redactor').doc(id).delete();
  }
}