struct D {
  leaf: Int?;
}

struct C {
  d: D;
}

struct B {
  c: C?;
}

struct A {
  b: B;
}

contract TestContract {
  tree: A;

  init() {
    self.tree = A{ b: B{ c: null } };
  }
}