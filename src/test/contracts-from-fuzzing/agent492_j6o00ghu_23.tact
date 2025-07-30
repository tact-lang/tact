struct A {
  x: Int;
}

struct B {
  a: A;
}

struct C {
  b: B;
}

contract NestedFields {
  nested: C;

  init() {
    self.nested = C{b:B{a:A{x:5}}};
  }
}
