struct A { x: Int; }
struct B { y: A; }
struct C { z: B; }

contract OptDeep {
  o: C?;

  init() {
    self.o = null;
  }
}