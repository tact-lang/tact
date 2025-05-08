struct SDefault {
  a: Int = 10;
  b: Bool = true;
  c: String = "hi";
}

contract StructDefaults {
  s: SDefault;

  init() {
    self.s = SDefault{};
  }
}
