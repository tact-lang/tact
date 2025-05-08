contract OptionalSlices {
  foo: Slice?;

  init() {
    self.foo = null;
  }
}