import 'package:flutter/material.dart';
import 'package:gform/flutter_webview_page.dart';
import 'package:url_launcher/url_launcher.dart';

class RootPage extends StatelessWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('gform'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              child: Text('iframe'),
              onPressed: () async {
                try {
                  await launch(
                    'https://gform-hosting.web.app/',
                  );
                } catch (e) {
                  print(e);
                }
              }),
          ElevatedButton(
              child: Text('Url Launcher'),
              onPressed: () async {
                try {
                  await launch(
                    'https://forms.gle/5ccCnLW7Eyy9YM6z6',
                  );
                } catch (e) {
                  print(e);
                }
              }),
          ElevatedButton(
            child: Text('Flutter WebView'),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => FlutterWebViewPage(),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
