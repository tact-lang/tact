struct A { x: Int; }

struct B {
  y: Int;
  nest: A;
}

struct C {
  z: String;
  nest: B;
}

contract NestedDifferentTypes {
  data: C;

  init() {
    self.data = C{ z: "hi", nest: B{ y: 3, nest: A{ x: 9 } } };
  }
}
