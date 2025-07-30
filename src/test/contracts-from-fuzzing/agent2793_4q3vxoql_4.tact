struct A {
  a: Int;
}

struct B {
  b: A;
}

struct C {
  c: B;
}

contract DeepChain {
  f: C;
  init() {
    self.f = C{c: B{b: A{a: 7}}};
  }
}