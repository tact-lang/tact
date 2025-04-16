struct C {
  val: Int;
}

struct B {
  c: C;
}

struct A {
  b: B;
}

contract DeepNest {
  data: A;

  init() {
    self.data = A{ b: B{ c: C{ val: 123 } } };
  }
}
