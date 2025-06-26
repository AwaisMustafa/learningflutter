import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Task {
  String title;
  bool isDone;

  Task(this.title, this.isDone);

  // Convert Task to Map
  Map<String, dynamic> toJson() => {
        'title': title,
        'isDone': isDone,
      };

  // Convert Map to Task
  static Task fromJson(Map<String, dynamic> json) =>
      Task(json['title'], json['isDone']);
}

class TodoHome extends StatefulWidget {
  @override
  _TodoHomePageState createState() => _TodoHomePageState();
}

class _TodoHomePageState extends State<TodoHome> {
  List<Task> _tasks = [];
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  void _showAddTaskDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add New Task'),
          content: TextField(
            controller: _controller,
            autofocus: true,
            decoration: InputDecoration(hintText: 'Enter task'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _controller.clear();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton.icon(
              onPressed: () {
                _addTask(_controller.text);
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.check),
              label: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  // Load tasks from SharedPreferences
  void _loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final String? tasksString = prefs.getString('tasks');
    if (tasksString != null) {
      List decoded = jsonDecode(tasksString);
      setState(() {
        _tasks = decoded.map((item) => Task.fromJson(item)).toList();
      });
    }
  }

  // Save tasks to SharedPreferences
  void _saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    List encoded = _tasks.map((task) => task.toJson()).toList();
    prefs.setString('tasks', jsonEncode(encoded));
  }

  void _addTask(String title) {
    if (title.trim().isEmpty) return;
    setState(() {
      _tasks.add(Task(title.trim(), false));
      _controller.clear();
    });
    _saveTasks();
  }

  void _toggleComplete(int index) {
    setState(() {
      _tasks[index].isDone = !_tasks[index].isDone;
    });
    _saveTasks();
  }

  void _deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
    _saveTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My To-Do List'),
        backgroundColor: Colors.teal[200],
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            tooltip: 'Add Task',
            onPressed: () {
              _showAddTaskDialog(); // A function to show a task input dialog
            },
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 10,),

          InkWell(
            onTap: () {
              _showAddTaskDialog();
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.teal[100],
                borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
              ),
              child: Center(
                child: Text('Add A Task',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),),
              ),
            ),
          ),
<<<<<<< HEAD
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Enter task',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => _addTask(_controller.text),
                  child: Text('Add'),
                ),
              ],
            ),
          ),
=======
        
>>>>>>> 752e338c54f74a9e7525bb074bc5fbbfd3f85438
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                color: Colors.teal[200],
                borderRadius: BorderRadius.circular(18),
              ),

              child: _tasks.isEmpty
                  ? Center(child: Text('No tasks yet'))
                  : ListView.builder(
                      itemCount: _tasks.length,
                      itemBuilder: (context, index) {
                        final task = _tasks[index];
                        return ListTile(
                          title: Text(
                            task.title,
                            style: TextStyle(
                              decoration: task.isDone
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                            ),
                          ),
                          leading:
                          Icon(
                            task.isDone
                                ? Icons.check_circle
                                : Icons.radio_button_unchecked,
                            color: task.isDone ? Colors.green : Colors.grey,
                          ),
                          onTap: () => _toggleComplete(index),

                          // Checkbox(
                          //     value: task.isDone,
                          //     onChanged: (_) => _toggleComplete(index),
                          //   ),

                          trailing: IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _deleteTask(index),
                          ),
                        );
                      },
                    ),
            ),
          ),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}
