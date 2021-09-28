import 'package:flutter/material.dart';
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
              child: Text('iframe による描画(アンケート完了後サンプルページにリダイレクト)'),
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
              child: Text('Form の URL に直接アクセス'),
              onPressed: () async {
                try {
                  await launch(
                    'https://forms.gle/5ccCnLW7Eyy9YM6z6',
                  );
                } catch (e) {
                  print(e);
                }
              }),
        ],
      )),
    );
  }
}
