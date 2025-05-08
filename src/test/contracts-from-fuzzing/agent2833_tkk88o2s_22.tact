contract LongVars {
  foo: Int as int64;
  bar: Int as uint64;
  baz: Int;

  init() {
    self.foo = -42;
    self.bar = 42;
    self.baz = 0;
  }
}