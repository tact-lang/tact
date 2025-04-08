contract OptBool {
  foo: Bool?;

  init() {
    self.foo = null;
    self.foo = true;
    self.foo = null;
  }

  receive(){
    let _=self.foo;
  }
}