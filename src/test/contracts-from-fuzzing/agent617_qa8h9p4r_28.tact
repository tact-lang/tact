struct D {
  val: Int?;
}

struct C {
  d: D?;
}

struct B {
  c: C?;
}

struct A {
  b: B?;
}

contract MultiLayerOpt {
  store: A;
  init() {
    self.store = A{ b: B{ c: C{ d: D{ val: null } } } };
  }
}