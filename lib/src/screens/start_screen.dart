import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {

  final void Function() startQuiz;
  const StartScreen(this.startQuiz, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          imageView(),
          const SizedBox(height: 80),
          imageTextView(),
          const SizedBox(height: 30),
          startButton()
        ],
      ),
    );
  }

  imageView() {
    return Image.asset(
      'assets/images/quiz-logo.png',
      width: 300,
      color: const Color.fromARGB(150, 255, 255, 255),
    );
  }

  imageTextView() {
    return DefaultTextStyle(
      style: TextStyle(
          fontSize: 28,
          color: Color.fromARGB(255, 237, 223, 252)
      ),
      child: Text('Learn Flutter the fun way!')
    );
  }

  startButton() {
    return OutlinedButton.icon(
        onPressed: startQuiz,
        style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
        icon: Icon(Icons.arrow_right_alt),
        label: Text('Start Quiz',
          style: GoogleFonts.lato(
              color: Color.fromARGB(255, 201, 153, 251),
              fontSize: 24,
              fontWeight: FontWeight.bold
          )
        )
    );
  }
}
