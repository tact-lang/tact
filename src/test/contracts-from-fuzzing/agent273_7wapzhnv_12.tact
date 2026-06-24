struct S1 { x: Int }
struct S2 { y: Int }
struct S3 { z: Int }

struct Wrap {
  s1: S1;
  s2: S2;
  s3: S3;
}

contract TestContract {
  w: Wrap;

  init() {
    self.w = Wrap{
      s1: S1{ x: 1 },
      s2: S2{ y: 2 },
      s3: S3{ z: 3 }
    };
  }
}