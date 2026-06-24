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
struct E {
  e: Int;
}
struct F {
  f: Int;
}
struct G {
  g: Int;
}
struct H {
  h: Int;
}

contract ManyNested {
  a: A;
  b: B;
  c: C;
  d: D;
  e: E;
  f: F;
  g: G;
  h: H;

  init() {
    self.a = A{a:1};
    self.b = B{b:2};
    self.c = C{c:3};
    self.d = D{d:4};
    self.e = E{e:5};
    self.f = F{f:6};
    self.g = G{g:7};
    self.h = H{h:8};
  }
}