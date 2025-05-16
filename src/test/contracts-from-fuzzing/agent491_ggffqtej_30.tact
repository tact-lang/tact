struct HasInnerDefaults {
  foo: Int = 42;
  bar: Bool = true;
}

contract DefaultsStruct {
  inner: HasInnerDefaults;

  init() {
    self.inner = HasInnerDefaults{};
  }
}
