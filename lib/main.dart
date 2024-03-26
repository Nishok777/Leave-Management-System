import 'package:flutter/material.dart';
import 'package:leave_ui/service/Leave.dart';
import 'package:leave_ui/service/Leave_Card.dart';
import 'package:leave_ui/service/leave_data.dart'; // Import the leave data class
import "dart:async";

void main() {
  runApp(
    const MaterialApp(
      home: Home(),
    ),
  );
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final StreamController<List<Leave>> _streamController =
  StreamController<List<Leave>>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'LEAVE DETAILS',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: SingleChildScrollView(
        child: StreamBuilder<List<Leave>>(
          stream: _streamController.stream,
          initialData: LeaveData.leaves,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            List<Leave> leaves = snapshot.data!;

            return TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 500.0, end: 600.0),
              duration: const Duration(seconds: 1),
              builder: (BuildContext context, double value, Widget? child) {
                return Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: value,
                    child: ListView.builder(
                      itemCount: leaves.length,
                      itemBuilder: (context, index) {
                        // Introduce a delay based on the index
                        final itemDelay = Duration(milliseconds: 300 * index);

                        return FutureBuilder(
                          future: Future.delayed(itemDelay),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const SizedBox.shrink(); // Wait for the delay
                            } else {
                              return Leave_Card(e: leaves[index]);
                            }
                          },
                        );
                      },
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
