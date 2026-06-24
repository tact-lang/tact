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

struct E {
  e: D;
}

contract DeepChain {
  chain: E = E{ e: D{ d: C{ c: B{ b: A{a: 123} } } } };
  init() {}
}