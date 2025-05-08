contract MixedOptionals {
  foo: Int? = null;
  bar: Bool?;
  baz: String? = null;

  init() {
    self.bar = null;
  }
}