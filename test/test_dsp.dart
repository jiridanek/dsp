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

  group('corr', () {
    test('should work with Shape.FULL', () {
      expect(corr([1, 2, 3], [0, 1, 0.5], Shape.FULL), equals([0.5, 2, 3.5, 3, 0]));
    });
    test('should work with Shape.SAME', () {
      expect(corr([1, 2, 3], [0, 1, 0.5], Shape.SAME), equals([2, 3.5, 3]));
    });
    //test('should work with Shape.VALID', () {
    //  expect(corr([1, 2, 3], [0, 1, 0.5], Shape.VALID), equals([3.5]));
    //});
  });
}
