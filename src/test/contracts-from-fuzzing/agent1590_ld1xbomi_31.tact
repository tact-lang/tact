struct A {
  b: Int;
  c: Bool;
}

struct B {
  d: Int;
  e: Bool;
}

contract TwoStructFields {
  s1: A;
  s2: B;

  init() {
    self.s1 = A{ b: 1, c: true };
    self.s2 = B{ d: 2, e: false };
  }
}