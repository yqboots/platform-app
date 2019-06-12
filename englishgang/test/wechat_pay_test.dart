import 'package:flutter/material.dart';
import 'package:fluwx/fluwx.dart' as fluwx;

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

  void _pay() {
    fluwx.pay(
      appId: 'wxe477169329e9e2ae',
      partnerId: '1536184451',
      nonceStr: '9fhj7ye41fycg7i9vbaddc0z9r43qb74',
      sign: 'C93B66D159023907D406C843EDD2A37A',
      prepayId: 'wx130045194745681add0a93881956491000',
      packageValue: 'Sign=WXPay',
      timeStamp: 1560360455
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('WeChat Pay Test'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pay,
        tooltip: 'WeChat Pay',
        child: Icon(Icons.payment),
      ),
    );
  }
}
