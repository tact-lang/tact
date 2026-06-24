struct Hybrid {
  a: Int?;
  b: Int? = null;
  c: Int? = 42;
}

contract MixedOptionalDefaults {
  f: Hybrid;

  init() {
    self.f = Hybrid{};
  }
}
