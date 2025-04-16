struct A {
  a: Int?;
}

struct B {
  b: A?;
}

struct C {
  c: B?;
}

struct D {
  d: C?;
}

contract ChainNestedOptionals {
  chain: D;

  init() {
    self.chain = D{ d: null };
  }
}