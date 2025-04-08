struct Consistent {
  a: Int;
  b: String;
}

contract InitReassign {
  foo: Consistent = Consistent{ a: 1, b: "x" };

  init() {
    self.foo = Consistent{ a: 2, b: "y" };
  }
}