struct S1 { a: Int; }
struct S2 { b: Int; }
struct S3 { s1: S1; s2: S2; }

contract MultipleStructFields {
  f1: S1;
  f2: S2;
  f3: S3;

  init() {
    self.f1 = S1{ a: 1 };
    self.f2 = S2{ b: 2 };
    self.f3 = S3{ s1: self.f1, s2: self.f2 };
  }
}