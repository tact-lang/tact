contract NoDefaults {
  foo: Int;
  bar: Int;

  init() {
    self.foo = 10;
    self.bar = 20;
  }
}