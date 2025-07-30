struct S1 {
  a: Int;
  b: String;
}

struct S2 {
  x: Int;
  y: S1;
  z: S1?;
}

contract NestedOptionals {
  data: S2;

  init() {
    self.data = S2{
      x: 1,
      y: S1{a: 2, b: "hello"},
      z: null
    };
  }
}