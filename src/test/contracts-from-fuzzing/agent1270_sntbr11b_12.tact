struct A {
  x: Int;
}

struct B {
  y: A;
}

struct C {
  z: B;
}

struct D {
  w: C;
}

contract DeepWrap {
  f: D = D{ w: C{ z: B{ y: A{ x: 123 } } } };
}
