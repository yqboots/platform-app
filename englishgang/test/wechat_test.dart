import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluwx/fluwx.dart' as fluwx;
import 'package:models/social/wechat/payment.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'English Gang',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'English Gang'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();

    fluwx.register(appId: "wxe477169329e9e2ae");
  }

  @override
  void dispose() {
    // fluwx.dispose();

    super.dispose();
  }

  void _openLoginPage() {}

  void _openWeChatAndPay() async {
    Dio dio = new Dio();

    Response response = await dio.get("http://192.168.31.201:8080/wechat/pay/initiate/D00000002/APP");
    // print(response.data.toString());

    InitiatePaymentRequest request = InitiatePaymentRequest.fromJson(response.data);
    // print(request);

    fluwx.pay(
      appId: request.appId,
      partnerId: request.partnerId,
      nonceStr: request.nonceStr,
      sign: request.sign,
      prepayId: request.prepayId,
      packageValue: request.packageValue,
      timeStamp: request.timeStamp,
    );
  }

  void _share() {}

  void _audioRecognize() {}

  void _imageRecognize() {}

  void _withdraw() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      child: const Text('微信登录'),
                      onPressed: _openLoginPage,
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      child: const Text('调起微信并支付'),
                      onPressed: _openWeChatAndPay,
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      child: const Text('微信分享'),
                      onPressed: _share,
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      child: const Text('语音识别'),
                      onPressed: _audioRecognize,
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      child: const Text('图像识别'),
                      onPressed: _imageRecognize,
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      child: const Text('提现到零钱'),
                      onPressed: _withdraw,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
