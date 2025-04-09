struct S {
  foo: Int;
}

contract PersistentNoDefault {
  bar: S;

  init() {
    self.bar = S{ foo: 42 };
  }
}