struct S1 {
  a: Int;
}

struct S2 {
  b: Int;
}

struct Container {
  x: S1?;
  y: S2?;
}

contract OptionalNestedStructs {
  cont: Container;

  init() {
    self.cont = Container{
      x: S1{a: 1},
      y: null,
    };
  }
}
