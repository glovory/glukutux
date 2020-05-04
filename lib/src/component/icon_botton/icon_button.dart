import 'package:flutter/material.dart';
import 'package:glukutux/src/model/colors.dart';

import '../../model/params.dart';

class TuxIconButton extends StatelessWidget {
  /// The size of the button
  final TuxWidgetSize tuxWidgetSize;

  /// The color of the button
  final Color color;

  /// The color for the button when it has input focus.
  final Color focusColor;

  /// The color when a pointer is hovering over it
  final Color hoverColor;

  /// The color when button is disable
  final Color disableColor;

  /// The color of border button
  final Color borderColor;

  /// The size of border width
  final double borderWidth;

  /// The size of botton height
  final double height;

  /// The size of botton width
  final double width;

  /// The size of  icon
  final double iconSize;

  /// The color of icon
  final Color colorIcon;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode focusNode;

  /// The appearance of button. It can be either filled, outline, or ghost.
  final TuxAppearance tuxAppearance;

  /// The status of button. It can impact the color button
  final TuxStatus tuxStatus;

  /// the shape of button.
  final TuxShape tuxShape;

  /// Icon on the left of button
  final Icon icon;

  /// Call this method when the button is pressed
  final VoidCallback onPressed;

  /// Padding to use inside the button.
  final EdgeInsetsGeometry padding;

  /// Radius to use rounded of button.
  final double radius;

  const TuxIconButton({
    @required this.onPressed,
    @required this.icon,
    this.tuxAppearance = TuxAppearance.filled,
    this.tuxShape = TuxShape.rounded,
    this.tuxStatus,
    this.padding,
    this.radius = 10,
    this.tuxWidgetSize,
    this.color,
    this.focusColor,
    this.hoverColor,
    this.disableColor = TuxColor.disable_background,
    this.focusNode,
    this.height,
    this.width,
    this.borderColor,
    this.borderWidth = 1.5,
    this.iconSize = 15,
    this.colorIcon,
  });

  const TuxIconButton.filled({
    @required this.onPressed,
    @required this.icon,
    this.tuxShape = TuxShape.rounded,
    this.tuxStatus,
    this.padding,
    this.radius = 10,
    this.tuxWidgetSize,
    this.color,
    this.focusColor,
    this.hoverColor,
    this.disableColor = TuxColor.disable_background,
    this.focusNode,
    this.height,
    this.width,
    this.borderColor,
    this.borderWidth = 1.5,
    this.iconSize = 13,
    this.colorIcon,
  }) : this.tuxAppearance = TuxAppearance.filled;

  const TuxIconButton.outline({
    @required this.onPressed,
    @required this.icon,
    this.tuxShape = TuxShape.rounded,
    this.tuxStatus,
    this.padding,
    this.radius = 10,
    this.tuxWidgetSize,
    this.color,
    this.focusColor,
    this.hoverColor,
    this.disableColor = TuxColor.disable_background,
    this.focusNode,
    this.height,
    this.width,
    this.borderColor,
    this.borderWidth = 1.5,
    this.iconSize = 13,
    this.colorIcon,
  }) : this.tuxAppearance = TuxAppearance.outline;

  const TuxIconButton.ghost({
    @required this.onPressed,
    @required this.icon,
    this.tuxShape = TuxShape.rounded,
    this.tuxStatus,
    this.padding,
    this.tuxWidgetSize,
    this.color,
    this.focusColor,
    this.hoverColor,
    this.disableColor = TuxColor.disable_background,
    this.focusNode,
    this.height,
    this.width,
    this.borderColor,
    this.borderWidth = 0,
    this.iconSize = 13,
    this.colorIcon,
  })  : this.tuxAppearance = TuxAppearance.ghost,
        this.radius = 10;

  /// Shape of widget
  BorderRadius borderRadiusButton({TuxShape tuxShape}) {
    switch (tuxShape) {
      case TuxShape.square:
        return BorderRadius.circular(0);
      case TuxShape.circle:
        return BorderRadius.circular(100);
      case TuxShape.rounded:
        return BorderRadius.circular(radius);
      case TuxShape.roundedTop:
        return BorderRadius.vertical(top: Radius.circular(radius));
      case TuxShape.roundedBottom:
        return BorderRadius.vertical(bottom: Radius.circular(radius));
      case TuxShape.roundedLeft:
        return BorderRadius.horizontal(left: Radius.circular(radius));
      case TuxShape.roundedRight:
        return BorderRadius.horizontal(right: Radius.circular(radius));
      default:
        return BorderRadius.circular(0);
    }
  }

