struct A {
  v: Int;
}

struct B {
  a: A;
}

struct C {
  b: B;
}

struct D {
  c: C;
}

struct E {
  d: D;
}

contract TestContract {
  nested: E;
  init() {
    self.nested = E{ d: D{ c: C{ b: B{ a: A{ v: 42 } } } } };
  }
}