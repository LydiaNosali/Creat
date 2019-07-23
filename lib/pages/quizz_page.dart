import 'package:flutter/material.dart';
import '../utils/questions.dart';
import '../utils/quiz.dart';
import '../UI/answer_button.dart';
import '../UI/question_text.dart';
import '../UI/right_wrong.dart';
import './score_page.dart';
class QuizzPage extends StatefulWidget {
  @override
  _QuizzPageState createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
  Question currentQuestion;
  Quizz quiz = new Quizz([
    new Question("Elon Mask is human", false),
    new Question("Pizza is healthy", false),
    new Question("Flutter is awesome", true),
  ]);
  String questionText;
  int questionNumber;
  bool isCorrect;
  bool overlayShouldbeinvisible = false;
  @override
  void initState() {
    super.initState();
    currentQuestion = quiz.nextquestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionnumber;
  }

  void handleAnswer(bool answer) {
    isCorrect = (currentQuestion.answer == answer);
    quiz.answer(isCorrect);
    this.setState(() {
      overlayShouldbeinvisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column(
          //this is our main page
          children: <Widget>[
            new AnswerButton(true, () => handleAnswer(true)),
            new QuestionText(questionText, questionNumber),
            new AnswerButton(false, () => handleAnswer(false)),
          ],
        ),
        overlayShouldbeinvisible == true
            ? new CorrectWrong(isCorrect, (){
              if (quiz.length == questionNumber) {
              Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new ScorePage(quiz.score, quiz.length)), (Route route) => route == null);
              return;
            }
            currentQuestion = quiz.nextquestion;
            this.setState(() {
              overlayShouldbeinvisible = false;
              questionText = currentQuestion.question;
              questionNumber = quiz.questionnumber;
            });
          })
            : new Container(),
      ],
    );
  }
}
