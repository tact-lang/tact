struct SDefault {
  a: Int = 99;
  b: Bool = true;
}

contract DefaultFill {
  s: SDefault;
  init() {
    self.s = SDefault{};
  }
}