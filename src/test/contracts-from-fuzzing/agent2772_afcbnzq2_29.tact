contract OptionalStrings {
  foo: String?;
  bar: String?;

  init() {
    self.foo = null;
    self.bar = "abc";
  }
}
