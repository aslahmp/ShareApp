import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'ShareApp',
      theme: ThemeData(

        primarySwatch: Colors.blue,
        primaryColorDark: Colors.green[600],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FirstPg(),
    );
  }
}

class FirstPg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: choices.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('ShareApp'),
            bottom: TabBar(
              isScrollable: false,
              tabs: choices.map((Choice choice) {
                return Tab(

                  icon: Icon(choice.icon),
                );
              }).toList(),
            ),
          ),
            drawer: Drawer(

              child: ListView(

                padding: const EdgeInsets.all(0),
                children: <Widget>[
                  Container(
                    
                    height: 100,color: Colors.grey[200],),
//                  UserAccountsDrawerHeader(
//                    accountName: Text('abcd'),
//                    accountEmail: Text('abcd@gmail.com'),
//                    decoration: BoxDecoration(
//                      color: Colors.blue,
//                    ),
//                    currentAccountPicture: CircleAvatar(
//                      backgroundColor: Colors.purpleAccent,
//                    ),
//                  ),
                  InkWell(
                    onTap: () {

                    },
                    child: ListTile(
                      title: Text('Home'),
                      leading: Icon(Icons.home),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: ListTile(
                      title: Text('My Account'),
                      leading: Icon(Icons.person),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: ListTile(
                      title: Text('Settings'),
                      leading: Icon(Icons.settings),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: ListTile(
                      title: Text('Exit'),
                      leading: Icon(Icons.exit_to_app),
                    ),
                  ),
                ],
              ),
            ),
          body:Stack(
            alignment: Alignment.topLeft,
            children: <Widget>[
              Positioned(child:


          TabBarView(
            children: choices.map((Choice choice) {
              return Padding(
                padding: const EdgeInsets.all(0.0),
                child: ChoiceCard(choice: choice),
              );
            }).toList(),
          ),),

              Positioned(
                top:  420,
                left: 50,

                  child:FlatButton(onPressed: (){}, child:Column(children: <Widget>[ CircleAvatar(radius: 50,
                    child:Icon(Icons.file_upload,
                    size: 50,
                    color: Colors.white,),
                    backgroundColor: Colors.deepPurple[400],
                  ),
                    Text('Send',style: TextStyle(fontSize: 25),)

                  ],)
                  )),
              Positioned(
                top:  450,
                left: 230,

                child:FlatButton(onPressed: (){}, child: CircleAvatar(radius: 40,
    backgroundColor: Colors.deepPurple[400],
                  child:Center(
                    child: Column(

                      mainAxisAlignment: MainAxisAlignment.center,

                      children: <Widget>[Icon(Icons.file_download,
                    size: 30,
                    color: Colors.white,),


                Text('Receive',style: TextStyle(fontSize: 16,color: Colors.white),)

                ],),))),),
            ],
          )

        ),
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'History', icon: Icons.history),
  const Choice(title: 'App', icon: Icons.android),
  const Choice(title: 'Image', icon: Icons.image),
  const Choice(title: 'Video', icon: Icons.video_library),
  const Choice(title: 'Music', icon: Icons.queue_music),
  const Choice(title: 'Files', icon: Icons.folder),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.headline3;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(choice.icon, size: 128.0, color: textStyle.color),
            Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}




