struct A {
  a: Int;
}

struct B {
  b: A;
}

struct C {
  c: B;
}

struct Container {
  c1: C;
  c2: C;
  c3: C;
}

contract MultiNested {
  data: Container;
  init() {
    self.data = Container{
      c1: C{c: B{b: A{a:1}}},
      c2: C{c: B{b: A{a:2}}},
      c3: C{c: B{b: A{a:3}}}
    };
  }
}