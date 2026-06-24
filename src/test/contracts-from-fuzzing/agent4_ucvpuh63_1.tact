struct A {
  x: Int;
  y: Int;
}

contract Test {
  a: A;

  init() {
    self.a = A{ x: 1, y: 2 };
  }
}