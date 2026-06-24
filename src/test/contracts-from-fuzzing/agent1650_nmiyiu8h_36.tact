struct S1 { a: Int; }

struct S2 {
  x: Int;
  s: S1;
}

struct S3 {
  y: Int;
  s2: S2;
}

contract OptionalMidLevel {
  main: S3?;

  init() {
    self.main = null;
  }
}