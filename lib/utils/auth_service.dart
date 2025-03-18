import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Verify Password
  bool verifyPassword({
    required String password,
    required String confirmPassword,
  }) {
    if (password == confirmPassword) {
      return true; // return true if passwords match
    } else {
      return false; // return false if passwords do not match
    }
  }

  // Signup Function
  Future<String?> signup({
    required String email,
    required String password,
    required String role,
  }) async {
    try {
      // Create user in firebase
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(
            email: email.trim(),
            password: password.trim(),
          );

      // Save additional data to user
      await _firestore.collection("users").doc(userCredential.user!.uid).set({
        "email": email.trim(),
        "role": role,
      });
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  // Login function
  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      // Login using email and password
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      // Fetch user's role
      DocumentSnapshot userDoc =
          await _firestore
              .collection("users")
              .doc(userCredential.user!.uid)
              .get();

      return userDoc["role"];
    } catch (e) {
      return e.toString();
    }
  }
}
