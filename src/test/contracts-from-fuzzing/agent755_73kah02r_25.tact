struct A { a: Int; }
struct B { b: A; }
struct C { c: B; }
struct D { d: C; }
struct E { e: D; }
struct F { f: E; }

contract Test22 {
  f1: F;
  f2: F;
  f3: F;

  init() {
    self.f1 = F{ f: E{ e: D{ d: C{ c: B{ b: A{ a: 1 } } } } } };
    self.f2 = F{ f: E{ e: D{ d: C{ c: B{ b: A{ a: 2 } } } } } };
    self.f3 = F{ f: E{ e: D{ d: C{ c: B{ b: A{ a: 3 } } } } } };
  }
}
