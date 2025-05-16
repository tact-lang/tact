struct A {
  a1: Int;
  a2: Int;
}

struct B {
  b1: A;
  b2: Int;
}

struct C {
  c1: B;
  c2: A;
}

contract MultiLevel {
  data: C;
  init() {
    self.data = C{
      c1: B{ b1: A{ a1: 1, a2: 2 }, b2: 3 },
      c2: A{ a1: 4, a2:5 }
    };
  }
}