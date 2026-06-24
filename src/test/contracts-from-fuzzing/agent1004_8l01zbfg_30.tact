struct S {
  f1: Int?;
  f2: S1?;
}

struct S1 {
  f3: Int?;
  f4: S2?;
}

struct S2 {
  f5: Int?;
  f6: S3?;
}

struct S3 {
  f7: Int?;
}

contract C {
  data: S?;

  init() {
    self.data = null;
  }
}