contract MixDefaultOptional {
  foo: Int?;
  bar: Int = 42;

  init() {
    self.foo = null;
    self.bar = 7;
  }
}