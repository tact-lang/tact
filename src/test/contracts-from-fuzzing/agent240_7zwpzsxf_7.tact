struct A {
  x: Bool;
}

struct B {
  y: Int?;
}

struct C {
  a: A;
  b: B;
  optionalBool: Bool?;
  optionalInt: Int?;
}

contract OptMix {
  state: C;

  init() {
    self.state = C{
      a: A{ x: true },
      b: B{ y: null },
      optionalBool: false,
      optionalInt: 10,
    };
  }
}
