// minimal deeply nested optional test
struct A { b: B?; }
struct B { c: C?; }
struct C { d: D?; }
struct D { e: E?; }
struct E { val: Int; }

contract NullToDeep {
  x: A;

  init() {
    self.x = A{b:null};
  }
}