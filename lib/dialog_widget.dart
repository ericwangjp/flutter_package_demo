import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({
    super.key,
    this.title,
    this.msg,
    this.actions,
    this.customView = const SizedBox(),
    this.titleStyle,
    this.msgStyle,
    this.titleAlign,
    this.msgAlign,
    this.dialogWidth,
    this.color,
  });

  final List<Widget>? actions;

  final Widget customView;

  final String? title;

  final String? msg;

  final TextStyle? titleStyle;

  final TextStyle? msgStyle;

  final TextAlign? titleAlign;

  final TextAlign? msgAlign;

  final Color? color;

  final double? dialogWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: dialogWidth == null
          ? null
          : MediaQuery.of(context).size.width * dialogWidth!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          title != null
              ? Padding(
                  padding:
                      const EdgeInsets.only(right: 20, left: 20, top: 24.0),
                  child: Text(
                    title!,
                    style: titleStyle,
                    textAlign: titleAlign,
                  ),
                )
              : const SizedBox(
                  height: 4,
                ),
          msg != null
              ? Padding(
                  padding:
                      const EdgeInsets.only(right: 20, left: 20, top: 16.0),
                  child: Text(
                    msg!,
                    style: msgStyle,
                    textAlign: msgAlign,
                  ),
                )
              : const SizedBox(
                  height: 20,
                ),
          actions?.isNotEmpty == true
              ? buttons(context)
              : const SizedBox(
                  height: 20,
                ),
        ],
      ),
    );
  }

  Widget buttons(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(right: 20, left: 20, top: 16.0, bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(actions!.length, (index) {
          final TextDirection direction = Directionality.of(context);
          double padding = index != 0 ? 8 : 0;
          double rightPadding = 0;
          double leftPadding = 0;
          direction == TextDirection.rtl
              ? rightPadding = padding
              : leftPadding = padding;
          return Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: leftPadding, right: rightPadding),
              child: actions![index],
            ),
          );
        }),
      ),
    );
  }
}
