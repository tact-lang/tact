struct S1 {
  y: Bool;
}

struct S2 {
  z: Int;
  s1: S1;
}

contract MixedInnerOrder {
  s2: S2;
  init() {
    self.s2 = S2{ z:77, s1: S1{ y:true } };
  }
}