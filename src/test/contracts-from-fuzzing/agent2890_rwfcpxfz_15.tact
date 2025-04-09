struct A {
  x: Int;
}

struct B {
  a: A;
  y: Int;
}

struct C {
  b: B;
  z: Int;
}

contract ComplexNesting {
  c: C;

  init() {
    self.c = C{
      b: B{
        a: A{ x: 42 },
        y: 100
      },
      z: 500
    };
  }
}