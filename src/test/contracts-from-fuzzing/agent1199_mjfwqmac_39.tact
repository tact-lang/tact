struct A { x: Int; }
struct B { y: Int; }
struct C { z: Int; }

struct Comb {
  a: A;
  b: B;
  c: C;
}

contract Test39 {
  co: Comb;

  init() {
    self.co = Comb{
      a: A{x:1},
      b: B{y:2},
      c: C{z:3}
    };
  }
}