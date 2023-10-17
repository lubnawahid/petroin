 import 'package:get/get.dart';
import 'package:http/http.dart' as http;
//
// class LoginController extends GetxController {
//   var isLoading = false.obs;
//
//   Future<void> login(String username, String password) async {
//     try {
//       isLoading(true);
//
//       final response = await http.post(
//         Uri.parse('https://www.petroinfotech.com/PetroHSE/api/Admin/ValidateLogin'),
//         body: {
//           "userName": username,
//           "password": password,
//           "authType": "FORMS",
//           "ipAddress": "",
//         },
//       );
//
//       if (response.statusCode == 200) {
//         // Handle the success case here
//         print('Login successful');
//       } else {
//         // Handle the error case here
//         print('Login failed');
//       }
//     } finally {
//       isLoading(false);
//     }
//   }
// }
class LoginController extends GetxController {
  var isLoading = false.obs;

  Future<void> login(String username, String password) async {
    try {
      isLoading(true);

      final response = await http.post(
        Uri.parse('https://www.petroinfotech.com/PetroHSE/api/Admin/ValidateLogin'),
        body: {
          "userName": username,
          "password": password,
          "authType": "FORMS",
          "ipAddress": "",
        },
      );

      if (response.statusCode == 200) {
        // Handle the success case here
        print('Login successful');
      } else {
        // Handle the error case here
        print('Login failed. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (error) {
      // Handle other errors, such as network issues
      print('Error during login: $error');
    } finally {
      isLoading(false);
    }
  }
}
