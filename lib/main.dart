import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/services.dart';
import 'theme/app_theme.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Supabase
  // Replace YOUR_SUPABASE_URL and YOUR_SUPABASE_ANON_KEY 
  // with your project details from Supabase dashboard.
  await Supabase.initialize(
    url: 'https://aeugnhztzaonibitqbbq.supabase.co',
    anonKey: 'sb_publishable___qj-eN2Weqevy5ou7mC_g_H9gnM1Wx', 
  );

  // Set system UI style for a premium look
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );

  runApp(const MyMoviesApp());
}

class MyMoviesApp extends StatelessWidget {
  const MyMoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Movies App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const HomeScreen(),
    );
  }
}
