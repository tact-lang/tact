struct Foo {
  a: Int;
  b: String?;
}

contract OptAssignmentLater {
  s: Foo;

  init() {
    self.s = Foo{a:5,b:null};
    self.s.b = "set later";
  }
}