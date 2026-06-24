struct A {
  val: Int;
}

struct B {
  a: A;
}

contract Test {
  b: B;

  init() {
    self.b = B{ a: A{ val:42 } };
  }
}