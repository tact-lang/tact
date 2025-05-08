struct A { a1: Int } 
struct B { b1: Int } 
struct C { c1: Int }

struct Combo {
  a: A?;
  b: B;
  c: C?;
}

contract ComboContract {
  s: Combo;

  init() {
    self.s = Combo{
      a: null,
      b: B{b1: 2},
      c: C{c1: 3},
    };
  }
}
