import 'package:flutter/material.dart';
import 'package:redactor/controllers/redactor_controller.dart';

class AddRedactorView extends StatefulWidget {
  final RedactorController controller;

  const AddRedactorView({super.key, required this.controller});

  @override
  State<AddRedactorView> createState() => _AddRedactorViewState();
}

class _AddRedactorViewState extends State<AddRedactorView> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _specialityController = TextEditingController();

  Future<void> _saveRedactor() async {
    try {
      if (_formKey.currentState!.validate()) {
        await widget.controller.addRedactor(
          _nameController.text.trim(),
          _specialityController.text.trim(),
        );

        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.green,
            content: Text("Rédacteur enregistré avec succès.", style: TextStyle(color: Colors.white),
          )
        ),
        );
        _nameController.clear();
        _specialityController.clear();
      }
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text("Échec de l'enregistrement.", style: TextStyle(color: Colors.white)
        )
      ),
      );
    }
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
      appBar: AppBar(title: const Text("Ajouter un rédacteur")),
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
                    return "Veuillez saisir un nom.";
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
                onPressed: _saveRedactor, 
                label: const Text("Ajouter le rédacteur", style: TextStyle(color: Colors.blue),),
                icon: Icon(Icons.save, color: Colors.blue,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
