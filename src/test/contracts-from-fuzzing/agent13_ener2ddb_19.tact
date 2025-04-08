struct S1 {
  a: Int;
}
struct S2 {
  b: Int;
}
struct S3 {
  c: Int;
}
struct BigNest {
  s1: S1;
  s2: S2;
  s3: S3;
}

contract MultiNest {
  v: BigNest;

  init() {
    self.v = BigNest{
      s1: S1{a: 11},
      s2: S2{b: 22},
      s3: S3{c: 33}
    };
  }
}