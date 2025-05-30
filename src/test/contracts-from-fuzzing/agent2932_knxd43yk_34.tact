struct A {
  f1: Int;
}

struct B {
  f2: Int;
}

contract ABContract {
  a: A;
  b: B;
  init() {
    self.a = A{f1:1};
    self.b = B{f2:2};
  }
}