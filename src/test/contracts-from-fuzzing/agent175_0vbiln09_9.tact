struct S1 { val: Int }
struct S2 { s1: S1 }
struct S3 { s2: S2 }

contract Test {
  f1: Int;
  s3: S3;

  init() {
    self.f1 = 123;
    self.s3 = S3{ s2: S2{ s1: S1{ val: 456 } } };
  }
}