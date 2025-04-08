struct A { x: Int; }
struct B { y: Int; a: A; }
struct C { z: Int; b: B; }

contract ChainNested {
  data: C;

  init() {
    self.data = C{
      z: 7,
      b: B{
        y: 3,
        a: A{ x: 1 }
      }
    };
  }
}
