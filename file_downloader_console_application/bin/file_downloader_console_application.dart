import 'package:file_downloader_console_application/file_downloader_console_application.dart'
    as file_downloader_console_application;
import 'dart:io';
import 'package:http/http.dart' as http;

void main(List<String> arguments) async {
  print('Hello world: ${file_downloader_console_application.calculate()}!');
  // Define the URL of the file you want to download
  // final fileUrl = 'https://file-examples.com/storage/fe6147cf186480856978350/2017/11/file_example_MP3_1MG.mp3';
  // final fileUrl = 'https://file-examples.com/storage/fe6147cf186480856978350/2017/04/file_example_MP4_480_1_5MG.mp4';
  // final fileUrl = 'https://file-examples.com/storage/fe6147cf186480856978350/2017/10/file-example_PDF_500_kB.pdf';
  // final fileUrl = 'https://file-examples.com/wp-content/storage/2017/10/file_example_TIFF_1MB.tiff';
  // final fileUrl = 'https://file-examples.com/storage/fe6147cf186480856978350/2017/10/file_example_PNG_1MB.png';
  // final fileUrl = 'https://file-examples.com/storage/fe6147cf186480856978350/2020/03/file_example_SVG_20kB.svg';
  final fileUrl =
      'https://file-examples.com/wp-content/storage/2017/02/zip_5MB.zip';
  // Define the destination folder to save the downloaded file
  // final destinationFolder = '/path/to/destination/folder';
  final destinationFolder = 'D://dart_console_download_file';

  // Create the destination folder if it doesn't exist
  Directory(destinationFolder).createSync(recursive: true);

  // Extract the file name from the URL
  final fileName = fileUrl.split('/').last;

  // Create a file instance representing the destination file
  final destinationFile = File('$destinationFolder/$fileName');

  try {
    // Send a GET request to download the file
    final response = await http.get(Uri.parse(fileUrl));

    // Check if the request was successful (status code 200)
    if (response.statusCode == 200) {
      // Write the downloaded file to the destination
      await destinationFile.writeAsBytes(response.bodyBytes);
      print('File downloaded successfully.');
    } else {
      print('Failed to download file. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error occurred while downloading the file: $e');
  }
}
