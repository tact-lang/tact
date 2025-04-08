contract OptReassignLater {
  foo: Int?;
  bar: Bool?;

  init() {
    self.foo = null;
    self.bar = null;
    self.foo = 1;
    self.bar = true;
    self.foo = null;
    self.bar = null;
  }

  receive(){
    let _=self.foo;
  }
}