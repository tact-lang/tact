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
  e: E;
}
struct E {
  value: Int;
}

contract Test {
  root: A;
  init() {
    self.root = A{ b: B{ c: C{ d: D{ e: E{ value: 5 } } } } };
  }
}
