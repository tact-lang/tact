struct S1 { a: Int; }
struct S2 { s1a: S1; s1b: S1; }
struct S3 { s2a: S2; s2b: S2; }

contract WideNest {
  top: S3;

  init() {
    self.top = S3{
      s2a: S2{ s1a: S1{a:1}, s1b:S1{a:2} },
      s2b: S2{ s1a: S1{a:3}, s1b:S1{a:4} }
    };
  }
}