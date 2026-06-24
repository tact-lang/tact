struct One {
  v: Int;
}

struct Two {
  a: One;
  b: Int;
}

contract StructInStructMix {
  s: Two;

  init() {
    self.s = Two{a: One{v: 9}, b: 10};
  }
}