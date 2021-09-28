// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class GformWebView extends StatefulWidget {
//   const GformWebView({Key? key}) : super(key: key);

//   @override
//   _GformWebViewState createState() => _GformWebViewState();
// }

// class _GformWebViewState extends State<GformWebView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('GForm Web View'),
//       ),
//       body: (
//         onWebViewCreated: (WebViewController webViewController) async {
//           _webViewController = webViewController;
//           await _loadHtmlFormAssets();
//         },
//       ),
//     );
//   }

//   Future _loadHtmlFormAssets() async {
//     String fileText = await rootBundle.loadString('assets/gform.html');
//     _webViewController.loadUrl(Uri.dataFromString(fileText,
//             mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
//         .toString());
//   }
// }
