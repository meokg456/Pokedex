import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      loadData();
    });
  }

  void loadData() async {
    Navigator.pushReplacementNamed(context, '/main');
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 230,
            ),
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 50,
              child:
                  Image.asset('android/app/src/main/res/drawable/pokemon.png'),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'PokeDex',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(
              height: 150,
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xffe74c3c)),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Pokedex\n for pokemon trainer',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
