struct Foo {
  x: Int;
}

contract OptNullAssign {
  data: Foo? = null;

  init() {
    self.data = null;
  }
}