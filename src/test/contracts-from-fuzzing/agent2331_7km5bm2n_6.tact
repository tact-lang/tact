struct S1 {
  a: Int;
  b: Bool;
  c: String;
}

struct S2 {
  d: Int;
  e: Bool;
  f: String;
}

struct S3 {
  s1: S1;
  s2: S2;
}

contract Test {
  s3: S3;
  init() {
    self.s3 = S3{
      s1: S1{a: 1, b: true, c: "A"},
      s2: S2{d: 2, e: false, f: "B"}
    };
  }
}