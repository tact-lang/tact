contract Test {
  foo: String = "hi";
  bar: String?;
  baz: String? = null;

  init() {
    self.bar = null;
    self.baz = null;
  }
}