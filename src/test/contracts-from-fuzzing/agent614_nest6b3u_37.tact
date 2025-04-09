struct A {
  a: Int;
}
struct B {
  b: Int;
}
struct C {
  c: Int;
}
struct D {
  d: Int;
}

contract WideDeep {
  aa: A;
  bb: B;
  cc: C;
  dd: D;

  init() {
    self.aa=A{a:1};
    self.bb=B{b:2};
    self.cc=C{c:3};
    self.dd=D{d:4};
  }
}