import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/src/widgets/question_identifier.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryItem extends StatelessWidget {
  final Map<String, Object> itemData;

  const SummaryItem({super.key, required this.itemData});

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer = itemData['user_answer'] == itemData['correct_answer'];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(
            questionIndex: itemData['question_index'] as int,
            isCorrectAnswer: isCorrectAnswer
        ),
        SizedBox(width: 20),
        Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemData['question'] as String,
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 5),
                Text(itemData['user_answer'] as String,
                  style: TextStyle(
                    color: Color.fromARGB(255, 202, 171, 252)
                  ),
                ),
                Text(itemData['correct_answer'] as String,
                style: TextStyle(
                  color: Color.fromARGB(255, 181, 254, 246)
                )
                )
              ],
            )
        )
      ],
    );
  }

}