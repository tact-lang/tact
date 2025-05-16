struct ComplexNest {
  a: Int;
  b: Bool;
}

struct Wrapper {
  inner: ComplexNest?;
}

contract OptionalWrapper {
  w: Wrapper?;

  init() {
    self.w = null;
  }
}