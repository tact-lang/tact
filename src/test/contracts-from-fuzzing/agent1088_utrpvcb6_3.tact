struct A {
  x: Int;
}

struct B {
  y: A;
}

struct C {
  z: B;
}

contract DeepNest {
  data: C;

  init() {
    self.data = C{z: B{y: A{x: 42}}};
  }
}