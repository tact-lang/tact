struct Nested1 {
  x: Int;
}

struct Nested2 {
  y: Int;
  z: Nested1;
}

struct Nested3 {
  t: Nested2;
  u: Nested1;
}

contract NestedStructVars {
  a: Nested3;

  init() {
    self.a = Nested3{
      t: Nested2{ y: 5, z: Nested1{ x: 1 } },
      u: Nested1{ x: 2 }
    };
  }
}