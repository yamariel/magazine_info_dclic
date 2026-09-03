import 'package:flutter/material.dart';

import '../controllers/redactor_controller.dart';
import '../models/redactor_model.dart';

class UpdateRedactorView extends StatefulWidget {
  final RedactorModel redactor;

  const UpdateRedactorView({super.key, required this.redactor});

  @override
  State<UpdateRedactorView> createState() => _UpdateRedactorViewState();
}

class _UpdateRedactorViewState extends State<UpdateRedactorView> {
  final RedactorController controller = RedactorController();
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _specialityController = TextEditingController();

  Future<void> _updateRedactor(String id) async {
    try {
      if (_formKey.currentState!.validate()) {
        await controller.updateRedactor(
          id,
          _nameController.text.trim(),
          _specialityController.text.trim(),
        );
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              "Rédacteur modifié avec succès.",
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            "Échec de la modification.",
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.redactor.name;
    _specialityController.text = widget.redactor.speciality;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _specialityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Modiifer un rédacteur")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  labelText: "Nom",
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Veuillez un nom.";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _specialityController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.work),
                  labelText: "Spécialité",
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Veuillez saisir une spécialité.";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () {
                  _updateRedactor(widget.redactor.id);
                },
                label: const Text(
                  "Modifier le rédacteur",
                  style: TextStyle(color: Colors.black),
                ),
                icon: Icon(Icons.save, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
