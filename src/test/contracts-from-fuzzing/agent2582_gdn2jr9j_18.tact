struct S1 {
  a: Int;
}

struct S2 {
  s: S1;
  b: Int;
}

struct S3 {
  s2: S2;
  c: Int;
}

contract Test {
  field: S3;

  init() {
    self.field = S3{
      s2: S2{
        s: S1{a:123},
        b:456,
      },
      c:789,
    };
  }
}
