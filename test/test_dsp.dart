import 'package:unittest/unittest.dart';

import 'package:dsp/dsp.dart';

main() {
  group('conv', () {
    /*
    primes = [1,2,3,5,7,9,13];
    last = [7,9,13];
    conv(primes, last)
    conv(primes, last, 'same')
    */
    var primes = const [1,2,3,5,7,9,13];
    var last = const [7,9,13];

    test('should work with Shape.FULL', () {
      expect(conv(primes,last, Shape.FULL), equals([7, 23, 52, 88, 133, 191, 263, 234, 169]));
    });
    test('should work with Shape.SAME', () {
      expect(conv(primes,last, Shape.SAME), equals([23, 52, 88, 133, 191, 263, 234]));
    });
    test('should be Shape.FULL by default', () {
      expect(conv(primes,last), equals(conv(last,primes, Shape.FULL)));
    });
    test('should be commutative (only Shape.FULL)', () {
      expect(conv(primes,last, Shape.FULL), equals(conv(last,primes, Shape.FULL)));
    });
  });
}
