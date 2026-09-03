import 'package:cloud_firestore/cloud_firestore.dart';

class RedactorModel {
  final String id;
  final String name;
  final String speciality;

  const RedactorModel({
    required this.id,
    required this.name,
    required this.speciality,
  });

  //Transformer le document Firebase en objet dart
  factory RedactorModel.fromFirebasestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return RedactorModel(
      id: doc.id, 
      name: data["name"] ?? "", 
      speciality: data["speciality"] ?? ""
    );
  }

  //Tranformer l'objet dart en document Firebase
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "speciality": speciality
    };
  }
}
