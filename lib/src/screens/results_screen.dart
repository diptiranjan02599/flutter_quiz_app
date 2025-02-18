import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/src/data/questions.dart';
import 'package:flutter_quiz_app/src/widgets/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  final List<String> chosenAnswers;
  final void Function() onRestart;

  const ResultsScreen({super.key, required this.chosenAnswers, required this.onRestart});

  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summary = getSummary();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summary.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
              style: GoogleFonts.lato(
                color: Color.fromARGB(255, 230, 200, 253),
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 30),
            QuestionsSummary(summaryData: summary),
            SizedBox(height: 30),
            TextButton.icon(
                onPressed: onRestart,
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white
                ),
                icon: Icon(Icons.refresh, color: Colors.white),
                label: Text('Restart Quiz!', style: GoogleFonts.lato())
            )
          ],
        ),
      ),
    );
  }
}
