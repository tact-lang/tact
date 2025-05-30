struct A {
  a: Int;
}

struct B {
  b: Int;
}

contract ManyStructs {
  f1: A;
  f2: B;
  x: Int;

  init() {
    self.f1 = A{a:1};
    self.f2 = B{b:2};
    self.x = 3;
  }
}