import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const Center(
          child: MyStatefulWidget(),
        ),
      ),
    );
  }
}

double _volume = 0.0;
double min = 0;
double max = 200.0;

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  void _volumeUp() {
    setState(() {
      if (_volume < max) _volume += 10;
    });
  }

  void _volumeDown() {
    setState(() {
      if (_volume > min) _volume -= 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.volume_down),
                tooltip: 'Decrease volume by 10',
                onPressed: () {
                  _volumeDown();
                },
              ),
              IconButton(
                icon: const Icon(Icons.volume_up),
                tooltip: 'Increase volume by 10',
                onPressed: () {
                  _volumeUp();
                },
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text('Volume : $_volume')
        ],
      ),
    );
  }
}
