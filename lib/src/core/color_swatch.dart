import 'package:eva_color/eva_color.dart';
import 'package:flutter/foundation.dart';

import 'default_color.dart';

@immutable
class OvaColorSwatch with Diagnosticable {
  /// Primary color from Eva color generator
  final EvaColor primaryColor;

  /// Primary transparent color
  final EvaTransparentColor primaryTransparentColor;

  /// Basic color from white to black
  final EvaBasicColor basicColor;

  /// Basic light color
  final EvaTransparentColor basicLightTransparentColor;

  /// Basic dark color
  final EvaTransparentColor basicDarkTransparentColor;

  /// Success color from Eva color generator
  final EvaColor successColor;

  /// Success transparent color
  final EvaTransparentColor successTransparentColor;

  /// Info color from Eva color generator
  final EvaColor infoColor;

  /// Success transparent color
  final EvaTransparentColor infoTransparentColor;

  /// Warning color from Eva color generator
  final EvaColor warningColor;

  /// Success transparent color
  final EvaTransparentColor warningTransparentColor;

  /// Danger color from Eva color generator
  final EvaColor dangerColor;

  /// Success transparent color
  final EvaTransparentColor dangerTransparentColor;

  /// Factory constructor that has fallback for the undefined parameters.
  factory OvaColorSwatch({
    EvaColor primaryColor,
    EvaTransparentColor primaryTransparentColor,
    EvaBasicColor basicColor,
    EvaTransparentColor basicLightTransparentColor,
    EvaTransparentColor basicDarkTransparentColor,
    EvaColor successColor,
    EvaTransparentColor successTransparentColor,
    EvaColor infoColor,
    EvaTransparentColor infoTransparentColor,
    EvaColor warningColor,
    EvaTransparentColor warningTransparentColor,
    EvaColor dangerColor,
    EvaTransparentColor dangerTransparentColor,
  }) {
    return OvaColorSwatch.raw(
      primaryColor: primaryColor ?? OvaColor.primary,
      primaryTransparentColor:
          primaryTransparentColor ?? OvaColor.primaryTransparent,
      basicColor: basicColor ?? OvaColor.basic,
      basicLightTransparentColor:
          basicLightTransparentColor ?? OvaColor.basicLightTransparent,
      basicDarkTransparentColor:
          basicDarkTransparentColor ?? OvaColor.basicDarkTransparent,
      successColor: successColor ?? OvaColor.success,
      successTransparentColor:
          successTransparentColor ?? OvaColor.successTransparent,
      infoColor: infoColor ?? OvaColor.info,
      infoTransparentColor: infoTransparentColor ?? OvaColor.infoTransparent,
      warningColor: warningColor ?? OvaColor.warning,
      warningTransparentColor:
          warningTransparentColor ?? OvaColor.warningTransparent,
      dangerColor: dangerColor ?? OvaColor.danger,
      dangerTransparentColor:
          dangerTransparentColor ?? OvaColor.dangerTransparent,
    );
  }

  const OvaColorSwatch.raw({
    @required this.primaryColor,
    @required this.primaryTransparentColor,
    @required this.basicColor,
    @required this.basicLightTransparentColor,
    @required this.basicDarkTransparentColor,
    @required this.successColor,
    @required this.successTransparentColor,
    @required this.infoColor,
    @required this.infoTransparentColor,
    @required this.warningColor,
    @required this.warningTransparentColor,
    @required this.dangerColor,
    @required this.dangerTransparentColor,
  })  : assert(primaryColor != null),
        assert(primaryTransparentColor != null),
        assert(basicColor != null),
        assert(basicLightTransparentColor != null),
        assert(basicDarkTransparentColor != null),
        assert(successColor != null),
        assert(successTransparentColor != null),
        assert(infoColor != null),
        assert(infoTransparentColor != null),
        assert(warningColor != null),
        assert(warningTransparentColor != null),
        assert(dangerColor != null),
        assert(dangerTransparentColor != null);
}
