struct S1 {
  x: Int;
  y: Bool;
}
struct S2 {
  a: Int?;
  b: String?;
}

contract MixedOpts {
  s1: S1?;
  s2: S2?;

  init() {
    self.s1 = null;
    self.s2 = null;
  }
}
