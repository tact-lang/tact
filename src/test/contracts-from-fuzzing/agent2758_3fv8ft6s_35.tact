struct A {
  i: Int;
}

struct B {
  a: A;
}

struct C {
  b: B;
}

struct D {
  c: C;
}

contract TestContract {
  d: D;

  init() {
    self.d = D{ c: C{ b: B{ a: A{ i: 123 } } } };
  }
}