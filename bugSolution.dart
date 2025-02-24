```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>?> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return jsonData;
    } else {
      //Handle the specific HTTP error
      throw HttpException('HTTP Error: ${response.statusCode}', response.body);
    }
  } on SocketException catch (e) {
    // Handle socket exceptions (no internet connectivity)
    print('SocketException: $e');
    return null; // Or throw a custom exception
  } on FormatException catch (e) {
    //Handle JSON decoding errors
    print('JSON Format Exception: $e');
    return null; // Or throw a custom exception
  } on HttpException catch(e){
    //Handle HTTP Exceptions
    print('HTTP Exception: ${e.message} , Response Body: ${e.responseBody}');
    return null;
  } catch (e) {
    // Handle other exceptions
    print('Unexpected error: $e');
    rethrow; //Re-throw to allow higher-level handling
  }
}

class HttpException implements Exception {
  final String message;
  final String? responseBody;

  HttpException(this.message, this.responseBody);
}

```