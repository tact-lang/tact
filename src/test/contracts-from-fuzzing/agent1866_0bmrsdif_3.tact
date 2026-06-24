struct S1 {
  x: Int;
  y: Bool;
  z: Int?;
}

struct S2 {
  a: Int;
  b: S1;
  c: Bool?;
  d: String;
}

contract Combo {
  data: S2;

  init() {
    self.data = S2{
      a: 1,
      b: S1{x: 2, y: true, z: null},
      c: false,
      d: "hello",
    };
  }
}