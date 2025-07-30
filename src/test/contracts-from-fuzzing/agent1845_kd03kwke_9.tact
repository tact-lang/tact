// Arrays are forbidden generally, but test tuple-style composite immediate assignment
struct Pair {
  first: Int;
  second: Int;
}

struct Container {
  pair1: Pair;
  pair2: Pair;
}

contract ComposedPairs {
  value: Container;

  init() {
    self.value = Container{
      pair1: Pair{ first:1, second:2 },
      pair2: Pair{ first:3, second:4 }
    };
  }
}
