contract MinimalOneField {
  foo: Bool;

  init() {
    self.foo = true;
  }

  receive() {
    let _ = self.foo;
  }
}