contract InitOfDeep {
  foo: Int = 0;

  init() {
    let _ = initOf InitOfDeep();
    self.foo = 42;
  }
}