struct A {
  a: Int;
}

struct B {
  b: A;
}

struct C {
  c: B;
}

struct D {
  d: C;
}

contract Test {
  nested: D;

  init() {
    self.nested = D{
      d: C{
        c: B{
          b: A{
            a: 42,
          },
        },
      },
    };
  }
}
