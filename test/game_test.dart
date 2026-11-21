import 'package:flutter_test/flutter_test.dart';
import 'package:kart_motoru/kart_motoru.dart';
import 'package:oyun_batak/oyun_batak.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(batakConfig.title.length, 33);
    expect(batakConfig.tagline.length, 33);
    for (final s in batakConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('bölümler kazanılabilir ve el sonuna kadar oynanır', () {
    final planner = LevelPlanner(gameId: batakId, optionalMechanics: const []);
    for (final lv in [1, 77, 1500, 33333, 49999]) {
      final gl = batakRules.build(planner.spec(lv));
      expect(gl.validation.ok, isTrue, reason: 'bölüm $lv');
      final end = TrickGameRules.simulate(gl.puzzle);
      expect(end.phase, TrickPhase.over, reason: 'bölüm $lv');
    }
  });
}
