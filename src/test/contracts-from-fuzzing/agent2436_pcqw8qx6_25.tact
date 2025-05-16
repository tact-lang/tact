struct A {
  x: Int;
}

struct B {
  y: A;
}

contract DefInit {
  inner: B = B{y:A{x:123}};

  init() {
    self.inner = B{y:A{x:999}};
  }
}