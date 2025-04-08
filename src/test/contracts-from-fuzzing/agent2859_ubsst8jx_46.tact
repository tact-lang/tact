struct A {
  x: Int;
}

contract OptionalWrap {
  s: A?;

  init() {
    self.s = null;
  }
}