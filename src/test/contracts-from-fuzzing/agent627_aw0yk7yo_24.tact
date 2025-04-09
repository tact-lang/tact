contract MixedDefault {
  foo: Int = 1;
  bar: Int;
  baz: Int = 3;

  init() {
    self.bar = 2;
  }
}