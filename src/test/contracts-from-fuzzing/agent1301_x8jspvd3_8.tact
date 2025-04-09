struct S1 {
  a: Int;
}

struct S2 {
  a: Int;
  s1: S1;
}

struct S3 {
  a: Int;
  s2: S2;
}

struct S4 {
  a: Int;
  s3: S3;
}

contract TestContract {
  s4: S4;
  init() {
    self.s4 = S4{ a:1, s3: S3{ a:2, s2: S2{ a:3, s1: S1{ a:4 } } } };
  }
}