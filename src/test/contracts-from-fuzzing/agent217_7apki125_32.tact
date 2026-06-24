contract OptionalUninit {
  foo: Int?;
  bar: Int?;

  init() {
    self.foo = null;
    // Forgetting to initialize bar on purpose (should default to null)
  }
}