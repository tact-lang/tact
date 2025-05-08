struct A {
  foo: Int;
}

contract NullStructInit {
  s: A?;

  init() {
    self.s = null;
  }
}