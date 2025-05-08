struct B {
 x: Int;
 nested: C;
}

struct C {
 y: Int;
 z: Int;
}

contract Test {
  b: B;

  init() {
    self.b = B{
      x: 1,
      nested: C{ y: 2, z: 3 }
    };
  }
}