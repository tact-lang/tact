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
  val: Int;
}

contract Test {
  data: A;
  init() {
    self.data = A{ b: B{ c: C{ d: D{ val: 42 } } } };
  }
}
