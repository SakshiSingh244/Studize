import 'package:flutter/material.dart';

class SlidingButton extends StatefulWidget {
  final bool isOn;
  final VoidCallback onToggle;

  const SlidingButton({
    Key? key,
    required this.isOn,
    required this.onToggle,
  }) : super(key: key);

  @override
  _SlidingButtonState createState() => _SlidingButtonState();
}

class _SlidingButtonState extends State<SlidingButton> {
  late bool _isOn;

  @override
  void initState() {
    super.initState();
    _isOn = widget.isOn;
  }

  void _toggle() {
    setState(() {
      _isOn = !_isOn;
    });
    widget.onToggle();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggle,
      child: Container(
        width: 55.0,
        height: 30.0,
        decoration: BoxDecoration(
          color: _isOn ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              left: _isOn ? 25.0 : 0.0,
              child: Container(
                width: 30.0,
                height: 30.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
