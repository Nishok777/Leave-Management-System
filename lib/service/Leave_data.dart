// leave_data.dart
import 'package:leave_ui/service/Leave.dart';

class LeaveData {
  static List<Leave> leaves = [
    Leave(
      employeeName: "John Doe",
      leaveType: "Vacation",
      fromDate: DateTime(2024, 3, 1),
      toDate: DateTime(2024, 3, 5),
      leaveStatus: "Approved",
      appliedDate: DateTime(2024, 2, 25),
      isCancelled: false,
    ),
    Leave(
      employeeName: "Jane Smith",
      leaveType: "Sick Leave",
      fromDate: DateTime(2024, 3, 10),
      toDate: DateTime(2024, 3, 12),
      leaveStatus: "Pending",
      appliedDate: DateTime(2024, 2, 28),
      isCancelled: false,
    ),
  ];
}
