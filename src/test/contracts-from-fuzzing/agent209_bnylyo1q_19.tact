struct S1 {
  a: Int;
}

struct S2 {
  b: S1?;
}

struct S3 {
  c: S2?;
}

contract TestContract {
  d: S3;

  init() {
    self.d = S3{ c: null };
  }
}