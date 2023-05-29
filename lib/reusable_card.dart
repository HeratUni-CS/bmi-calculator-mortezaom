import 'package:bmi_starting/theme.dart';
import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Widget child;
  final int flex;
  final bool bgColor;
  final Color? bg;
  final bool margin;
  final Function()? onTap;
  const ReusableCard({
    super.key,
    required this.child,
    this.flex = 3,
    this.bgColor = true,
    this.margin = true,
    this.bg,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: GestureDetector(
        onTap: () => onTap?.call(),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          decoration: BoxDecoration(
            color: (bgColor) ? bg ?? kItemBackgroundColor : null,
            borderRadius: BorderRadius.circular(10),
          ),
          margin: margin ? const EdgeInsets.all(12).copyWith(top: 0) : null,
          child: child,
        ),
      ),
    );
  }
}
