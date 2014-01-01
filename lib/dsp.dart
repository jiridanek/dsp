library dsp;

import 'dart:core';

class Shape {
  /// Returns the full convolution.
  static const FULL = 'full';
  /// Return the central part of the convolution with the same size as a.
  static const SAME = 'same';
  //TODO?: VALID
}

/**
 * Returns a convolution of [a] and [b]. Shape [s] is either Shape.FULL or Shape.SAME.
 * The default shape is Shape.FULL.
 */
List<num> conv(List<num> a, List<num> b, [ String s = Shape.FULL ] ){
  return _concorr(a, b, s, true); // do flip b
}

/**
 * Helper function to perform convolution and correlation. This way no copies of
 * [b] for flipping have to be made.
 */
List<num> _concorr(List<num> a, List<num> b, String s, bool flip){
  List<num> r;

  switch(s) {
    case Shape.FULL:
      r = new List<num>(a.length + b.length - 1);
      break;
    case Shape.SAME:
      r = new List<num>(a.length);
      break;
  }

  int offset;
  if (s == Shape.FULL) {
    offset = b.length - 1;
  } else { // s == Shape.SAME
    offset = (b.length - 1) ~/ 2;
  }

  // if flip == true, flip b
  int f = 0;
  if(flip) {
    f = b.length-1; // this will be max value of k
  }

  for(int i=0; i < r.length; i++) {
    num acc = 0;

    // j is index in a, k is index in b
    for(int j=i, k=0; (k < b.length) && (j < a.length+offset); j++,k++) {
      if (j < offset) { // left-pad a with zeros
        continue;
      }
      num v = a[j - offset];

      acc += v * b[(f-k).abs()]; // do the actual flip
    }

    r[i] = acc;
  }

  return r;
}
