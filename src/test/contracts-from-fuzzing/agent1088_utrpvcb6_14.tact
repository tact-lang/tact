struct A {
  a: Int;
}

struct B {
  b: Int;
}

contract MultiTopVars {
  a: A;
  b: B;

  init() {
    self.a = A{a:1};
    self.b = B{b:2};
  }
}