import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ncard(),
    ));

class ncard extends StatelessWidget {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: WebView(
        initialUrl: 'http://192.168.0.5:5000/',
        javascriptMode: JavascriptMode.unrestricted,
        gestureNavigationEnabled: true,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
        navigationDelegate: (request) {
          bool isHost = request.url
              .startsWith("http://192.168.0.5:5000/");
          if (isHost)
            return NavigationDecision.navigate;
          else
            return NavigationDecision.prevent;
        },
      ),
    ));
  }
}
