struct A {
 x: Int;
 y: Bool;
}

contract TwoOptRefs {
  a: A?;
  b: A?;

  init() {
    self.a = null;
    self.b = null;
  }
}