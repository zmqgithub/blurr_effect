import 'package:flutter/material.dart';
import 'dart:ui' as ui;

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: new MyHomePage(title: 'Blurr Background'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    List list = ['Introduction','Early life', 'Non-Film work', '2012-present', 'Controversy'];
    return new Container(
      child: new Stack(
        fit: StackFit.expand,
        children: <Widget>[

        new Image.asset('assets/bg_img.jpg', fit: BoxFit.fitHeight,),
        new Scaffold(
          appBar: new AppBar(
            title: new Text(widget.title),
            elevation: 0.0,
            backgroundColor: const Color(0xFFB4C56C).withOpacity(0.5),
          ),
          backgroundColor: Colors.transparent,
          body: new Center(
            child: new Center(
              child: new BackdropFilter(
                    filter: new ui.ImageFilter.blur(
                      sigmaX: 6.0,
                      sigmaY: 6.0,
                    ),
                    child: new Container(
                      margin: EdgeInsets.all(20.0),
                      padding: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFFB4C56C).withOpacity(0.01),
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                      child: new Container(child: ListView.builder(itemBuilder: (contex, index){
                        return index == 0?new Container(
                          height: 50.0,
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 12.0),
                          decoration: BoxDecoration(
                            color: const Color(0xFFB4C56C).withOpacity(0.7),
                            borderRadius: BorderRadius.all(Radius.circular(25.0)),
                              boxShadow: [new BoxShadow(color: Colors.black12,offset: new Offset(2.0, 2.0), blurRadius: 2.0 )]
                          ),child: new Row(children: <Widget>[
                            new Icon(Icons.info, color: Colors.white,),
                          new SizedBox(width: 8.0),
                          new Text(list[index], style: TextStyle(color: Colors.white70, fontSize: 18.0))
                        ],),
                        ):new ListTile(title: new Text(list[index], style: TextStyle(color: Colors.white),), leading: new Text('${index}',
                            style: TextStyle(color: const Color(0xFFB4C56C), fontSize: 18.0)),);
                      }, itemCount: list.length,),),
                    ),
                  ),
                ),
          ),
        )
      ],),
    );

  }
}
