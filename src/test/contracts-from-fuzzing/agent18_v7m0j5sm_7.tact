contract OptionalsEverywhere {
  foo: Int?;
  bar: Int?;
  baz: Int?;

  init() {
    self.foo = null;
    self.bar = 123;
    self.baz = null;
  }
}