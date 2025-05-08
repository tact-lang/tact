struct S4 { val: Int; }
struct S3 { s4: S4; }
struct S2 { s3: S3; }
struct S1 { s2: S2; }

contract DeepChain {
  data: S1;

  init() {
    self.data = S1{ s2: S2{ s3: S3{ s4: S4{ val: 555 } } } };
  }
}