struct A {
  a1: Int;
  a2: Int?;
}

struct B {
  b1: Int;
  b2: A;
  b3: Int?;
}

struct C {
  c1: Int;
  c2: B;
}

struct D {
  d1: Int;
  d2: A;
  d3: C;
}

contract Variety {
  data: D;

  init() {
    self.data = D{
      d1: 1,
      d2: A{ a1: 2, a2: null },
      d3: C{
        c1: 3,
        c2: B{
          b1: 4,
          b2: A{ a1: 5, a2: null },
          b3: null
        }
      }
    };
  }
}