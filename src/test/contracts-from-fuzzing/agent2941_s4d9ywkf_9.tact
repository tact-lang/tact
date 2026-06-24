struct S1 {
  x1: Int; y1: Bool; z1: String;
}

struct S2 {
  s1: S1; x2: Int; y2: Bool; z2: String;
}

struct S3 {
  s2: S2; x3: Int; y3: Bool; z3: String;
}

contract NestedWide {
  data: S3;

  init() {
    self.data = S3{
      s2: S2{
        s1: S1{
          x1: 11, y1: true, z1: "a",
        },
        x2: 22, y2: false, z2: "b",
      },
      x3: 33, y3: true, z3: "c",
    };
  }
}