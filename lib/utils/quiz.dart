import './questions.dart';
class Quizz{
  List<Question> _questions;
  int _currentquestionindex = -1;
  int _score=0;
  Quizz(this._questions){
    _questions.shuffle();
  }
  List<Question> get questions => _questions;
  int get length => _questions.length;
  int get questionnumber => _currentquestionindex+1;
  int get score => _score;
  Question get nextquestion{
    _currentquestionindex++;
    if (_currentquestionindex>=length) return null;
    return _questions[_currentquestionindex];
  }
  void answer(bool isCorrect){
    if (isCorrect) _score++;
  }
}