struct OptionalLevels {
  a: Int?;
  b: Bool?;
  c: String?;
}

contract Test {
  f1: OptionalLevels?;
  f2: OptionalLevels?;

  init() {
    self.f1 = OptionalLevels{ a: null, b: true, c:null };
    self.f2 = null;
  }
}
