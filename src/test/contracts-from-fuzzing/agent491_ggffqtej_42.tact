contract MissingInitDefaults {
  foo: Int;
  bar: Bool = false;

  init() {
    self.foo = 123;
  }
}
