import 'dart:developer';

import "package:http/http.dart" as http;

Future<String> getPageOneUIs() async {
//  final http.Response response = await http.get('');
//  if (response.statusCode != 200) {
//    print(
//        'getPageOneUIs failed ${response.statusCode} response: ${response.body}');
//    return null ; //TODO default UI json
//  }
//
//  String rawJson = '${response.body}';

//  String child = getPika(childCount: 66);
//  return getGridView(children: child);
  log(getListView(children: getPageContent()));

  return getListView(children: getPageContent());
}

String getPageContent() {
  var result = new StringBuffer();
  result.write(getPicture());
  result.write(getText());
  result.write(getSpace());
  result.write(getPrice());
  result.write(getSpace());
  result.write(getSpace());
  result.write(getSomethingRow());
  result.write(getSpace(height: "18.0"));
  result.write(getText(title: "其他推薦商品", alignment: "start"));
  result.write(getGridView(children: getPika(childCount:  31)));
  result.write(getEnd());
  return result.toString();
}

String getListView({String children = ""}) {
  return '''
        {
          "type": "ListView",
          "padding": "10, 10, 10, 10",
          "children": [
              $children
          ]
        }
  ''';
}

String getPicture() {
  return '''
        {
          "type": "NetworkImage",
          "src": "https://www.pcone.com.tw/thumbM/uploads/product_image/6804082/ae7a366b1a46729eeab73fac11a0f014/b8c59a6af323994d4fdcff2f90456b82.jpg",
          "click_event": "click the top pic"
        },       
  ''';
}

String getText({String title = 'Switch 動物之森',alignment = "center" }) {
  return '''
        {
          "type": "Container",
          "color": "#00FF00FF",
          "alignment": "$alignment",
          "child": {
            "type": "Text",
            "data": "$title",
            "maxLines": 3,
            "overflow": "ellipsis",
            "style": {
              "color": "#030303",
              "fontSize": 22.0,
              "fontWeight": "bold",
              "decoration": "none"
            }
          }
        },
  ''';
}

String getPrice({String originalPrice = "1980", String price = "880"}) {
  return '''
       {
          "type": "Container",
          "color": "#00FF00FF",
          "alignment": "center",
          "child": {
            "type": "Text",
            "data": "$originalPrice",
            "maxLines": 3,
            "overflow": "ellipsis",
            "style": {
              "color": "#030303",
              "fontSize": 16.0,
              "fontWeight": "bold",
              "decoration": "lineThrough"
            }
          }
        },
        {
          "type": "Container",
          "color": "#00FF00FF",
          "alignment": "center",
          "child": {
            "type": "Text",
            "data": "$price",
            "maxLines": 3,
            "overflow": "ellipsis",
            "style": {
              "color": "#f54242",
              "fontSize": 20.0,
              "fontWeight": "bold",
              "decoration": "none"
            }
          }
        },
  ''';
}

String getSpace({String height = "10.0", String width = "10.0"}) {
  return '''
        {
          "type": "Container",
          "color": "#00FF00FF",
          "alignment": "center",
          "height": $height,
          "width": $width
        },    
  ''';
}

String getSomethingRow() {
  return '''
       {
          "type": "Row",
          "mainAxisAlignment": "spaceAround",
          "children": [
            {
              "type": "Icon",
              "data": "favorite",
              "color": "#FFC0CB",
              "size": 24.0,
              "semanticLabel": "Text to announce in accessibility modes"
            },
            {
              "type": "Icon",
              "data": "audiotrack",
              "color": "#008000",
              "size": 30.0
            },
            {
              "type": "Icon",
              "data": "beach_access",
              "color": "#0000FF",
              "size": 36.0
            }
          ]
        },   
  ''';
}

String getEnd({String height = "4.0", String width = "10.0"}) {
  return '''
        {
          "type": "Container",
          "color": "#00FF00FF",
          "alignment": "center",
          "height": 4.0,
          "width": 4.0
        }    
  ''';
}

String getGridView({int crossAxisCount = 3, String children = ""}) {
  return '''
  {
    "type": "GridView",
    "crossAxisCount": $crossAxisCount,
    "padding": "10, 10, 10, 10",
    "shrinkWrap": true,
    "mainAxisSpacing": 4.0,
    "crossAxisSpacing": 4.0,
    "childAspectRatio": 1.6,
    "children":[
      ${children}
    ]
  },
''';
}

String getPika({int childCount = 10}) {
  var result = new StringBuffer();
  for (int i = 0; i < childCount; i++) {
    result.write('''
    {
      "type": "Container",
      "color": "#FFFFFF",
      "alignment": "center",
      "child": {
        "type": "NetworkImage",
        "src": "https://stickershop.line-scdn.net/stickershop/v1/product/12797/LINEStorePC/main.png;compress=true",
        "click_event": "pika ${i}"
      }
    }
    ''');

    if (i != childCount - 1) {
      result.write(',');
    }
  }

  return result.toString();
}
