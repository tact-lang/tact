contract NoDefaults {
  foo: Int;
  bar: Bool;
  baz: String;

  init() {
    self.foo = 5;
    self.bar = true;
    self.baz = "xyz";
  }
}
