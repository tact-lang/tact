// Deep nested optional inside nested struct
struct A { b: B; }
struct B { c: C; }
struct C { d: D; }
struct D { e: Int?; }

contract TestContract {
  f: A;

  init() {
    self.f = A{ b: B{ c: C{ d: D{ e: null } } } };
  }
}