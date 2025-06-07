contract OptString {
  foo: String?;

  init() {
    self.foo = null;
    self.foo = "abc";
    self.foo = null;
  }

  receive(){
    let _=self.foo;
  }
}