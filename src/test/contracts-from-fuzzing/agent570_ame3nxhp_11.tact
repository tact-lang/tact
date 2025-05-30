struct S3 {
  q: Bool;
}

struct S2 {
  p: S3?;
}

struct S1 {
  r: S2?;
}

contract Test {
  v: S1;

  init() {
    self.v = S1{ r: null };
  }
}