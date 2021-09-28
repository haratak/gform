import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FlutterWebViewPage extends StatefulWidget {
  const FlutterWebViewPage({Key? key}) : super(key: key);

  @override
  _FlutterWebViewPageState createState() => _FlutterWebViewPageState();
}

class _FlutterWebViewPageState extends State<FlutterWebViewPage> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlutterWebView'),
        actions: [
          IconButton(
            onPressed: () async {
              WebViewController controller = await _controller.future;
              String? url = await controller.currentUrl();
              print(url);
            },
            icon: Icon(Icons.info),
          )
        ],
      ),
      body: WebView(
        initialUrl: 'https://forms.gle/iLuZUF2ce4p5guC58',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
        onProgress: (int progress) {
          print("WebView is loading (progress : $progress%)");
        },
        // javascriptChannels: <JavascriptChannel>{
        //   _toasterJavascriptChannel(context),
        // },
        navigationDelegate: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            print('blocking navigation to $request}');
            return NavigationDecision.prevent;
          }
          print('allowing navigation to $request');
          return NavigationDecision.navigate;
        },
        onPageStarted: (String url) {
          print('Page started loading: $url');
        },
        onPageFinished: (String url) {
          print('Page finished loading: $url');
        },
        gestureNavigationEnabled: true,
      ),
    );
  }
}
