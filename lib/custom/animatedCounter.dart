import 'package:flutter/material.dart';

class AnimatedCounter extends StatefulWidget {
  final int end;
  final Duration duration;
  final TextStyle? textStyle;

  const AnimatedCounter({
    Key? key,
    required this.end,
    this.duration = const Duration(seconds: 2),
    this.textStyle,
  }) : super(key: key);

  @override
  _AnimatedCounterState createState() => _AnimatedCounterState();
}

class _AnimatedCounterState extends State<AnimatedCounter> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this);
    _animation = Tween<double>(begin: 0, end: widget.end.toDouble()).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.forward();
  }

  @override
  void didUpdateWidget(AnimatedCounter oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.end != widget.end) {
      _animation = Tween<double>(
        begin: _animation.value,
        end: widget.end.toDouble(),
      ).animate(_controller);
      _controller
        ..reset()
        ..forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _animation.value.toInt().toString(),
      style: widget.textStyle,
    );
  }
}