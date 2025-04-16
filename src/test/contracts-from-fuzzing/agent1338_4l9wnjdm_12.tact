struct NestedA {
  x: Int;
}

struct NestedB {
  a: NestedA;
  y: Int;
}

struct NestedC {
  b: NestedB;
  z: Int;
}

contract OptionalDeepStruct {
  maybe: NestedC?;

  init() {
    self.maybe = null;
  }
}