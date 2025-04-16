struct A { val: Int; }
struct B { val: Bool; }
struct C { val: String; }

struct Combined {
  a: A;
  b: B;
  c: C;
}

contract StructMix {
  comb: Combined;
  init() {
    self.comb = Combined{
      a: A{val: 1},
      b: B{val: true},
      c: C{val: "str"}
    };
  }
}