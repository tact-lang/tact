struct A {
  foo: Int;
}

struct B {
  bar: A;
}

struct C {
  baz: B;
}

contract DeepNested {
  x: C;

  init() {
    self.x = C{baz: B{bar: A{foo: 42}}};
  }
}