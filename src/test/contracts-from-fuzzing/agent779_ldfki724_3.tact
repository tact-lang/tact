struct S1 {
  a: Int;
}

struct S2 {
  b: Bool;
  s1: S1;
}

struct S3 {
  s2: S2;
  c: Int?;
}

contract ManyNestings {
  field: S3;

  init() {
    self.field = S3{
      s2: S2{ b: true, s1: S1{ a: 7 } },
      c: null
    };
  }
}