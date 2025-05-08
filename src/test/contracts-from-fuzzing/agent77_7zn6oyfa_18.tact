struct S {
 a: Int;
}

contract PerOpt {
  a: Int?;
  b: S?;
  c: Bool?;
  d: Address?;

  init() {
    self.a = null;
    self.b = null;
    self.c = null;
    self.d = null;
  }
}