struct InnerDefaults {
  foo: Int = 5;
  bar: Bool = true;
}

contract TestContract {
  inner: InnerDefaults;

  init() {
    self.inner = InnerDefaults{};
  }
}