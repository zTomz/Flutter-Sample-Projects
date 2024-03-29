import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:notes/presentation/pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/provider/notes_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NotesProvider(
            debug: kDebugMode,
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          secondary: const Color(0xFF211E1C),
          background: Colors.black,
          brightness: Brightness.dark,
        ),
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
            backgroundColor: const Color(0xFF211E1C),
            foregroundColor: const Color(0xFFFFFFFF),
          ),
        ),
        textTheme: GoogleFonts.loraTextTheme(
          const TextTheme(
            headlineLarge: TextStyle(
              fontSize: 70,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFFFFFFFF),
          foregroundColor: Color(0xFF211E1C),
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
