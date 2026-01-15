import '../models/user_session.dart';

class SessionStore {
  static UserSession? current;

  static void clear() {
    UserSession.stopPointsAutoRefresh();
    current = null;
  }
}
