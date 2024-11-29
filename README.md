# Connectivity Guard 🛡️

**Connectivity Guard** is a Flutter package designed to monitor the device's internet connection in real-time. It displays your custom widget (`child`) when the device is online and shows a predefined "No Internet Connection" dialog when offline.

---

## Features ✨
- Monitors internet connectivity in real-time.
- Displays a custom widget when the device is online.
- Shows a dialog when the device is offline.
- Simple and lightweight implementation.
- Works with both Wi-Fi and Mobile Data.

---

## Installation 🚀

Add the following to your `pubspec.yaml` file:

```yaml
dependencies:
  connectivity_guard: ^1.0.0

```

## Then run:
```bash
flutter pub get
```
---


## Usage 📖
Wrap your widget tree with ConnectionAwareWidget. Pass your desired widget as the child.

## Example:
```bash
import 'package:flutter/material.dart';
import 'package:connectivity_guard/connectivity_guard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ConnectionAwareWidget(
        child: Scaffold(
          appBar: AppBar(title: const Text('Connectivity Guard Example')),
          body: const Center(
            child: Text('You are connected to the Internet!'),
          ),
        ),
      ),
    );
  }
}
```
---


## Customization 🎨
Dialog Customization:
You can customize the "No Internet Connection" dialog by modifying the _buildNoConnectionDialog method in ConnectionAwareWidget.

## License 📄
This package is licensed under the MIT License. See the LICENSE file for more information.

## Author 👨‍💻
Developed by HASAN KOÇ.
Feel free to reach out at [Firesoftyazilim](https://github.com/Firesoftyazilim) or visit my GitHub profile.



