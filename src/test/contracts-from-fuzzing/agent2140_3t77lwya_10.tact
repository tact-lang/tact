struct A {
  b: B;
}

struct B {
  c: C;
}

struct C {
  d: D;
}

struct D {
  e: E;
}

struct E {
  f: F;
}

struct F {
  g: Int;
}

contract LongChain {
  data: A;
  init() {
    self.data = A{b: B{c: C{d: D{e: E{f: F{g: 1}}}}}};
  }
}
