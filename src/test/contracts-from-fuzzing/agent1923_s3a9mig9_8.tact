struct A { a: Int; }
struct B { b: Int; }
struct C { c: Int; }
struct D { d: Int; }
struct E { e: Int; }

contract LongNestedStruct {
  f: A;
  g: B;
  h: C;
  i: D;
  j: E;

  init() {
    self.f = A{a: 1};
    self.g = B{b:2};
    self.h = C{c:3};
    self.i = D{d:4};
    self.j = E{e:5};
  }
}