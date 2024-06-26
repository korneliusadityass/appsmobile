import 'package:appsmobile/core/app_constants/route.dart';
import 'package:appsmobile/router.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: 'asset/cfg/base.env');

  runApp(const ProviderScope(child: App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fake Store',
      theme: ThemeData(
        // backgroundColor: Colors.indigoAccent,
        brightness: Brightness.light,
      ),
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: Routes.login,
      navigatorKey: navigatorKey,
      builder: BotToastInit(),
      navigatorObservers: <NavigatorObserver>[
        routeObserver,
        BotToastNavigatorObserver(),
      ],
    );
  }
}
