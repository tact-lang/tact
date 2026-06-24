struct A {
  x: Int;
}

struct B {
  a: A;
}

struct C {
  b: B;
}

contract DeepNest {
  inner: C;

  init() {
    self.inner = C { b: B { a: A { x: 10 } } };
  }
}