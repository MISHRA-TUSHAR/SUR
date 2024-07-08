// import 'dart:convert';
// import 'package:fpdart/fpdart.dart';
// import 'package:http/http.dart' as http;
// import 'package:sur/core/failure/failure.dart';
// import 'package:sur/features/auth/model/user_model.dart';

// class AuthRemoteRepository {
//   Future<Either<AppFailure, UserModel>> signup({
//     required String name,
//     required String email,
//     required String password,
//   }) async {
//     try {
//       final response = await http.post(
//         Uri.parse('http://10.0.2.2:8000/auth/signup'),
//         headers: {
//           'Content-Type': 'application/json',
//         },
//         body: jsonEncode(
//           {
//             'name': name,
//             'email': email,
//             'password': password,
//           },
//         ),
//       );
//       final resBodyMap = jsonDecode(response.body) as Map<String, dynamic>;
//       if (response.statusCode != 201) {
//         return Left(AppFailure(resBodyMap['message'] as String));
//       }
//       return Right(UserModel.fromMap(resBodyMap));
//     } catch (e) {
//       return Left(AppFailure(e.toString()));
//     }
//   }

//   Future<void> login({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       final response = await http.post(
//         Uri.parse('http://10.0.2.2:8000/auth/login'),
//         headers: {
//           'Content-Type': 'application/json',
//         },
//         body: jsonEncode(
//           {
//             'email': email,
//             'password': password,
//           },
//         ),
//       );

//       print('Response status: ${response.statusCode}');
//       print('Response body: ${response.body}');
//     } catch (e) {
//       print('Error during login: $e');
//     }
//   }
// }

import 'dart:convert';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:sur/core/constants/server_constant.dart';
import 'package:sur/core/failure/failure.dart';
import 'package:sur/features/auth/model/user_model.dart';

class AuthRemoteRepository {
  Future<Either<AppFailure, UserModel>> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('${ServerConstant.serverURL}/auth/signup'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
          {
            'name': name,
            'email': email,
            'password': password,
          },
        ),
      );

      // Check for valid JSON response
      final resBodyMap = jsonDecode(response.body) as Map<String, dynamic>?;

      if (resBodyMap == null) {
        return Left(AppFailure('Invalid response format'));
      }

      if (response.statusCode != 201) {
        final errorMessage = resBodyMap['message'] as String?;
        return Left(AppFailure(errorMessage ?? 'Unknown error occurred'));
      }

      return Right(UserModel.fromMap(resBodyMap));
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  Future<Either<AppFailure, UserModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('${ServerConstant.serverURL}/auth/login'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
          {
            'email': email,
            'password': password,
          },
        ),
      );

      final resBodyMap = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode != 200) {
        return Left(AppFailure(resBodyMap['detail']));
      }

      return Right(UserModel.fromMap(resBodyMap));
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}
