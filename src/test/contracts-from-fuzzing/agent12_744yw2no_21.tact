struct Defaults {
  foo: Int = 42;
  bar: Bool = true;
}

contract DefaultVals {
  d: Defaults;
  init() {
    self.d = Defaults{};
  }
}
