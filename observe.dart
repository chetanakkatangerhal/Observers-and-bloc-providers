import 'package:flutter_observer/Observable.dart';
import 'package:flutter_observer/Observer.dart';

///Accept notification page
class APageState extends State<APage> with Observer{
  @override
    void initState() {
      Observable.instance.addObserver(this);
      super.initState();
    }
 @override
  void dispose() {
    Observable.instance.removeObserver(this);
    super.dispose();
  }
  @override
   update(Observable observable,String notifyName, Map map) {
    ///do your work
      setState(() {
      });
    }
}

///Send notification page
class CPage extends StatefulWidget {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(height: 100, child: Center(child: Text("C"))),
          RaisedButton(
              onPressed: () {
                ///Called where you need to send a notification
                Map map = Map();
                map["background"] = Colors.green;
                ///Observable.instance.notifyObservers(null);
                Observable.instance.notifyObservers([
                  "APageState",
                ], notifyName : "notifyName",map: map);
              },
              child: Text("APageState")),
        ],
      ),
    );
  }
}

