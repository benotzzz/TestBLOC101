import 'package:bloc_finals_exam/blocs/bloc/tasks_bloc.dart';
import 'package:bloc_finals_exam/screens/add_task_sreen.dart';
import 'package:bloc_finals_exam/screens/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:bloc_finals_exam/models/task.dart';
import '../blocs/bloc_exports.dart';
import 'package:bloc_finals_exam/widgets/tasks_list.dart';
import 'package:bloc_finals_exam/blocs/bloc_exports.dart';

import '../blocs/task_bloc/tasks_bloc.dart';

class PendingTasksScreen extends StatefulWidget {
  const PendingTasksScreen({Key? key}) : super(key: key);

  static const id = 'task_screen';

  @override
  State<PendingTasksScreen> createState() => _PendingTasksScreenState();
}

class _PendingTasksScreenState extends State<PendingTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.pendingTasks;
        return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text(
                    '${tasksList.length} Pending | ${state.completedTasks.length} Completed',
                  ),
                ),
              ),
              TasksList(tasksList: tasksList)
            ],
          );

      },
    );
  }
}

