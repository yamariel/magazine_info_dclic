import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../controllers/redactor_controller.dart';
import '../models/redactor_model.dart';
import '../views/update_redactor_view.dart';

class InfoRedactorView extends StatefulWidget {
  const InfoRedactorView({super.key});

  @override
  State<InfoRedactorView> createState() => _InfoRedactorViewState();
}

class _InfoRedactorViewState extends State<InfoRedactorView> {
  final RedactorController controller = RedactorController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Informations des rédacteurs")),
      body: StreamBuilder<QuerySnapshot>(
        stream: controller.redactorStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("Aucun rédacteur pour l'instant."));
          }

          final redactors = snapshot.data!.docs
              .map((doc) => RedactorModel.fromFirebasestore(doc))
              .toList();
          return ListView.builder(
            itemCount: redactors.length,
            itemBuilder: (context, i) {
              final redactor = redactors[i];
              return Padding(
                padding: const EdgeInsets.all(3),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.blue,
                          radius: 30,
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 35,
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text(
                              redactor.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            subtitle: Text(redactor.speciality),
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => UpdateRedactorView(
                                      redactor: redactor,
                                    ),
                                  ),
                                );
                              },
                              icon: Icon(Icons.edit, color: Colors.yellow),
                            ),
                            IconButton(
                              onPressed: () async {
                                final confirmed = await showDialog<bool>(
                                  context: context,
                                  builder: (dialogContext) => AlertDialog(
                                    title: const Text(
                                      "Confirmer la suppression",
                                    ),
                                    content: Text(
                                      "Voulez-vous supprimer ${redactor.name} ?",
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(dialogContext, false),
                                        child: const Text("Annuler", style: TextStyle(color: Colors.green),),
                                      ),
                                      const SizedBox(width: 100,),
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(dialogContext, true),
                                        child: const Text("Supprimer", style: TextStyle(color: Colors.red),),
                                      ),
                                    ],
                                  ),
                                );

                                if (confirmed == true) {
                                  await controller.deleteRedactor(redactor.id);
                                }
                              },
                              icon: Icon(Icons.delete, color: Colors.red),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
