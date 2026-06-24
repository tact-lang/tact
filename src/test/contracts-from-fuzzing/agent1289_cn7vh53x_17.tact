struct A { x: Int; }
struct B { y: Bool; }
struct C { z: String; }

struct Comb {
  a: A;
  b: B;
  c: C;
}

contract MultiStructNest {
  s: Comb;

  init() {
    self.s = Comb{
      a: A{ x: 1 },
      b: B{ y: false },
      c: C{ z: "zeta" }
    };
  }
}
