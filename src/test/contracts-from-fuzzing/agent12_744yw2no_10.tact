struct S1 {
  f1: Int;
}

struct S2 {
  s1: S1;
  f2: Int?;
}

struct S3 {
  s2: S2;
  f3: Bool;
}

contract TestCrossNested {
  storage: S3;

  init() {
    self.storage = S3{
      s2: S2{
        s1: S1{ f1: 111 },
        f2: null
      },
      f3: true
    };
  }
}
