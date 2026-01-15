import 'dart:async';
import '../Services/user_info_service.dart';

class UserSession {
  final String message;
  final String userId;
  final String phoneNumber;
  final String name;
  int totalPoints;
  final String role;
  final String sessionId;

  static UserSession? current;
  static Timer? _pointsTimer;

  UserSession({
    required this.message,
    required this.userId,
    required this.phoneNumber,
    required this.name,
    required this.totalPoints,
    required this.role,
    required this.sessionId,
  });

  factory UserSession.fromJson(Map<String, dynamic> json) {
    return UserSession(
      message: (json["message"] ?? "").toString(),
      userId: (json["userId"] ?? "").toString(),
      phoneNumber: (json["phoneNumber"] ?? "").toString(),
      name: (json["name"] ?? "").toString(),
      totalPoints: _toInt(json["totalPoints"]),
      role: (json["role"] ?? "").toString(),
      sessionId: (json["sessionId"] ?? "").toString(),
    );
  }

  void startPointsAutoRefresh() {
    _pointsTimer?.cancel();

    _pointsTimer = Timer.periodic(const Duration(seconds: 3), (_) async {
      try {
        final points = await UserInfoService.fetchUserPoints(userId);
        totalPoints = points;
      } catch (_) {}
    });
  }

  static void stopPointsAutoRefresh() {
    _pointsTimer?.cancel();
    _pointsTimer = null;
  }

  static int _toInt(dynamic v) {
    if (v is int) return v;
    return int.tryParse((v ?? "0").toString()) ?? 0;
  }
}
