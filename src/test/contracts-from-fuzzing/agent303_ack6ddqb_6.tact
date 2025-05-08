struct S {
  x: Int;
}

contract OptNested {
  foo: S?;
  bar: S?;
  baz: S?;
  init() {
    self.foo = S{ x: 1 };
    self.bar = null;
    self.baz = S{ x: 2 };
  }
}
