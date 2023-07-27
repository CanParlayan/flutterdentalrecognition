import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'prediction.dart';

abstract class ImageClassification {
  Future<List<Predictions>> classify(File image);

  Future<bool> checkForCavity(File image);
}

class ImageClassifier implements ImageClassification {
  ImageClassifier();

  @override
  Future<List<Predictions>> classify(File image) async {
    const url =
        'https://dentalprediction-prediction.cognitiveservices.azure.com/customvision/v3.0/Prediction/1b465330-89d1-4acf-90c3-a64f76114ad3/detect/iterations/Iteration3/image';
    final headers = {
      'Prediction-Key': '6c41e9fb16f64bf39c334fb6ae1761bc',
      'Content-Type': 'application/octet-stream',
    };

    var bytes = await image.readAsBytes();
    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: bytes,
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<dynamic> predictionsJson = data['predictions'];

      List<Predictions> predictions = predictionsJson
          .map((json) => Predictions.fromJson(json))
          .toList();

      return predictions;
    } else {
      throw Exception('Failed to classify image');
    }
  }

  @override
  Future<bool> checkForCavity(File image) async {
    const cavityUrl =
        'https://dentalprediction-prediction.cognitiveservices.azure.com/customvision/v3.0/Prediction/b874109f-ffeb-428f-a30b-a9db47b75f26/classify/iterations/Iteration1/image';
    final cavityHeaders = {
      'Prediction-Key': '6c41e9fb16f64bf39c334fb6ae1761bc',
      'Content-Type': 'application/octet-stream',
    };

    var cavityBytes = await image.readAsBytes();
    var cavityResponse = await http.post(
      Uri.parse(cavityUrl),
      headers: cavityHeaders,
      body: cavityBytes,
    );

    if (cavityResponse.statusCode == 200) {
      var cavityData = jsonDecode(cavityResponse.body);
      bool hasCavity = cavityData['hasCavity'] ?? false;
      return hasCavity;
    } else {
      throw Exception('Failed to check for cavity');
    }
  }
}
