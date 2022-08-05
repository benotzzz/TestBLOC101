import 'package:bloc_finals_exam/screens/pending_screen.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'services/app_router.dart';
import 'services/app_themes.dart';
import 'blocs/bloc_exports.dart';
import 'blocs/task_bloc/tasks_bloc.dart';
import 'models/task.dart';
import 'screens/tabs_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  HydratedBlocOverrides.runZoned(
        () =>
        runApp(MyApp(appRouter: AppRouter()),

        ),
    storage: storage,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRouter}) : super(key: key);


  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TasksBloc()),
        BlocProvider(create: (context) => SwitchBloc()),

      ],
      child: BlocBuilder<SwitchBloc, SwitchState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'BloC Tasks App',
            theme: state.switchValue
              ?AppThemes.appThemeData[AppTheme.darkMode]
              : AppThemes.appThemeData[AppTheme.lightMode],

            home:TabsScreen(),
            onGenerateRoute: appRouter.onGenerateRoute,
          );
        },
      ),
    );
  }
}
