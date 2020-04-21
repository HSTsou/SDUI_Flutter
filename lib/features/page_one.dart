import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:flutter/material.dart';
import '../api_service.dart';

class PageOne extends StatefulWidget {
  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  String jsonString;


  @override
  void initState() {
    super.initState();
    getPageOneUIs().then((result) {
      setState(() {
        jsonString = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: FutureBuilder<Widget>(
          future: _buildWidget(context),
          builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
            }
            return snapshot.hasData
                ? SizedBox.expand(
                    child: snapshot.data,
                  )
                : Center(child: Text("Loading..."));
          },
        ),
      ),
    );
  }

  Future<Widget> _buildWidget(BuildContext context) async {
    return DynamicWidgetBuilder.build(
        jsonString, context, new DefaultClickListener());
  }
}

class DefaultClickListener implements ClickListener {
  @override
  void onClicked(String event) {
    print("Receive click event: " + event);
  }
}

