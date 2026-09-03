import 'package:flutter/material.dart';
import '../controllers/redactor_controller.dart';
import '../views/add_redactor_view.dart';
import '../views/info_redactor_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 190,
              width: double.infinity,
              padding: const EdgeInsets.only(top: 100, left: 20),
              color: Colors.blue,
              child: const Text(
                "Magazine Infos",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person_add),
              title: const Text("Ajouter un rédacteur"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AddRedactorView(
                      controller: RedactorController(),
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.group),
              title: const Text("Informations sur les rédacteurs"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const InfoRedactorView()),
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          "Magazine Infos",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          const Icon(Icons.search, color: Colors.white),
          const SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset("assets/dclic.jpg", width: double.infinity),
            const SizedBox(height: 20),
            const Text(
              "Bienvenue au Magazine Infos",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            const SizedBox(height: 10),
            const Text("Votre magazine numérique, votre source d'inspiration."),
            const SizedBox(height: 10),
            const Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since 1966, when designers at Letraset and James Mosley, the librarian at St Bride Printing Library in London, took a 1914 Cicero translation and scrambled it to make dummy text for Letraset's Body Type sheets. It has survived not only many decades, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised thanks to these sheets and more recently with desktop publishing software like Aldus PageMaker and Microsoft Word including versions of Lorem Ipsum.",
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  label: Text("TEL"),
                  icon: Icon(Icons.phone, color: Colors.blue),
                ),
                TextButton.icon(
                  onPressed: () {},
                  label: Text("MAIL"),
                  icon: Icon(Icons.mail, color: Colors.blue),
                ),
                TextButton.icon(
                  onPressed: () {},
                  label: Text("PARTAGE"),
                  icon: Icon(Icons.share, color: Colors.blue),
                ),
              ],
            ),
            const SizedBox(height: 30),
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/dclic.jpg", width: 170),
                  const SizedBox(width: 20),
                  Image.asset("assets/dclic.jpg", width: 170),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
