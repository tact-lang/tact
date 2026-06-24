struct S1 {
  x: Int;
}

struct S2 {
  s1: S1;
  y: Int?;
}

struct S3 {
  s2: S2;
  z: Int;
}

contract TestContract {
  s3: S3;

  init() {
    self.s3 = S3{
      s2: S2{
        s1: S1{ x: 42 },
        y: null
      },
      z: 100
    };
  }
}