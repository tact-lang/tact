struct A {
  x: Int;
  y: Int;
}

struct B {
  p: A;
}

struct C {
  q: B;
}

contract NestABCs {
  data: C;

  init() {
    self.data = C{
      q: B{
        p: A{ x: 7, y: 8 }
      }
    };
  }
}