contract OnlyScalars {
  foo: Int;
  bar: Bool;
  baz: String;

  init() {
    self.foo = -7;
    self.bar = true;
    self.baz = "abc";
  }
}
