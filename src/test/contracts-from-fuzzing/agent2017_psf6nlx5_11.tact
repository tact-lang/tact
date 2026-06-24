struct S1 {
  x: Int;
}

struct S2 {
  y: S1;
}

struct S3 {
  z: S2;
}

contract DeepEmb {
  f: S3;

  init() {
    self.f = S3{
      z: S2{
        y: S1{ x: 13 },
      }
    };
  }
}
