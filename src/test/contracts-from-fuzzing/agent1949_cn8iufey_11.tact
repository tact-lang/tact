struct A {
  x: Int;
}

struct B {
  y: Int;
}

struct Both {
  a: A;
  b: B;
}

contract OptionalStructsComplex {
  optA: A?;
  optB: B?;
  both: Both?;

  init() {
    self.optA = null;
    self.optB = null;
    self.both = null;
  }
}
