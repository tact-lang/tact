struct MixedDefaultsOpt {
  a: Int = 1;
  b: String? = null;
  c: Bool = true;
  d: Int? = null;
}

contract Test {
  m: MixedDefaultsOpt;
  init() {
    self.m = MixedDefaultsOpt{};
  }
}