import 'package:flutter/material.dart';

class QuestionText extends StatefulWidget {
  final String _question;
  final int _questionnumber;
  QuestionText(this._question,this._questionnumber);

  @override
  _QuestionTextState createState() => _QuestionTextState();
}

class _QuestionTextState extends State<QuestionText> with SingleTickerProviderStateMixin {
  Animation<double> _fontSizeAnimation; 
  AnimationController _fontSizeAnimationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fontSizeAnimationController = new AnimationController(duration: new Duration(milliseconds: 500), vsync: this );
    _fontSizeAnimation = new CurvedAnimation(parent: _fontSizeAnimationController,curve: Curves.bounceOut);
    _fontSizeAnimation.addListener(()=>this.setState((){}));
    _fontSizeAnimationController.forward();
  }
  @override
  void dispose() {
    _fontSizeAnimationController.dispose();
    super.dispose();
  }
  
  @override
  void didUpdateWidget(QuestionText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget._question != widget._question) {
      _fontSizeAnimationController.reset();
      _fontSizeAnimationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
        color: Colors.white,
          child: new Padding(
            padding: new EdgeInsets.symmetric(vertical: 20.0),
            child: new Center(
              child: new Text('Statement '+widget._questionnumber.toString()+" , "+widget._question,
              style: new TextStyle(fontSize: _fontSizeAnimation.value * 15),),), 
              ));
            
  }
}
