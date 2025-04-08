struct DefaultVals {
  a: Int = 42;
  b: String = "hi";
  c: Bool = true;
}

contract TestDefaults {
  data: DefaultVals;

  init() {
    self.data = DefaultVals{};
  }
}
