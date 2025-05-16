struct OuterMost {
  inn: Int;
}

contract OptionalComplex {
  a: OuterMost? = null;
  b: Int? = null;
  c: Bool? = true;

  init() {
    self.a = null;
    self.b = 42;
    self.c = false;
  }
}