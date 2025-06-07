struct A { x: Int; }
struct B { y: Int; }
struct C { a: A; b: B; }
struct D { c: C; }

contract WideNested {
  field: D;
  count: Int;

  init() {
    self.field = D{ c: C{ a: A{ x:1 }, b: B{ y:2 } } };
    self.count = 0;
  }
}
