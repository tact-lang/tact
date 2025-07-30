struct A { x: Int; y: Bool; }
struct B { b1: A; b2: Bool; }
struct C { c1: B; c2: Int; }

contract MultiNested {
  v: C;

  init() {
    self.v = C{
      c1: B{
        b1: A{ x: 1, y: true },
        b2: false
      },
      c2: 5
    };
  }
}