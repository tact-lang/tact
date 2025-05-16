contract ImmediateAssign {
  foo: Int = 0;
  bar: Int = 1;

  init() {
    self.foo = self.bar;
  }
}
