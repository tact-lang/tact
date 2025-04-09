contract NestedStructOverrides {
  foo: Int = 10;
  bar: Bool;

  init() {
    self.foo = 123;
    self.bar = true;
  }
}