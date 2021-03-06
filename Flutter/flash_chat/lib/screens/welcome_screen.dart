import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/components/main_button.dart';


class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    // animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    controller.forward();
    // animation.addStatusListener(
    //   (status) {
    //     if (status == AnimationStatus.completed) {
    //       controller.reverse(from: 1);
    //     } else if (status == AnimationStatus.dismissed) {
    //       controller.forward();
    //     }
    //   },
    // );

    controller.addListener(
      () {
        setState(() {});
        // print(controller.value);
      },
    );

    @override
    // ignore: unused_element
    void dispose() {
      controller.dispose();
      super.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Flash Chat ',
                      textStyle: TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.black87,
                      ),
                      speed: const Duration(milliseconds: 100),
                    ),
                  ],
                  isRepeatingAnimation: false,
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            mainButtonMaker(
                'Log In', Colors.lightBlueAccent, '/login', context),
            mainButtonMaker('Register', Colors.blueAccent, '/regis', context),
          ],
        ),
      ),
    );
  }
}

// Padding mainButtonMaker(String buttonName, Color buttonColor,
//     String pressAction, BuildContext context) {
//   return Padding(
//     padding: EdgeInsets.symmetric(vertical: 16.0),
//     child: Material(
//       color: buttonColor,
//       borderRadius: BorderRadius.circular(30.0),
//       elevation: 5.0,
//       child: MaterialButton(
//         onPressed: () {
//           //Go to registration screen.
//           Navigator.pushNamed(context, pressAction);
//         },
//         minWidth: 200.0,
//         height: 42.0,
//         child: Text(
//           buttonName,
//         ),
//       ),
//     ),
//   );
// }


// Padding(
//               padding: EdgeInsets.symmetric(vertical: 16.0),
//               child: Material(
//                 color: Colors.blueAccent,
//                 borderRadius: BorderRadius.circular(30.0),
//                 elevation: 5.0,
//                 child: MaterialButton(
//                   onPressed: () {
//                     //Go to registration screen.
//                     Navigator.pushNamed(context, '/regis');
//                   },
//                   minWidth: 200.0,
//                   height: 42.0,
//                   child: Text(
//                     'Register',
//                   ),
//                 ),
//               ),
//             ),
          