struct S1 { a: Int; }
struct S2 { a: S1; }
struct S3 { a: S2; }
contract SChain {
  s: S3 = S3{ a: S2{ a: S1{ a: 456 } } };

  init() {
    self.s = S3{ a: S2{ a: S1{ a: 789 } } };
  }
}