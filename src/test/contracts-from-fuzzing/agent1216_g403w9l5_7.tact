struct A {
  num: Int;
}

struct B {
  a1: A;
  a2: A;
}

struct C {
  b1: B;
  b2: B;
}

struct D {
  c1: C;
  c2: C;
}

contract RecursiveDeepTest {
  d: D;

  init() {
    self.d = D{
      c1: C{
        b1: B{ a1: A{num:1}, a2: A{num:2} },
        b2: B{ a1: A{num:3}, a2: A{num:4} }
      },
      c2: C{
        b1: B{ a1: A{num:5}, a2: A{num:6} },
        b2: B{ a1: A{num:7}, a2: A{num:8} }
      }
    };
  }
}