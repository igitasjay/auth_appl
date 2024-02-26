import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'core/model./theme_model.dart';
import 'core/service/local_service/initializer.dart';
import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  dotenv.load(fileName: ".env");

  // set up locator services
  setupLocator();

  await locator<Initializer>().init();

  // Change status bar theme based on theme of app
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeModel(),
      child: Consumer<ThemeModel>(builder: (context, themeProvider, child) {
        return ScreenUtilInit(
          designSize: const Size(395, 852),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (BuildContext context, Widget? child) {
            return const MaterialApp(
              debugShowCheckedModeBanner: false,
              // onGenerateRoute: Routers.generateRoute,

              // navigatorKey: locator<NavigationService>().navigatorKey,
              // title: AppStrings.appName,
              // theme: Styles.themeData(themeProvider.isDark, context),
              // theme: Styles.themeData(false, context),
              home: SplashScreen(),
              // onGenerateRoute: AppRouter.generateRoute,
            );
          },
        );
      }),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
