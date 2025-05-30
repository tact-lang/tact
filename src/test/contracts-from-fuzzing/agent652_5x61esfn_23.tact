struct D {
  val: Int?;
}
struct C {
  d: D;
}
struct B {
  c: C;
}
struct A {
  b: B;
}

contract DeepChain {
  field: A;
  init() {
    self.field = A{ b: B{ c: C{ d: D{} } } };
  }
}