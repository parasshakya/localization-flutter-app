import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:localization_app/language_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LanguageProvider>(
      create: (context) => LanguageProvider(),
      child: const HomePage(),
      builder: (context, child) => MaterialApp(
          locale: Provider.of<LanguageProvider>(context).locale,
          title: 'Localizations Sample App',
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: child),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // The [AppBar] title text should update its message
        // according to the system locale of the target platform.
        // Switching between English and Spanish locales should
        // cause this text to update.
        title: Text(AppLocalizations.of(context)!.hello("Paras")),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppLocalizations.of(context)!.helloWorld),
            ElevatedButton(
                onPressed: () {
                  context.read<LanguageProvider>().setLocale(Locale("ne"));
                },
                child: Text("Change to nepali")),
            ElevatedButton(
                onPressed: () {
                  context.read<LanguageProvider>().setLocale(Locale("en"));
                },
                child: Text("Change to english")),
            ElevatedButton(
                onPressed: () {
                  context.read<LanguageProvider>().setLocale(Locale("es"));
                },
                child: Text("Change to spanish")),
          ],
        ),
      ),
    );
  }
}
