struct A { a: Int; }
struct B { b: A; }
struct C { c: B; }
struct D { d: C; }
struct E { e: D; }
contract VeryDeep {
  v: E;
  init() {
    self.v = E{e: D{d: C{c: B{b: A{a:123}}}}};
  }
}
