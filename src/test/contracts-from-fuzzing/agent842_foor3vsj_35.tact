contract OptConstructorInit {
  foo: Int?;

  init() {
    self.foo = null;
  }

  receive() {
    let _=self.foo;
  }
}