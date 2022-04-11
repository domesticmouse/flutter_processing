import 'package:flutter/material.dart';
import 'package:flutter_processing/flutter_processing.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import '../test_infra.dart';

void main() {
  group('Color', () {
    group('setting', () {
      processingLegacySpecTest('background(): example 1', (tester) async {
        await tester.pumpWidget(
          Processing(
            sketch: Sketch.simple(
              draw: (s) {
                s
                  ..noLoop()
                  ..background(color: const Color(0xFF404040));
              },
            ),
          ),
        );

        await screenMatchesGolden(tester, 'color_setting_background-example-1');
      });

      processingLegacySpecTest('background(): example 2', (tester) async {
        await tester.pumpWidget(
          Processing(
            sketch: Sketch.simple(
              draw: (s) {
                s
                  ..noLoop()
                  ..background(color: const Color(0xFFFFCC00));
              },
            ),
          ),
        );

        await screenMatchesGolden(tester, 'color_setting_background-example-2');
      });

      processingLegacySpecTest('user can paint background in setup()', (tester) async {
        await tester.pumpWidget(
          Processing(
            sketch: Sketch.simple(
              setup: (s) {
                s
                  ..noLoop()
                  ..background(color: const Color(0xFF404040));
              },
            ),
          ),
        );

        await screenMatchesGolden(tester, 'color_setting_background-in-setup');
      });

      processingLegacySpecTest('background in draw() replaces background in setup()', (tester) async {
        await tester.pumpWidget(
          Processing(
            sketch: Sketch.simple(
              setup: (s) {
                s
                  ..noLoop()
                  ..background(color: const Color(0xFFFF0000));
              },
              draw: (s) {
                s.background(color: const Color(0xFF404040));
              },
            ),
          ),
        );

        await screenMatchesGolden(
            tester,
            'color_setting_background-setup-and'
            '-draw');
      });

      processingLegacySpecTest('fill(): example 1', (tester) async {
        await tester.pumpWidget(
          Processing(
            sketch: Sketch.simple(
              draw: (s) {
                s
                  ..noLoop()
                  ..fill(color: const Color(0xFF969696))
                  ..rect(rect: const Rect.fromLTWH(30, 20, 55, 55));
              },
            ),
          ),
        );

        await screenMatchesGolden(tester, 'color_setting_fill-example-1');
      });

      processingLegacySpecTest('fill(): example 2', (tester) async {
        await tester.pumpWidget(
          Processing(
            sketch: Sketch.simple(
              draw: (s) {
                s
                  ..noLoop()
                  ..fill(color: const Color(0xFFCC6600))
                  ..rect(rect: const Rect.fromLTWH(30, 20, 55, 55));
              },
            ),
          ),
        );

        await screenMatchesGolden(tester, 'color_setting_fill-example-2');
      });

      processingLegacySpecTest('noFill(): example 1', (tester) async {
        await tester.pumpWidget(
          Processing(
            sketch: Sketch.simple(
              draw: (s) {
                s
                  ..noLoop()
                  ..rect(rect: const Rect.fromLTWH(15, 10, 55, 55))
                  ..noFill()
                  ..rect(rect: const Rect.fromLTWH(30, 20, 55, 55));
              },
            ),
          ),
        );

        await screenMatchesGolden(tester, 'color_setting_nofill-example-1');
      });

      processingLegacySpecTest('stroke(): example 1', (tester) async {
        await tester.pumpWidget(
          Processing(
            sketch: Sketch.simple(
              draw: (s) {
                s
                  ..noLoop()
                  ..stroke(color: const Color(0xFFAAAAAA))
                  ..rect(rect: const Rect.fromLTWH(30, 20, 55, 55));
              },
            ),
          ),
        );

        await screenMatchesGolden(tester, 'color_setting_stroke-example-1');
      });

      processingLegacySpecTest('stroke(): example 2', (tester) async {
        await tester.pumpWidget(
          Processing(
            sketch: Sketch.simple(
              draw: (s) {
                s
                  ..noLoop()
                  ..stroke(color: const Color(0xFFCC6600))
                  ..rect(rect: const Rect.fromLTWH(30, 20, 55, 55));
              },
            ),
          ),
        );

        await screenMatchesGolden(tester, 'color_setting_stroke-example-2');
      });

      processingLegacySpecTest('noStroke(): example 1', (tester) async {
        await tester.pumpWidget(
          Processing(
            sketch: Sketch.simple(
              draw: (s) {
                s
                  ..noLoop()
                  ..noStroke()
                  ..rect(rect: const Rect.fromLTWH(30, 20, 55, 55));
              },
            ),
          ),
        );

        await screenMatchesGolden(tester, 'color_setting_nostroke-example-1');
      });

      processingLegacySpecTest('clear() replaces background in setup()', (tester) async {
        await tester.pumpWidget(
          Processing(
            sketch: Sketch.simple(
              setup: (s) {
                s.background(color: const Color(0xFF404040));
              },
              draw: (s) {
                s
                  ..noLoop()
                  ..clear();
              },
            ),
          ),
        );

        await screenMatchesGolden(tester, 'color_setting_clear-set-background-then-clear');
      });

      processingLegacySpecTest('clear(), then draw rect on transparent background', (tester) async {
        await tester.pumpWidget(
          Processing(
            sketch: Sketch.simple(
              draw: (s) {
                s
                  ..noLoop()
                  ..clear()
                  ..fill(color: const Color(0xFF969696))
                  ..rect(rect: const Rect.fromLTWH(30, 20, 55, 55));
              },
            ),
          ),
        );

        await screenMatchesGolden(tester, 'color_setting_clear-then-draw');
      });
    });

    processingLegacySpecTest('clear(), then set background, draw rect normally', (tester) async {
      await tester.pumpWidget(
        Processing(
          sketch: Sketch.simple(
            draw: (s) {
              s
                ..noLoop()
                ..clear()
                ..background(color: const Color(0xFF404040))
                ..fill(color: const Color(0xFF969696))
                ..rect(rect: const Rect.fromLTWH(30, 20, 55, 55));
            },
          ),
        ),
      );

      await screenMatchesGolden(tester, 'color_setting_clear-then-background-and-draw');
    });
  });
}
