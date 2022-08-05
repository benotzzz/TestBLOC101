import 'package:bloc_finals_exam/blocs/bloc_exports.dart';
import 'package:flutter/material.dart';


import '../blocs/task_bloc/tasks_bloc.dart';
import 'my_drawer.dart';
import '../widgets/tasks_list.dart';

class RecycleBinScreen extends StatelessWidget {
  const RecycleBinScreen({Key? key}) : super(key: key);

  static const id = 'recycle-bin';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: const Text('Recycle Bin'),
              actions: [
                PopupMenuButton(
                  itemBuilder: (context) =>
                  [
                    PopupMenuItem(
                      child: TextButton.icon(
                        onPressed: null,
                        icon: const Icon(Icons.delete_forever),
                        label: const Text('Delete all tasks'),
                      ),
                      onTap: () => context
                      .read<TasksBloc>()
                      .add(DeleteAllTasks())),
                  ],
                ),
              ],
            ),
            drawer: const MyDrawer(),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Chip(
                      label: Text(
                      '${state.removedTasks.length} Task',
                    ),
                  ),
                  ),
                  SizedBox(height: 10),
                  TasksList(tasksList: state.removedTasks)
                ],
              ),

        ),
            );
      },
    );
  }
}
