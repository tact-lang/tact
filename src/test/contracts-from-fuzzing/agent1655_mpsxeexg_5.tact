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

contract ComplexNested {
  data: C;

  init() {
    self.data = C{
      b: B{
        a: A{x: 8},
        y: 9
      },
      z: 10
    };
  }
}