  /// Display this widget if appearance is filled
  Widget buttonFilled(BuildContext context) {
    return Semantics(
      button: true,
      enabled: onPressed != null,
      child: Focus(
        focusNode: focusNode,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 60, maxHeight: 60),
          child: Container(
            padding: padding,
            height: tuxWidgetSize != null
                ? heightButton(size: tuxWidgetSize)
                : height,
            width: tuxWidgetSize != null
                ? widthButton(size: tuxWidgetSize)
                : width,
            decoration: BoxDecoration(
                color: onPressed == null
                    ? TuxColor.disable_background
                    : (tuxStatus != null)
                        ? TuxColorUtils.colorByStatus(
                            tuxStatus: tuxStatus,
                            defaultColor: Theme.of(context).buttonColor,
                          )
                        : color,
                borderRadius: borderRadiusButton(tuxShape: tuxShape),
                border: Border.all(
                    color: onPressed == null
                        ? TuxColor.disable_font
                        : (tuxStatus != null)
                            ? TuxColorUtils.colorByStatus(
                                tuxStatus: tuxStatus,
                                defaultColor: Theme.of(context).buttonColor,
                              )
                            : borderColor,
                    width: borderWidth)),
            child: InkResponse(
              onTap: onPressed,
              focusColor: (tuxStatus != null)
                  ? TuxColorUtils.focusColorByStatus(
                      tuxStatus: tuxStatus,
                      defaultColor: Theme.of(context).buttonColor,
                    )
                  : focusColor,
              hoverColor: (tuxStatus != null)
                  ? TuxColorUtils.hoverColorByStatus(
                      tuxStatus: tuxStatus,
                      defaultColor: Theme.of(context).buttonColor,
                    )
                  : hoverColor,
              highlightColor: (tuxStatus != null)
                  ? TuxColorUtils.hoverColorByStatus(
                      tuxStatus: tuxStatus,
                      defaultColor: Theme.of(context).buttonColor,
                    )
                  : hoverColor,
              splashColor: (tuxStatus != null)
                  ? TuxColorUtils.hoverColorByStatus(
                      tuxStatus: tuxStatus,
                      defaultColor: Theme.of(context).buttonColor,
                    )
                  : hoverColor,
              child: IconTheme.merge(
                data: IconThemeData(
                  size: tuxWidgetSize != null
                      ? getIconSize(size: tuxWidgetSize)
                      : iconSize,
                  color: onPressed == null
                      ? TuxColor.disable_font
                      : colorIcon == null ? TuxColor.white : colorIcon,
                ),
                child: icon,
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Display this widget if appearance is outline
  Widget buttonOutline(BuildContext context) {
    return Semantics(
      button: true,
      enabled: onPressed != null,
      child: Focus(
        focusNode: focusNode,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 60, maxHeight: 60),
          child: Container(
            padding: padding,
            height: tuxWidgetSize != null
                ? heightButton(size: tuxWidgetSize)
                : height,
            width: tuxWidgetSize != null
                ? widthButton(size: tuxWidgetSize)
                : width,
            decoration: BoxDecoration(
                color: onPressed == null
                    ? TuxColor.disable_background
                    : TuxColor.transparent,
                borderRadius: borderRadiusButton(tuxShape: tuxShape),
                border: Border.all(
                    color: onPressed == null
                        ? TuxColor.disable_font
                        : (tuxStatus != null)
                            ? TuxColorUtils.colorByStatus(
                                tuxStatus: tuxStatus,
                                defaultColor: Theme.of(context).buttonColor,
                              )
                            : borderColor,
                    width: borderWidth)),
            child: InkResponse(
              onTap: onPressed,
              focusColor: (tuxStatus != null)
                  ? TuxColorUtils.focusColorByStatus(
                      tuxStatus: tuxStatus,
                      defaultColor: Theme.of(context).buttonColor,
                    )
                  : focusColor,
              hoverColor: (tuxStatus != null)
                  ? TuxColorUtils.hoverColorByStatus(
                      tuxStatus: tuxStatus,
                      defaultColor: Theme.of(context).buttonColor,
                    )
                  : hoverColor,
              highlightColor: (tuxStatus != null)
                  ? TuxColorUtils.hoverColorByStatus(
                      tuxStatus: tuxStatus,
                      defaultColor: Theme.of(context).buttonColor,
                    )
                  : hoverColor,
              splashColor: (tuxStatus != null)
                  ? TuxColorUtils.hoverColorByStatus(
                      tuxStatus: tuxStatus,
                      defaultColor: Theme.of(context).buttonColor,
                    )
                  : hoverColor,
              child: IconTheme.merge(
                data: IconThemeData(
                  size: tuxWidgetSize != null
                      ? getIconSize(size: tuxWidgetSize)
                      : iconSize,
                  color: onPressed == null
                      ? TuxColor.disable_font
                      : TuxColorUtils.colorByStatus(
                          tuxStatus: tuxStatus, defaultColor: TuxColor.primary),
                ),
                child: icon,
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Display this widget if appearance is ghost
  Widget buttonGhost(BuildContext context) {
    return Semantics(
      button: true,
      enabled: onPressed != null,
      child: Focus(
        focusNode: focusNode,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 60, maxHeight: 60),
          child: Container(
            padding: padding,
            height: tuxWidgetSize != null
                ? heightButton(size: tuxWidgetSize)
                : height,
            width: tuxWidgetSize != null
                ? widthButton(size: tuxWidgetSize)
                : width,
            decoration: BoxDecoration(
                color: onPressed == null
                    ? TuxColor.disable_background
                    : TuxColor.transparent,
                borderRadius: borderRadiusButton(tuxShape: tuxShape),
                border: Border.all(
                    color: onPressed == null
                        ? TuxColor.disable_background
                        : TuxColor.transparent,
                    width: borderWidth)),
            child: InkResponse(
              onTap: onPressed,
              focusColor: (tuxStatus != null)
                  ? TuxColorUtils.focusColorByStatus(
                      tuxStatus: tuxStatus,
                      defaultColor: Theme.of(context).buttonColor,
                    )
                  : focusColor,
              hoverColor: (tuxStatus != null)
                  ? TuxColorUtils.hoverColorByStatus(
                      tuxStatus: tuxStatus,
                      defaultColor: Theme.of(context).buttonColor,
                    )
                  : hoverColor,
              highlightColor: (tuxStatus != null)
                  ? TuxColorUtils.hoverColorByStatus(
                      tuxStatus: tuxStatus,
                      defaultColor: Theme.of(context).buttonColor,
                    )
                  : hoverColor,
              splashColor: (tuxStatus != null)
                  ? TuxColorUtils.hoverColorByStatus(
                      tuxStatus: tuxStatus,
                      defaultColor: Theme.of(context).buttonColor,
                    )
                  : hoverColor,
              child: IconTheme.merge(
                data: IconThemeData(
                  size: tuxWidgetSize != null
                      ? getIconSize(size: tuxWidgetSize)
                      : iconSize,
                  color: onPressed == null
                      ? TuxColor.disable_font
                      : TuxColorUtils.colorByStatus(
                          tuxStatus: tuxStatus, defaultColor: TuxColor.primary),
                ),
                child: icon,
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Button by appearance
  Widget tuxIconButton(BuildContext context) {
    switch (tuxAppearance) {
      case TuxAppearance.filled:
        return buttonFilled(context);
      case TuxAppearance.outline:
        return buttonOutline(context);
      case TuxAppearance.ghost:
        return buttonGhost(context);
      default:
        return buttonFilled(context);
    }
  }

  double heightButton({TuxWidgetSize size}) {
    switch (tuxWidgetSize) {
      case TuxWidgetSize.small:
        return 30.0;
      case TuxWidgetSize.giant:
        return 45.0;
      case TuxWidgetSize.large:
        return 40.0;
      case TuxWidgetSize.medium:
        return 35.0;
      case TuxWidgetSize.tiny:
        return 25.0;
      default:
        return 35;
    }
  }

  double widthButton({TuxWidgetSize size}) {
    switch (tuxWidgetSize) {
      case TuxWidgetSize.small:
        return 30.0;
      case TuxWidgetSize.giant:
        return 45.0;
      case TuxWidgetSize.large:
        return 40.0;
      case TuxWidgetSize.medium:
        return 35.0;
      case TuxWidgetSize.tiny:
        return 25.0;
      default:
        return 35;
    }
  }

  double getIconSize({TuxWidgetSize size}) {
    switch (tuxWidgetSize) {
      case TuxWidgetSize.tiny:
        return 13.0;
      case TuxWidgetSize.small:
        return 15.0;
      case TuxWidgetSize.medium:
        return 20.0;
      case TuxWidgetSize.large:
        return 25.0;
      case TuxWidgetSize.giant:
        return 30.0;
      default:
        return 20;
    }
  }

  @override
  Widget build(BuildContext context) {
    return tuxIconButton(context);
  }
}
