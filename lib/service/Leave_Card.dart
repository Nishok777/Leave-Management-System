import 'package:flutter/material.dart';
import 'package:leave_ui/service/Leave.dart';

class Leave_Card extends StatelessWidget {
  final Leave e;

  const Leave_Card({Key? key, required this.e}) : super(key: key);

  String calculateDuration() {
    DateTime toDate = e.toDate;
    DateTime fromDate = e.fromDate;
    Duration difference = toDate.difference(fromDate);
    int daysDifference = difference.inDays;
    return '$daysDifference days';
  }

  String func() {
    return e.leaveType == "Vacation" ? 'assets/vacation.jpg' : 'assets/sick.png';
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 500.0, end: 600.0),
        duration: const Duration(seconds: 1),
        builder: (BuildContext context, double value, Widget? child) {
          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xFF6dd5ed), Color(0xFF2193b0)],
              ),
            ),
            childCard(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                side: BorderSide(color: Colors.white.withOpacity(0.2), width: 2.0),
              ),
              margin: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(func()),
                    radius: 28.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              e.employeeName,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 10.0,
                                letterSpacing: 2.0,
                              ),
                            ),
                            const SizedBox(width: 10.0),
                            Text(
                              e.leaveType,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 10.0,
                                letterSpacing: 2.0,
                              ),
                            ),
                            const SizedBox(width: 4.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Duration : ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10.0,
                                    letterSpacing: 2.0,
                                  ),
                                ),
                                Text(
                                  e.fromDate.toString().substring(0, 10),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10.0,
                                    letterSpacing: 2.0,
                                  ),
                                ),
                                const Text(
                                  " - ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10.0,
                                    letterSpacing: 2.0,
                                  ),
                                ),

                              ],
                            ),
                            Text(
                              e.toDate.toString().substring(0, 10),
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2.0,
                                fontSize: 10.0,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Status :  ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10.0,
                                    letterSpacing: 2.0,
                                  ),
                                ),
                                Text(
                                  e.leaveStatus,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10.0,
                                    letterSpacing: 2.0,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Applied on : ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10.0,
                                    letterSpacing: 2.0,
                                  ),
                                ),
                                Text(
                                  e.appliedDate.toString().substring(0, 10),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10.0,
                                    letterSpacing: 2.0,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: SizedBox(
                      width: screenWidth * 0.2,
                      height: screenWidth * 0.2,
                      child: Center(
                        child: Text(
                          'He would be back in ${calculateDuration()}',
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 8.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );: 
        },
      ),
    );
  }
}
