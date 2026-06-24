struct S1 {
  a: Int;
}

struct S2 {
  s1: S1;
  b: Int;
}

struct S3 {
  s1: S1;
  s2: S2;
  c: Int;
}

contract TestContract {
  f1: S1;
  f2: S2;
  f3: S3;

  init() {
    self.f1 = S1{a:1};
    self.f2 = S2{ s1: S1{a:2}, b:3 };
    self.f3 = S3{ s1: S1{a:4}, s2: S2{ s1: S1{a:5}, b:6 }, c:7 };
  }
}