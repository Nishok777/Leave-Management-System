import 'package:flutter/material.dart';
class Leave {
  final String employeeName;
  final String leaveType;
  final DateTime fromDate;
  final DateTime toDate;
  final String leaveStatus;
  final DateTime appliedDate;
  final bool isCancelled;

  Leave({
    required this.employeeName,
    required this.leaveType,
    required this.fromDate,
    required this.toDate,
    required this.leaveStatus,
    required this.appliedDate,
    required this.isCancelled,
  });
}