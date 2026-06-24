struct StrA {
  x: Int;
}

struct StrB {
  a: StrA;
  y: Int;
}

struct StrC {
  b: StrB;
  z: Int;
}

contract MixedOrdering {
  val: StrC;
  init() {
    self.val = StrC{
      b: StrB{
        a: StrA{
          x: 11
        },
        y: 22
      },
      z: 33
    };
  }
}