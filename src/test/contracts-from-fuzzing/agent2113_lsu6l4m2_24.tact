// Test very deep nesting 5 layers
struct A { val: Int; }
struct B { a: A; }
struct C { b: B; }
struct D { c: C; }
struct E { d: D; }

contract FiveLayers {
  e: E;

  init() {
    self.e = E{ d: D{ c: C{ b: B{ a: A{ val: 5 } } } } };
  }
}