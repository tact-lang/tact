struct A { x: Int; }
struct B { y: A; }
struct C { z: B; }

contract DeepFields {
  f: C;

  init() {
    self.f = C{
      z: B{
        y: A{ x:10 }
      }
    };
  }
}