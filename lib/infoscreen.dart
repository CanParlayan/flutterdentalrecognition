import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('ATTENTION !'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
              "When taking the photo, \nplease make sure your teeth are clearly visible and your camera's flash is on and the light does not cast a shadow."),
          CheckboxListTile(
            title: const Text("Don't show again"),
            value: _isChecked,
            onChanged: (value) {
              setState(() {
                _isChecked = value!;
              });
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            if (_isChecked) {
              _saveInfoScreenPreference();
            }
          },
          child: const Text('OK'),
        ),
      ],
    );
  }

  void _saveInfoScreenPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('showInfoScreen', false);
  }
}