struct A {
  a: Int;
}

struct B {
  a: Int;
}

struct C {
  a: Int;
}

struct D {
  a: Int;
}

contract ManyStructVars {
  a: A;
  b: B;
  c: C;
  d: D;

  init() {
    self.a = A{a:1};
    self.b = B{a:2};
    self.c = C{a:3};
    self.d = D{a:4};
  }
}