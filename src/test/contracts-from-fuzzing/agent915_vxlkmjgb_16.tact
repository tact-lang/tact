struct TwoDefaults {
  a: Int = 42;
  b: Bool = true;
}

contract DefaultStructFields {
  inner: TwoDefaults;

  init() {
    self.inner = TwoDefaults{};
  }
}
