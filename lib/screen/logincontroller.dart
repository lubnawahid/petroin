import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:petro/screen/screen2.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;

  Future<void> login(String userName, String password) async {
    isLoading(true);

    final response = await http.post(
      Uri.parse('https://www.petroinfotech.com/PetroHSE/api/Admin/ValidateLogin'),
      body: {
        "userName": userName,
        "password": password,
        "authType": "FORMS",
        "ipAddress": "",
      },
    );

    isLoading(false);

    if (response.statusCode == 200) {
      // Handle successful login, e.g., navigate to the next screen
      Get.to(() => Dashboard());
    } else {
      // Handle login failure, show an error message
      Get.snackbar('Login Failed', 'Invalid username or password');
    }
  }
}