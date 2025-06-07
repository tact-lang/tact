struct Wrapped {
  inner: Int?;
}

contract TestContract {
  a: Int?;
  b: Wrapped;
  c: Int;

  init() {
    self.a = null;
    self.b = Wrapped { inner: 17 };
    self.c = 23;
  }
}