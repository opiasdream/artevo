import 'dart:async';
import 'package:artevo/common/config/app_initialize.dart';
import 'package:artevo/common/config/routes.dart';
import 'package:artevo/common/config/color_schemes.dart';
import 'package:artevo/common/constants/strings.dart';
import 'package:artevo/common/widgets/language_selection_widgets.dart';
import 'package:artevo/common/widgets/theme_toggle_button.dart';
import 'package:artevo/localization/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  await AppInitialize.init();

  runApp(const ProviderScope(child: Root()));
}

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      ThemeMode themeMode = ref.watch(themeModeProvider);
      var locale = ref.watch(selectedLanguageProvider);
      return MaterialApp(
        title: appName,
        debugShowCheckedModeBanner: false,

        // localizations
        locale: locale,
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,

        // theme settings
        themeMode: themeMode,
        theme: ThemeData(
            useMaterial3: true,
            colorScheme: lightColorScheme,
            fontFamily: "Domine"),
        darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: darkColorScheme,
            fontFamily: "Domine"),

        // routes
        initialRoute: Screens.splash.routeName,
        onGenerateRoute: Routes().generateRoute,
      );
    });
  }
}
