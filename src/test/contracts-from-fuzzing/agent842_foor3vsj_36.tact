contract OptionalIntReassign {
  foo: Int?;

  init() {
    self.foo = null;
    self.foo = 123;
    self.foo = null;
  }

  receive(){
    let _=self.foo;
  }
}