import 'package:fixer_app/screens/onboarding/onboarding.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FlutterFlowTheme.of(context).primary = Color(0xFFF68B1E);
    return AdaptiveTheme(
      light: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,

      ),
      dark: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,

      ),
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        title: 'Fixer',
        theme: theme,
        darkTheme: darkTheme,
        home: Onboarding(),
      ),
    );
  }
}
