struct A {
  x: Int;
}

struct B {
  a1: A;
  a2: A;
  y: Bool;
}

struct C {
  b1: B;
  b2: B;
}

contract RepetitionTest {
  data: C;

  init() {
    self.data = C{
      b1: B{
        a1: A{ x: 1 },
        a2: A{ x: 2 },
        y: true
      },
      b2: B{
        a1: A{ x: 3 },
        a2: A{ x: 4 },
        y: false
      }
    };
  }
}