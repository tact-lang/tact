struct A {
  x: Int;
}

struct B {
  y: A;
}

struct C {
  z: B;
}

contract TestContract {
  d: C;

  init() {
    self.d = C{
      z: B{ y: A{ x: 123 } }
    };
  }
}