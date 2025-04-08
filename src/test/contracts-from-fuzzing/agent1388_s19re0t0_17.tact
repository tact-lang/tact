struct S3 {
  z: Int as uint4;
}

struct S2 {
  y: S3;
}

struct S1 {
  x: S2;
}

contract NestedAnnots {
  stuff: S1;

  init() {
    self.stuff = S1{ x: S2{ y: S3{ z: 12 } } };
  }
}
