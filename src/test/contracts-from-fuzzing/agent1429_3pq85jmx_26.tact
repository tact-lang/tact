struct A {
  a: Int;
}

struct B {
  b: Int;
  a: A;
}

contract Chain {
  b: B;

  init() {
    self.b = B{ b: 1, a: A{ a: 2 } };
  }
}