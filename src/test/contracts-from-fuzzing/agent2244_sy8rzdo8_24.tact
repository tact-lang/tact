struct S1 {
  a: Int as uint8;
  b: Bool;
}

struct S2 {
  x: S1;
  y: S1;
}

contract NestedSerialize {
  data: S2;

  init() {
    self.data = S2{
      x: S1{a: 5, b: false},
      y: S1{a: 200, b: true}
    };
  }
}
