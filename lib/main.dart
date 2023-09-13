import 'dart:io';

import 'package:civilians/main_page/navigation.screen.dart';
import 'package:flutter/material.dart';
import 'package:window_size/window_size.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      setWindowTitle('Flutter Dicoding Submission');
      setWindowMinSize(const Size(400, 800));
      setWindowMaxSize(Size.infinite);
      Future<void>.delayed(const Duration(seconds: 1), () {
        setWindowFrame(Rect.fromCenter(center: const Offset(1000, 500), width: 400, height: 800));
      });
    }
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: const NavigationScreen(),
    );
  }
}
