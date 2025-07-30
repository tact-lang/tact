struct A {
  x: Int;
}

struct B {
  a: A;
  b: Int;
}

struct C {
  b: B;
  c: Int;
}

struct D {
  c: C;
  d: Int;
}

contract NestedChain {
  chain: D;

  init() {
    self.chain = D{
      c: C {
        b: B {
          a: A { x: 1 },
          b: 2
        },
        c: 3
      },
      d: 4
    };
  }
}
