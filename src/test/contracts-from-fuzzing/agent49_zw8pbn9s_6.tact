struct S {
  x: Int?;
  y: Bool?;
  z: String?;
}

contract OptionalsTest {
  s1: S?;
  s2: S;

  init() {
    self.s1 = null;
    self.s2 = S{ x: null, y: true, z: null };
  }
}