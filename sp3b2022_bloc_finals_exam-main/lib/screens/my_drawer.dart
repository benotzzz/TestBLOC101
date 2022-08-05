import 'package:bloc_finals_exam/blocs/bloc/tasks_bloc.dart';
import 'package:bloc_finals_exam/screens/recycle_bin_screen.dart';
import 'package:bloc_finals_exam/screens/tabs_screen.dart';
import 'package:bloc_finals_exam/screens/pending_screen.dart ';
import 'package:flutter/material.dart';

import '../blocs/bloc_exports.dart';
import '../blocs/task_bloc/tasks_bloc.dart';


class MyDrawer extends StatelessWidget {

  const MyDrawer({Key? key }) : super (key: key);


  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
              color: Colors.grey,
              child: Text('Task Drawer', style: Theme
                  .of(context)
                  .textTheme
                  .headline5,),
            ),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () =>
                      Navigator.of(context).pushReplacementNamed(
                          TabsScreen.id),
                  child: ListTile(
                    leading: const Icon(Icons.folder_special),
                    title: const Text('My Tasks'),
                    trailing: Text('${state.pendingTasks.length} | ${state.completedTasks.length} '),
                  ),
                );
              },
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return Switch(
                  value: state.switchValue,
                  onChanged: (newValue) {
                    newValue? context.read<SwitchBloc>().add(SwitchOnEvent()):
                    context.read<SwitchBloc>().add(SwitchOffEvent());
                  },

                );
              },
            ),


            const Divider(),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () =>
                      Navigator.of(context).pushNamed(RecycleBinScreen.id),
                  child: ListTile(
                    leading: const Icon(Icons.delete),
                    title: const Text('Bin'),
                    trailing: Text('${state.removedTasks.length}'),
                  ),
                );
              },
            ),


          ],
        ),


      ),
    );
  }
}