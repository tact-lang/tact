contract NestedInits {
  foo: Int;
  bar: Bool;
  baz: String;

  init() {
    self.foo = 1;
    self.bar = true;
    self.baz = "abc";
    self.foo = 2;
    self.bar = false;
    self.baz = "def";
  }
}
