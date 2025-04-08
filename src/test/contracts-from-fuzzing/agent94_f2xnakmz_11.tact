struct A {
  x: Int;
}

struct B {
  y: Int;
}

struct C {
  c1: A;
  c2: B;
}

contract MultiNested {
  data: C;

  init() {
    self.data = C{
      c1: A{ x: 1 },
      c2: B{ y: 2 },
    };
  }
}