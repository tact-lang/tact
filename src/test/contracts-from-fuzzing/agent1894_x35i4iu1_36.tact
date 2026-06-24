struct A {
  x: Int;
}

struct B {
  y: A;
}

struct C {
  z: B;
}

struct D {
  q: C;
}

contract FourDeepOpt {
  dd: D?;
  init() {
    self.dd = null;
  }
}