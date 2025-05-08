contract PrimitiveDefaults {
  foo: Int = -1;
  bar: Bool = false;
  baz: String = "default";

  init() {
    self.foo = 0;
    self.bar = true;
    self.baz = "changed";
  }
}
