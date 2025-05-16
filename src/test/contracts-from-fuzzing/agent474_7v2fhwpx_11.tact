struct A { a: Int }
struct B { b: A }
struct C { c: B }
struct D { d: C }
struct E { e: D }

contract Test {
  f: E;
  
  init() {
    self.f = E{ e: D{ d: C{ c: B{ b: A{ a: 1 }}}}};
  }
}
