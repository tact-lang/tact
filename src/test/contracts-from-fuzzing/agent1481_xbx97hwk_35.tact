// Large nested struct tree with mixed serialization
struct S3 {
  a: Int as uint8;
  b: Int;
}

struct S2 {
  s3a: S3;
  s3b: S3;
}

struct S1 {
  s2: S2;
  x: Int as int16;
}

contract DeepSerTest {
  root: S1;
  init() {
    self.root = S1{
      s2: S2{
        s3a: S3{ a:1, b:2 },
        s3b: S3{ a:3, b:4 }
      },
      x:5
    };
  }
}