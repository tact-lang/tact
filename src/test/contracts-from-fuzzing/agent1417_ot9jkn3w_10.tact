struct A {
  a1: Int;
}

struct B {
  b1: Int;
  a: A;
}

struct C {
  c1: Int;
  b: B;
}

contract NestedMixed {
  c: C;
  x: Bool;

  init() {
    self.c = C{
      c1: 123,
      b: B{
        b1: 456,
        a: A{ a1: 789 }
      }
    };
    self.x = true;
  }
}