struct S1 {
  f: Int;
}

struct S2 {
  s: S1?;
}

struct S3 {
  s2: S2?;
}

contract OptionalChainAssignTest {
  data: S3;
  init() {
    self.data = S3{ s2: null };
  }
  receive() {
    self.data = S3{ s2: S2{ s: S1{ f: 1 } } };
  }
}