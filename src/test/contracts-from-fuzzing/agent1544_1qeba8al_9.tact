struct A {
  a1: Int;
}
struct B {
  b1: A;
}
struct C {
  c1: B;
}
contract Chain {
  field: C;

  init() {
    self.field = C{ c1: B{ b1: A{ a1: 5 } } };
  }
}
