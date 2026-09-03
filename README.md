# Magazine Infos

Application Flutter de gestion des rédacteurs du magazine **Magazine Infos**.
Les données sont enregistrées et synchronisées avec Firebase Cloud Firestore.

## Fonctionnalités

- Consulter la page d'accueil du magazine.
- Ajouter un rédacteur avec son nom et sa spécialité.
- Afficher la liste des rédacteurs en temps réel.
- Modifier les informations d'un rédacteur.
- Supprimer un rédacteur après confirmation.
- Valider les champs du formulaire et nettoyer les valeurs avec `trim()`.

## Technologies

- Flutter
- Dart `^3.13.1`
- Firebase Core
- Cloud Firestore

## Structure du projet

```text
lib/
├── controllers/
├── models/
├── views/
└── main.dart
```

## Prérequis

- Flutter installé et configuré.
- Un projet Firebase avec Cloud Firestore activé.
- Un émulateur ou un appareil connecté.

## Installation

1. Cloner le projet et se placer dans son dossier.
2. Installer les dépendances :

```bash
flutter pub get
```

3. Configurer Firebase pour la plateforme ciblée. Les fichiers de configuration
	Android et iOS doivent correspondre à votre projet Firebase.
4. Vérifier la configuration et les appareils disponibles :

```bash
flutter doctor
flutter devices
```

5. Lancer l'application :

```bash
flutter run
```

## Données Firestore

Les rédacteurs sont stockés dans la collection `redactor` avec les champs :

```text
name       : String
speciality : String
```

Les règles Firestore doivent autoriser les opérations nécessaires à
l'application. En production, utilisez des règles sécurisées adaptées à votre
authentification et à vos utilisateurs.

## Vérification du code

Pour analyser le projet et lancer les tests Flutter :

```bash
flutter analyze
flutter test
```
