import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:mqtt_client/mqtt_browser_client.dart' as mqtt_browser;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MQTT App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('MQTT App'),
        ),
        body: Center(
          child: ElevatedButton(
            child: Text('Connect to Broker'),
            onPressed: connectToBroker,
          ),
        ),
      ),
    );
  }

  void connectToBroker() {
    final client =
        mqtt_browser.MqttBrowserClient('mqtt.example.com', 'clientId');
    client.port = 1883;
    client.keepAlivePeriod = 30;

    client.onConnected = () {
      print('Connected to MQTT broker');
      // 接続が確立された後の処理を記述する
    };

    client.connect();
  }
}
