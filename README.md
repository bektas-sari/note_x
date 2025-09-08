# 📘 NoteX - Minimalist Note-Taking App (Flutter APP)

**NoteX** is a lightweight, modern, and elegant note-taking app built with Flutter. It offers a smooth user experience with persistent local storage, note editing, searching, and a clean, responsive design using Material 3.

---

## ✨ Features

* 📝 Create and save notes locally
* 🔁 Persistent storage using [Hive](https://pub.dev/packages/hive)
* 🔍 Real-time note search
* 🖊️ Tap to edit existing notes
* 🗑️ Swipe to delete (with animation)
* 🌗 Adaptive light/dark theme support
* 📅 Human-readable timestamps

---

## 🚀 Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/bektas-sari/note_x.git
cd note_x
```

### 2. Install dependencies

```bash
flutter pub get
```

### 3. Generate Hive adapter

```bash
flutter pub run build_runner build
```

> ⚠️ If you get errors, try cleaning first:

```bash
flutter pub run build_runner clean
flutter pub run build_runner build --delete-conflicting-outputs
```

### 4. Run the app

```bash
flutter run
```

---

## 🗃️ Folder Structure

```
lib/
├── main.dart
├── models/
│   └── note.dart
├── screens/
│   └── home_screen.dart
├── services/
│   └── note_storage.dart
└── widgets/
    └── note_card.dart
```

---

## 📦 Dependencies

| Package         | Usage                        |
| --------------- | ---------------------------- |
| flutter         | UI framework                 |
| hive            | Lightweight local database   |
| hive\_flutter   | Hive bindings for Flutter    |
| intl            | Date formatting              |
| path\_provider  | Path access for Hive boxes   |
| build\_runner   | Code generation tool         |
| hive\_generator | Generates Hive type adapters |

---

## 💡 Customization Ideas

* Add categories/tags for notes
* Cloud sync with Firebase
* Markdown support
* Reminders and notifications

---

## 👨‍💻 Developer

**Bektaş Sarı**
PhD in Advertising, AI + Creativity researcher
Flutter Developer & Software Educator

- **Email:** [bektas.sari@gmail.com](mailto:bektas.sari@gmail.com)  
- **GitHub:** [github.com/bektas-sari](https://github.com/bektas-sari)  
- **LinkedIn:** [linkedin.com/in/bektas-sari](https://www.linkedin.com/in/bektas-sari)  
- **Researchgate:** [researchgate.net/profile/Bektas-Sari-3](https://www.researchgate.net/profile/Bektas-Sari-3)  
- **Academia:** [independent.academia.edu/bektassari](https://independent.academia.edu/bektassari)

---

## 📄 License

This project is licensed under the MIT License 

