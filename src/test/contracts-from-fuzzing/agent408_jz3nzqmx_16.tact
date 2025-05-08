struct A { a: Int; }
struct B { b: Bool; }
struct C { c: String; }

struct Combo {
  sa: A;
  sb: B;
  sc: C;
}

contract NestedDifferent {
  data: Combo;

  init() {
    self.data = Combo {
      sa: A{a:1},
      sb: B{b:true},
      sc: C{c:"hi"}
    };
  }
}