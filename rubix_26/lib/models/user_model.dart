/// User model matching Firestore schema
class AppUser {
  final String userId;
  final String name;
  final String email;
  final String role; // "student" or "alumni"
  final bool isVerified;

  AppUser({
    required this.userId,
    required this.name,
    required this.email,
    required this.role,
    this.isVerified = false,
  });

  /// Create from Firestore document
  factory AppUser.fromMap(Map<String, dynamic> map, String docId) {
    return AppUser(
      userId: docId,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      role: map['role'] ?? 'student',
      isVerified: map['isVerified'] ?? false,
    );
  }

  /// Convert to Firestore document
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'role': role,
      'isVerified': isVerified,
    };
  }

  bool get isStudent => role == 'student';
  bool get isAlumni => role == 'alumni';
}
