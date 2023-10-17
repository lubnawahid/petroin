import 'dart:convert';
import 'package:http/http.dart' as http;

// Function to get the token from the login API
Future<String> getToken() async {
  // Make a request to your login API to get the token
  // Replace the URL and parameters accordingly
  var response = await http.post(
    Uri.parse('https://www.petroinfotech.com/PetroHSE/api/Admin/ValidateLogin'),
    body: {
      'username': 'afthab',
      'password': '12345678',
    },
  );

  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    return data['token']; // Assuming your token is in the 'token' field
  } else {
    throw Exception('Failed to get token');
  }
}

// Function to get data from the first API endpoint
Future<void> getDashboardData(String token, int userId) async {
  // Replace the URL and parameters accordingly
  var response = await http.get(
    Uri.parse('https://www.petroinfotech.com/PetroHSE/api/Audit/GetDashboardAuditList?UserCompany Code=1&loggedInUserID=$userId'),
    headers: {
      'Authorization': 'Bearer $token',
      'CompanyCode': '1',
      'UserId': userId.toString(),
      'appType': 'MOB',
      'content-type': 'application/json',
      'accept': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    // Process the data as needed
    print(data);
  } else {
    throw Exception('Failed to load data');
  }
}

// Function to get data from the second API endpoint
Future<void> getAuditList(String token, int userId) async {
  // Replace the URL and parameters accordingly
  var response = await http.get(
    Uri.parse('https://www.petroinfotech.com/PetroHSE/api/Audit/GetAuditList?mode=ALL&status=ALL'),
    headers: {
      'Authorization': 'Bearer $token',
      'CompanyCode': '1',
      'UserId': userId.toString(),
      'appType': 'MOB',
      'content-type': 'application/json',
      'accept': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    // Process the data as needed
    print(data);
  } else {
    throw Exception('Failed to load data');
  }
}

void main() async {
  try {
    // Get the token from the login API
    var token = await getToken();

    // Replace with the user ID obtained from the login API
    var userId = 610;

    // Call the first API endpoint
    await getDashboardData(token, userId);

    // Call the second API endpoint
    await getAuditList(token, userId);
  } catch (e) {
    print('Error: $e');
  }
}
