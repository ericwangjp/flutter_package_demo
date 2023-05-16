import 'package:flutter/material.dart';

import 'dialog_widget.dart';

class Dialogs {
  static const TextStyle titleStyle =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 16);

  static const Color bcgColor = Color(0xfffefefe);

  static const Widget holder = SizedBox(
    height: 0,
  );

  static const ShapeBorder dialogShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)));

  static const ShapeBorder bottomSheetShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16), topRight: Radius.circular(16)));

  /// 屏幕中弹出对话框
  static Future<void> materialDialog({
    required BuildContext context,
    Function(dynamic value)? onClose,
    String? title,
    String? msg,
    List<Widget>? actions,
    Widget customView = holder,
    bool barrierDismissible = true,
    Color? barrierColor = Colors.black54,
    String? barrierLabel,
    bool useSafeArea = true,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
    ShapeBorder dialogShape = dialogShape,
    TextStyle titleStyle = titleStyle,
    TextStyle? msgStyle,
    TextAlign? titleAlign,
    TextAlign? msgAlign,
    Color color = bcgColor,
    double? dialogWidth,
  }) async {
    await showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      barrierLabel: barrierLabel,
      useSafeArea: useSafeArea,
      useRootNavigator: useRootNavigator,
      routeSettings: routeSettings,
      builder: (context) {
        return Dialog(
          backgroundColor: color,
          shape: dialogShape,
          child: DialogWidget(
            title: title,
            dialogWidth: dialogWidth,
            msg: msg,
            actions: actions,
            customView: customView,
            titleStyle: titleStyle,
            msgStyle: msgStyle,
            titleAlign: titleAlign,
            msgAlign: msgAlign,
            color: color,
          ),
        );
      },
    ).then((value) => onClose?.call(value));
  }

  /// 底部弹出对话框
  static void bottomMaterialDialog({
    required BuildContext context,
    Function(dynamic value)? onClose,
    String? title,
    String? msg,
    List<Widget>? actions,
    Widget customView = holder,
    bool barrierDismissible = true,
    ShapeBorder dialogShape = bottomSheetShape,
    TextStyle titleStyle = titleStyle,
    TextStyle? msgStyle,
    Color color = bcgColor,
    bool isScrollControlled = false,
    bool useRootNavigator = false,
    bool isDismissible = true,
    bool enableDrag = true,
    RouteSettings? routeSettings,
    AnimationController? transitionAnimationController,
  }) {
    showModalBottomSheet(
      context: context,
      shape: dialogShape,
      backgroundColor: color,
      isScrollControlled: isScrollControlled,
      useRootNavigator: useRootNavigator,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      routeSettings: routeSettings,
      transitionAnimationController: transitionAnimationController,
      builder: (context) => DialogWidget(
        title: title,
        msg: msg,
        actions: actions,
        customView: customView,
        titleStyle: titleStyle,
        msgStyle: msgStyle,
        color: color,
      ),
    ).then((value) => onClose?.call(value));
  }
}
